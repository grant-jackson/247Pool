using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Extensions.Configuration;
using Carfinance.Poolleague.Gateway.Api.Models.v1;
using Carfinance.Poolleague.Gateway.Api.Models;
using Carfinance.Poolleague.Api.Services.v1.Interfaces;
using Carfinance.Poolleague.Api.Models.v1;

namespace Carfinance.Poolleague.Gateway.Api.Controllers.v1
{
    [Produces("application/json")]
    //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    [Route("api/v1/[controller]")]
    public class UsersController : Controller
    {
        private readonly IConfiguration _configuration;
        private readonly Serilog.ILogger _logger;
        private readonly IUserService _userService;

        public UsersController(IConfiguration configuration, Serilog.ILogger logger, IUserService userService)
        {
            _configuration = configuration;
            _logger = logger.ForContext<UsersController>();
            _userService = userService;
        }

        [HttpGet("")]
        [ProducesResponseType(typeof(User), 200)]
        [ProducesResponseType(typeof(NotFoundResult), 404)]
        [ProducesResponseType(typeof(Error), 500)]
        public async Task<IActionResult> GetAll()
        {
            var item = await _userService.GetAllAsync();
            if (item == null)
            {
                return NotFound();
            }
            return new ObjectResult(item);
        }

        [HttpGet("{id}")]
        [ProducesResponseType(typeof(User), 200)]
        [ProducesResponseType(typeof(NotFoundResult), 404)]
        [ProducesResponseType(typeof(Error), 500)]
        public async Task<IActionResult> Get(int id)
        {
            var item = await _userService.GetAsync(id);
            if (item == null)
            {
                return NotFound();
            }
            return new ObjectResult(item);
        }


        [HttpPost]
        [Route("", Name = "UserCreate")]
        [ProducesResponseType(typeof(CreateResponse), 201)]
        [ProducesResponseType(typeof(Error), 422)]
        [ProducesResponseType(typeof(Error), 500)]
        public async Task<IActionResult> Create([FromBody] User user)
        {

            if (user == null) return BadRequest(new Error(ModelState, "Invalid body content"));
            if (!ModelState.IsValid) return new ValidationResult(ModelState);

            await _userService.CreateAsync(user);

            return CreatedAtRoute("UserCreate", new CreateResponse { Id = user.Id.ToString() });
        }

        [HttpPut("{id}")]
        [ProducesResponseType(typeof(NoContentResult), 204)]
        [ProducesResponseType(typeof(NotFoundResult), 404)]
        [ProducesResponseType(typeof(Error), 422)]
        [ProducesResponseType(typeof(Error), 500)]
        public async Task<IActionResult> Update(int id, [FromBody]User user)
        {
            if (user == null) return BadRequest(new Error(ModelState, "Invalid body content"));
            if (id != user.Id) return BadRequest(new Error(ModelState, "The the model Id is different to the url Id"));

            if (!ModelState.IsValid) return new ValidationResult(ModelState);

            await _userService.UpdateAsync(user);

            return new NoContentResult();
        }

        //[HttpDelete("{id}")]
        //[ProducesResponseType(typeof(NoContentResult), 204)]
        //[ProducesResponseType(typeof(NotFoundResult), 404)]
        //[ProducesResponseType(typeof(Error), 500)]
        //public async Task<IActionResult> Delete(int id)
        //{
        //    throw new NotImplementedException();
        //}
    }
}
