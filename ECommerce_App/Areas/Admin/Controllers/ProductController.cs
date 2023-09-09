using ECommerce_App.DataAccess.Repository.IRepository;
using ECommerce_App.Models;
using ECommerce_App.Models.ViewModels;
using ECommerce_App.Utility;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Data;

namespace ECommerce_App.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = SD.Role_Admin)]
    public class ProductController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IWebHostEnvironment _webHostEnvironment;
        public ProductController(IUnitOfWork unitOfWork, IWebHostEnvironment webHostEnvironment)
        {
            _unitOfWork = unitOfWork;
            _webHostEnvironment = webHostEnvironment;
        }
        public IActionResult Index()
        {
            List<Product> objproductList = _unitOfWork.product.GetAll(includeProperties: "Category").ToList();
            return View(objproductList);
        }
        //Update + Insert == Upsert
        public IActionResult Upsert(int? Id)
        {
            ProductVM productVM = new ProductVM()
            {
                Product=new Product(),
                CategoryList = _unitOfWork.category.GetAll().Select(u => new SelectListItem
                {
                    Text = u.Name,
                    Value = u.Id.ToString()
                })
            };
            if(Id!=null && Id != 0)
            {
                //update case only
                productVM.Product = _unitOfWork.product.Get(u=>u.Id==Id);
            }
            return  View(productVM);
        }
        [HttpPost]
        public IActionResult Upsert(ProductVM obj,IFormFile? file)
        {
            if (ModelState.IsValid)
            {
                string wwwRootPath = _webHostEnvironment.WebRootPath;
                if(file != null)
                {
                    string fileName=Guid.NewGuid().ToString()+Path.GetExtension(file.FileName);
                    string productPath=Path.Combine(wwwRootPath, @"images\product",fileName);
                    if (!string.IsNullOrEmpty(obj.Product.ImageUrl))
                     {
                        var oldImagePath=Path.Combine(wwwRootPath,obj.Product.ImageUrl.TrimStart('\\'));
                        if(System.IO.File.Exists(oldImagePath))
                        {
                            System.IO.File.Delete(oldImagePath);
                        }
                    }
                    using(var fileStram=new FileStream(productPath, FileMode.Create))
                    {
                        file.CopyTo(fileStram);
                    }
                    obj.Product.ImageUrl = @"\images\product\" + fileName;
                }
                if (obj.Product.Id == 0)
                {
                    _unitOfWork.product.Add(obj.Product);
                    TempData["success"] = "Product created Successfully.";
                }
                else
                {
                    _unitOfWork.product.Update(obj.Product);
                    TempData["success"] = "Company updated Successfully.";
                }
                _unitOfWork.Save();
                return RedirectToAction("index");
            }
            else
            {
                obj.CategoryList=_unitOfWork.category.GetAll().Select(u => new SelectListItem
                {
                    Text = u.Name,
                    Value = u.Id.ToString()
                });
                return View(obj);
            }
        }
        //Web Api only
        #region API CALLS
        [HttpGet]
        public IActionResult GetAll()
        {
            List<Product> objproductList = _unitOfWork.product.GetAll(includeProperties: "Category").ToList();
            return Json(new { data = objproductList });
        }
        [HttpDelete]
        public IActionResult Delete(int? Id)
        {
            var productToBeDeleted=_unitOfWork.product.Get(u=>u.Id == Id);
            if (productToBeDeleted==null)
            {
                return Json(new { success = false, message = "Error while deleting." });
            }
            var oldImagePath = Path.Combine(_webHostEnvironment.WebRootPath,productToBeDeleted.ImageUrl.TrimStart('\\'));
            if (System.IO.File.Exists(oldImagePath))
            {
                System.IO.File.Delete(oldImagePath);
            }
            _unitOfWork.product.Remove(productToBeDeleted);
            _unitOfWork.Save();
            TempData["success"] = "Deleted Successfully.";
            return Json(new { success = true, message = "Delete Successfully" });
        }
        #endregion
    }
}
