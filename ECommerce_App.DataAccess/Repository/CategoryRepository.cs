using ECommerce_App.DataAccess.Repository.IRepository;
using ECommerce_App.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce_App.DataAccess.Repository
{
    public class CategoryRepository:Repository<Category>,ICategoryRepository
    {
        private readonly ApplicationDbContext _db;
        public CategoryRepository(ApplicationDbContext db):base(db)
        {
            _db = db;
        }
        public void Update(Category obj)
        {
            _db.Categories.Update(obj);
        }
    }
}
