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
    public class MatchesController : Controller
    {
        private readonly IConfiguration _configuration;
        private readonly Serilog.ILogger _logger;
        private readonly IMatchService _matchService;
        private readonly IUserService _userService;

        public MatchesController(IConfiguration configuration, Serilog.ILogger logger, IMatchService matchService,
            IUserService userService)
        {
            _configuration = configuration;
            _logger = logger.ForContext<UsersController>();
            _matchService = matchService;
            _userService = userService;
        }

        [HttpPost]
        [Route("", Name = "UserMatch")]
        [ProducesResponseType(typeof(CreateResponse), 201)]
        [ProducesResponseType(typeof(Error), 422)]
        [ProducesResponseType(typeof(Error), 500)]
        public async Task<IActionResult> Create([FromBody] Match match)
        {

            if (match == null) return BadRequest(new Error(ModelState, "Invalid body content"));
            if (!ModelState.IsValid) return new ValidationResult(ModelState);

            await _matchService.CreateAsync(match);

            var winner = _userService.GetAsync(match.WinnerId);

            var loser = _userService.GetAsync(match.LoserId);

            //calculate score

            //log result to slack


            return CreatedAtRoute("UserMatch", new CreateResponse { Id = match.Id.ToString() });
        }

    }
}
