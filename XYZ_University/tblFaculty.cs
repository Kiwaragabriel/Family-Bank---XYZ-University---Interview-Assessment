//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace XYZ_University
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblFaculty
    {
        public tblFaculty()
        {
            this.tblCourses = new HashSet<tblCours>();
        }
    
        public int FacultyId { get; set; }
        public string FacultyName { get; set; }
        public Nullable<System.DateTime> CreatedOn { get; set; }
        public Nullable<int> Creator_UserId { get; set; }
    
        public virtual ICollection<tblCours> tblCourses { get; set; }
        public virtual tblUser tblUser { get; set; }
    }
}
