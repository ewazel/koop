using System;
using System.Linq;
using Koop.Models;
using Koop.Models.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

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
            return Ok(_uow.Repository<SupplierInfoView>().GetAll());
        }
    }
}