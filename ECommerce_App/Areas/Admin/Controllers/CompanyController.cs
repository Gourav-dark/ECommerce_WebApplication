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
    public class CompanyController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        public CompanyController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        public IActionResult Index()
        {
            List<Company> objcompanyList = _unitOfWork.company.GetAll().ToList();
            return View(objcompanyList);
        }
        //Update + Insert == Upsert
        public IActionResult Upsert(int? Id)
        {
            Company obj=new Company();
            if(Id!=null && Id != 0)
            {
                //update case only
                obj = _unitOfWork.company.Get(u=>u.Id==Id);
            }
            return  View(obj);
        }
        [HttpPost]
        public IActionResult Upsert(Company obj,IFormFile? file)
        {
            if (ModelState.IsValid)
            {
                if (obj.Id == 0)
                {
                    _unitOfWork.company.Add(obj);
                    TempData["success"] = "Company created Successfully.";
                }
                else
                {
                    _unitOfWork.company.Update(obj);
                    TempData["success"] = "Company updated Successfully.";
                }
                _unitOfWork.Save();
                return RedirectToAction("index");
            }
            else
            {
                return View(obj);
            }
        }
        //Web Api only
        #region API CALLS
        [HttpGet]
        public IActionResult GetAll()
        {
            List<Company> objcompanyList = _unitOfWork.company.GetAll().ToList();
            return Json(new { data = objcompanyList });
        }
        [HttpDelete]
        public IActionResult Delete(int? Id)
        {
            var companyToBeDeleted=_unitOfWork.company.Get(u=>u.Id == Id);
            if (companyToBeDeleted==null)
            {
                return Json(new { success = false, message = "Error while deleting." });
            }
            _unitOfWork.company.Remove(companyToBeDeleted);
            _unitOfWork.Save();
            TempData["success"] = "Deleted Successfully.";
            return Json(new { success = true, message = "Delete Successfully" });
        }
        #endregion
    }
}
