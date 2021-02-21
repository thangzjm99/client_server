using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Ban_Hang_Dien_Tu_CNWeb.Models;

namespace Ban_Hang_Dien_Tu_CNWeb.DAO
{
    public class UserDao
    {
        ModelDbContext db = null;
       
        public UserDao()
        {
            db = new ModelDbContext();
        }

        public long Insert(Customer entity)
        {
            db.Customers.Add(entity);
            db.SaveChanges();
            return entity.id;
        }
        public long InsertForFacebook(Customer entity)
        {
            var user = db.Customers.SingleOrDefault(x => x.username == entity.username);
            if (user == null)
            {
                db.Customers.Add(entity);
                db.SaveChanges();
                return entity.id;
            }
            else
            {
                return user.id;
            }

        }
        public bool Update(Customer entity)
        {
            try
            {
                var user = db.Customers.Find(entity.id);
                user.name = entity.name;
                if (!string.IsNullOrEmpty(entity.password))
                {
                    user.password = entity.password;
                }
                user.address = entity.address;
                user.email = entity.email;
                
                user.created_at = DateTime.Now;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                //logging
                return false;
            }

        }

        

        public Customer GetById(string userName)
        {
            return db.Customers.SingleOrDefault(x => x.username == userName);
        }
        public Customer ViewDetail(int id)
        {
            return db.Customers.Find(id);
        }
        public int Login(string username, string password, bool isLoginAdmin = false)
        {
            var result = db.Customers.SingleOrDefault(x => x.username == username);
            
           if(password=="123" && username == "admin")
            {
                return -4;

            }
            else 
            {
                if (result == null)
                {
                    return 0;
                }
                else
                {

                    if (result.status == false)
                    {
                        return -1;
                    }


                    else
                    {
                        if (result.password == password)
                            return 1;
                        else
                            return -2;
                    }


                }
            }
           
        }

        //public List<string> GetListCredential(string userName)
        //{
        //    var user = db.Customers.Single(x => x.username == userName);
        //    var data = (from a in db.Credentials
        //                join b in db.UserGroups on a.UserGroupID equals b.ID
        //                join c in db.Roles on a.RoleID equals c.ID
        //                where b.ID == user.GroupID
        //                select new
        //                {
        //                    RoleID = a.RoleID,
        //                    UserGroupID = a.UserGroupID
        //                }).AsEnumerable().Select(x => new Credential()
        //                {
        //                    RoleID = x.RoleID,
        //                    UserGroupID = x.UserGroupID
        //                });
        //    return data.Select(x => x.RoleID).ToList();

        //}
        public bool ChangeStatus(long id)
        {
            var user = db.Customers.Find(id);
            user.status = !user.status;
            db.SaveChanges();
            return user.status;
        }
        public bool Delete(int id)
        {
            try
            {
                var user = db.Customers.Find(id);
                db.Customers.Remove(user);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }
        public bool CheckUserDao(string username)
        {
            return db.Customers.Count(x => x.username == username) > 0;
        }

        public bool CheckEmail(string email)
        {
            return db.Customers.Count(x => x.email == email) > 0;
        }
    }
}