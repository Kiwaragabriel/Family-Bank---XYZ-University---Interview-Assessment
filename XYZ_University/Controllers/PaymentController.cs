using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using XYZ_University.Models;

namespace XYZ_University.Controllers
{
    [RoutePrefix("Payment")]
    public class PaymentController : ApiController
    {
        XYZ_UniversityEntities db = new XYZ_UniversityEntities();
        // receive notification and process payment
        [Route("Notification"), HttpPost]
        public async Task<IHttpActionResult> PaymentNotification(Payment payment)
        {
            Result result = new Result();
            result.IsSuccess = false;
            result.ErrorDescription = "";

            if (payment == null)
            {
                return BadRequest("Invalid Payment Details");
            }
            if (string.IsNullOrEmpty(payment.RegistrationNo))
            {
                return BadRequest("Invalid Registration No");
            }
            if (string.IsNullOrEmpty(payment.TransactionNo))
            {
                return BadRequest("Invalid Transaction No");
            }
            if (!payment.PaymentDate.HasValue)
            {
                return BadRequest("Payment Date is required");
            }
            if (payment.PaymentAmount == null || payment.PaymentAmount <= 0)
            {
                return BadRequest("Invalid Payment Amount");
            }
            if (string.IsNullOrEmpty(payment.PaymentMethod))
            {
                return BadRequest("Invalid Payment Method");
            }
            if (string.IsNullOrEmpty(payment.PaidBy))
            {
                return BadRequest("Invalid Paid By");
            }

            try
            {
                //verify security details ie. api username, key and access token
                //can be made to be dynamic - call a different end point eg. /auth/getAccessToken before accessing other end points
                var APIUserName = Request.Headers.GetValues("APIUserName").FirstOrDefault();
                var APIKey = Request.Headers.GetValues("APIKey").FirstOrDefault();
                var AccessToken = Request.Headers.GetValues("AccessToken").FirstOrDefault();

                if (string.IsNullOrEmpty(APIUserName) || string.IsNullOrEmpty(APIKey) || string.IsNullOrEmpty(AccessToken))
                {
                    return BadRequest("Invalid Authentication");
                }

                var dbAccessToken = db.proc_verifyAccessDetails(APIUserName, APIKey, AccessToken).FirstOrDefault();
                if (dbAccessToken == null)
                {
                    return BadRequest("Invalid Authentication");
                }

                //check if student exists
                var dbStudent = (from a in db.tblStudents where a.RegistrationNo == payment.RegistrationNo select a).FirstOrDefault();
                if (dbStudent == null)
                {
                    return BadRequest("Invalid Student Details - Registration No. not found");
                }
                //check for duplicate transaction details
                var dbExistingPayment = (from a in db.tblTuitionFeePayments where a.TransactionNo == payment.TransactionNo select a).FirstOrDefault();
                if (dbExistingPayment != null)
                {
                    return BadRequest("Duplicate Transaction Error - The passed Transaction No exists");
                }
                var dbPayment = db.proc_addTuitionFeePayment(payment.RegistrationNo, payment.TransactionNo, payment.PaymentDate, payment.PaymentAmount, payment.PaymentMethod, payment.PaidBy, payment.Remarks).FirstOrDefault();
                if (dbPayment == null)
                {
                    return InternalServerError(new Exception("Payment processing not successful"));
                }
                result.IsSuccess = true;
                result.ErrorDescription = "";
                result.Content = dbPayment;
                return Ok(result);
            }
            catch (Exception ex)
            {
                result.ErrorDescription = ex.Message;
                result.IsSuccess = false;
                return Ok(result);
            }
        }
    }
}
