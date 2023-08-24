using ECommerce_App.DataAccess.Repository.IRepository;
using ECommerce_App.Models;
using ECommerce_App.Models.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace ECommerce_App.Areas.Customer.Controllers
{
    [Area("Customer")]
    [Authorize]
    public class CartController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        public ShoppingCartVM shoppingCartVM { get; set; }
        public CartController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        public IActionResult Index()
        {
            var claimsIdentity = (ClaimsIdentity)User.Identity;
            var userId = claimsIdentity.FindFirst(ClaimTypes.NameIdentifier).Value;
            shoppingCartVM = new ShoppingCartVM()
            {
                ShoppingCartList = _unitOfWork.shoppingCart.GetAll(u => u.ApplicationUserId == userId, includeProperties: "Product")
            };
            foreach (var cart in shoppingCartVM.ShoppingCartList)
            {
                cart.Price = GetPriceBaseOnQuantity(cart);
                shoppingCartVM.OrderTotal += (cart.Price * cart.Count);
            }
            return View(shoppingCartVM);
        }
        public IActionResult Summary()
        {
            return View();
        }
        public IActionResult Plus(int cartId)
        {
            var cartFromDb = _unitOfWork.shoppingCart.Get(u => u.Id == cartId);
            cartFromDb.Count += 1;
            _unitOfWork.shoppingCart.Update(cartFromDb);
            _unitOfWork.Save();
            return RedirectToAction(nameof(Index));
        }
        public IActionResult Minus(int cartId)
        {
            var cartFromDb = _unitOfWork.shoppingCart.Get(u => u.Id == cartId);
            if (cartFromDb.Count <= 1)
            {
                //remove that from cart
                _unitOfWork.shoppingCart.Remove(cartFromDb);
            }
            else
            {
                cartFromDb.Count -= 1;
                _unitOfWork.shoppingCart.Update(cartFromDb);
            }
            _unitOfWork.Save();
            return RedirectToAction(nameof(Index));
        }
        public IActionResult Remove(int cartId)
        {
            var cartFromDb = _unitOfWork.shoppingCart.Get(u => u.Id == cartId);
            _unitOfWork.shoppingCart.Remove(cartFromDb);
            _unitOfWork.Save();
            return RedirectToAction(nameof(Index));
        }
        private double GetPriceBaseOnQuantity(ShoppingCart shoppingCart)
        {
            if (shoppingCart.Count <= 50)
            {
                return shoppingCart.Product.Price;
            }
            else if (shoppingCart.Count <= 100)
            {
                return shoppingCart.Product.Price50;
            }
            else
            {
                return shoppingCart.Product.Price100;
            }
        }
    }
}