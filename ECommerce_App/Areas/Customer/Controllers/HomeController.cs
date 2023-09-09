using ECommerce_App.DataAccess.Repository.IRepository;
using ECommerce_App.Models;
using ECommerce_App.Utility;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Security.Claims;

namespace ECommerce_App.Areas.Customer.Controllers
{
    [Area("Customer")]
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IUnitOfWork _unitOfWork;

        public HomeController(ILogger<HomeController> logger,IUnitOfWork unitOfWork)
        {
            _logger = logger;
            _unitOfWork = unitOfWork;
        }
        public IActionResult Index()
        {
            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var claim = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier);
            if(claim != null)
            {
                HttpContext.Session.SetInt32(SD.SessionCart,
                    _unitOfWork.shoppingCart.GetAll(u => u.ApplicationUserId == claim.Value).Count());
            }
            IEnumerable<Product> productList=_unitOfWork.product.GetAll(includeProperties:"Category");
            return View(productList);
        }
        public IActionResult Details(int productId)
        {
            ShoppingCart Scart = new ShoppingCart() 
            {
                Product=_unitOfWork.product.Get(u=>u.Id==productId,includeProperties:"Category"),
                ProductId=productId,
                Count=1
            };
            return View(Scart);
        }
        [HttpPost]
        [Authorize]
        public IActionResult Details(ShoppingCart shoppingCart)
        {
            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier).Value;
            shoppingCart.ApplicationUserId = userId;
            
            ShoppingCart cartFromDb=_unitOfWork.shoppingCart.Get(u=>u.ApplicationUserId==userId && u.ProductId==shoppingCart.ProductId);
            if(cartFromDb!=null)
            {
                //shopping cart exists
                cartFromDb.Count += shoppingCart.Count;
                _unitOfWork.shoppingCart.Update(cartFromDb);
                _unitOfWork.Save();
            }
            else
            {
                //add cart exists
                _unitOfWork.shoppingCart.Add(shoppingCart);
                _unitOfWork.Save();
                HttpContext.Session.SetInt32(SD.SessionCart,
                    _unitOfWork.shoppingCart.GetAll(u => u.ApplicationUserId == userId).Count());
            }
            return RedirectToAction(nameof(Index));
        }
        public IActionResult Privacy()
        {
            return View();
        }
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}