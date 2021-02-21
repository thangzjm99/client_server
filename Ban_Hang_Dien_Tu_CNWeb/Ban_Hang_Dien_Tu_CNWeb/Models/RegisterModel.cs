using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Ban_Hang_Dien_Tu_CNWeb.Models
{
    public class RegisterModel
    {
        [Key]
        public long id { set; get; }

        [Display(Name="Username")]
        [Required(ErrorMessage ="Required")]
        public string username { set; get; }

        [Display(Name = "Password")]
        [StringLength(20,MinimumLength =3,ErrorMessage ="Minimum password character is 6")]
        [Required(ErrorMessage = "Required")]
        public string password { set; get; }

        [Display(Name = "Confirm Password")]
        [Compare("password",ErrorMessage ="Password doesn't match")]
        public string ConfirmPassword { set; get; }

        [Display(Name = "Full Name")]
        [Required(ErrorMessage = "Required")]
        public string name { set; get; }

        [Display(Name = "Address")]
        public string address { set; get; }

        [Display(Name = "Email")]
        public string email { set; get; }


        [Display(Name = "Phone")]
        public string phone { set; get; }





    }
}