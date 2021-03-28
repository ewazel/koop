using System;
using System.Linq;
using Koop.Models;
using Koop.Models.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Server.HttpSys;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion.Internal;
using Microsoft.IdentityModel.Tokens;

namespace Koop.Controllers
{
    public class TestController : Controller
    {
        private IGenericUnitOfWork _uow;

        public TestController(IGenericUnitOfWork genericUnitOfWork)
        {
            _uow = genericUnitOfWork;
        }
        
        [Authorize]
        public IActionResult Index()
        {
            return Ok(new
            {
                Message = "It works",
                Time = DateTime.Now
            });
        }

        public IActionResult Data()
        {
            return Ok(_uow.Repository<SupplierView>().GetAll());
        }
        
        [HttpGet("supplier/{abbr}")]
        public IActionResult Supplier(string abbr)
        {
            return Ok(_uow.Repository<SupplierView>().GetAll().SingleOrDefault(s => s.SupplierAbbr.ToLower() == abbr));
        }
        
        [HttpGet("supplier/{abbr}/edit")]
        public IActionResult EditSupplier(string abbr)
        {
            return Ok(_uow.Repository<SupplierView>().GetAll().SingleOrDefault(s => s.SupplierAbbr.ToLower() == abbr));
        }

        [HttpGet("allsuppliers")]
        public IActionResult AllSuppliers()
        {
            return Ok(_uow.Repository<SupplierView>().GetAll());
        }
        
        [HttpGet("cooperator/{firstname}+{lastname}/history")]
        public IActionResult CoOrderHistoryView(string firstName, string lastName)
        {
            return Ok(_uow.Repository<CoOrderHistoryView>().GetAll().Where(s=>s.FirstName.ToLower() == firstName && s.LastName.ToLower() == lastName));
        }
        
        [HttpGet("order/basketname")]
        public IActionResult BasketName()
        {
            return Ok(_uow.Repository<BasketNameView>().GetAll());
        }
        
        
    }
} 