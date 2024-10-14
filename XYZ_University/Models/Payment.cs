using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace XYZ_University.Models
{
    public class Payment
    {
        public string RegistrationNo { get; set; } = string.Empty;
        public string TransactionNo { get; set; } = string.Empty;
        public DateTime? PaymentDate { get; set; } = null;
        public decimal PaymentAmount { get; set; } = 0.00m;
        public string PaymentMethod { get; set; } = string.Empty;
        public string PaidBy { get; set; } = string.Empty;
        public string Remarks { get; set; } = string.Empty;
    }
}