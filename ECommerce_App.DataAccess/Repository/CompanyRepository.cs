using ECommerce_App.DataAccess.Repository.IRepository;
using ECommerce_App.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce_App.DataAccess.Repository
{
    public class CompanyRepository:Repository<Company>,ICompanyRepository
    {
        private readonly ApplicationDbContext _db;
        public CompanyRepository(ApplicationDbContext db):base(db)
        {
            _db = db;
        }
        public void Update(Company obj)
        {
            _db.Companies.Update(obj);
        }
    }
}
