using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace XYZ_University.Models
{
    public class Student
    {
       
    }
    public class Result
    {
        public bool? IsSuccess { get; set; }
        public string ErrorDescription { get; set; }
        public dynamic  Content { get; set; }
    }
}