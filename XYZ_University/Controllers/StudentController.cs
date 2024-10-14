using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using XYZ_University.Models;

namespace XYZ_University.Controllers
{
    [RoutePrefix("Student")]
    public class StudentController : ApiController
    {
        XYZ_UniversityEntities db = new XYZ_UniversityEntities();
        // GET: Student
        [Route("Verify"), HttpGet]
        public async Task<IHttpActionResult> ValidateStudent(string RegistrationNo)
        {
            Result result = new Result();
            result.IsSuccess = false;
            result.ErrorDescription = "";

            if (string.IsNullOrEmpty(RegistrationNo))
            {
                result.ErrorDescription = "RegistrationNo is required";
                return BadRequest(result.ErrorDescription);
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

                var dbAccessToken = db.proc_verifyAccessDetails(APIUserName,APIKey,AccessToken).FirstOrDefault();
                if (dbAccessToken == null)
                {
                    return BadRequest("Invalid Authentication");
                }

                var student = (from a in db.tblStudents where a.RegistrationNo == RegistrationNo select a).FirstOrDefault();
                if (student == null)
                {
                    return NotFound();
                }
                result.IsSuccess = true;
                result.ErrorDescription = "";
                result.Content = student;
                return Ok(result);
            }
            catch(Exception ex)
            {
                result.ErrorDescription = ex.Message;
                throw new Exception(result.ErrorDescription);
            }
        }
    }
}
