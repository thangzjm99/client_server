using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Ban_Hang_Dien_Tu_CNWeb.Models
{
    public class LoginModel
    {
        [Key]
        [Display(Name="Username")]
        [Required(ErrorMessage ="Please fill you username")]
        public string username{ set; get; }

        [Display(Name = "Password")]
        [Required(ErrorMessage = "Please fill you password")]
        public string password { set; get; }
    }
}