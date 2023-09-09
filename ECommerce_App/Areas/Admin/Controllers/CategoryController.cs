using ECommerce_App.DataAccess.Repository.IRepository;
using ECommerce_App.Models;
using ECommerce_App.Utility;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace ECommerce_App.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles =SD.Role_Admin)]
    public class CategoryController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        public CategoryController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        public IActionResult Index()
        {
            List<Category> objList = _unitOfWork.category.GetAll().ToList();
            return View(objList);
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(Category obj)
        {
            if (obj.Name == obj.DisplayOrder.ToString())
            {
                ModelState.AddModelError("Name", "The Display Order cannot exactly match the Name");
            }
            if (ModelState.IsValid)
            {
                _unitOfWork.category.Add(obj);
                _unitOfWork.Save();
                TempData["success"] = "Category created Successfully.";
                return RedirectToAction("index");
            }
            return View();
        }
        public IActionResult Edit(int? Id)
        {
            if (Id == null && Id == 0)
            {
                return NotFound();
            }
            Category category = _unitOfWork.category.Get(u => u.Id == Id);
            if (category == null)
            {
                return NotFound();
            }
            return View(category);
        }
        [HttpPost]
        public IActionResult Edit(Category obj)
        {
            if (ModelState.IsValid)
            {
                _unitOfWork.category.Update(obj);
                _unitOfWork.Save();
                TempData["success"] = "Category updated Successfully.";
                return RedirectToAction("Index");
            }
            return View();
        }

        public IActionResult Delete(int? Id)
        {
            if (Id == null && Id == 0)
            {
                return NotFound();
            }
            Category category = _unitOfWork.category.Get(u => u.Id == Id);
            if (category == null)
            {
                return NotFound();
            }
            return View(category);
        }
        [HttpPost, ActionName("Delete")]
        public IActionResult DeletePost(int? Id)
        {
            Category? obj = _unitOfWork.category.Get(u => u.Id == Id);
            if (obj == null)
            {
                return NotFound();
            }
            _unitOfWork.category.Remove(obj);
            _unitOfWork.Save();
            TempData["success"] = "Category deleted Successfully.";
            return RedirectToAction("Index");
        }
    }
}
