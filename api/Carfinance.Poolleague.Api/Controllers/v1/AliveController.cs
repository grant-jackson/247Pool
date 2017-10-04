using System;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;

namespace Carfinance.Poolleague.Gateway.Api.Controllers.v1
{
    [Route("")]
    public class AliveController : Controller
    {
        private readonly IHostingEnvironment _hostingEnvironment;

        public AliveController(IHostingEnvironment hostingEnvironment)
        {
            _hostingEnvironment = hostingEnvironment;
        }

        [HttpGet]
        public IActionResult Get()
        {
            return Ok($"Funding Gateway ({_hostingEnvironment.EnvironmentName}) \n Status 200 OK \n {DateTime.UtcNow:O} \n {Environment.MachineName}");
        }
    }
}
