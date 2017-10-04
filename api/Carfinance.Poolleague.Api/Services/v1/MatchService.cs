using Carfinance.Poolleague.Api.Services.v1.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Carfinance.Poolleague.Gateway.Api.Services;
using Carfinance.Poolleague.Gateway.Api.Repository;
using Carfinance.Poolleague.Api.Models.v1;
using Microsoft.Extensions.Configuration;

namespace Carfinance.Poolleague.Api.Services.v1
{
    public class MatchService : IMatchService
    {
        private readonly IConfiguration _configuration;
        private readonly IDbConnectionFactory _dbConnectionFactory;
        private readonly IGenericRepository<Match> _genericRepository;

        public MatchService(IConfiguration configuration, IDbConnectionFactory dbConnectionFactory,
            IGenericRepository<Match> genericRepository)
        {
            _configuration = configuration;
            _dbConnectionFactory = dbConnectionFactory;
            _genericRepository = genericRepository;
        }

        public async Task CreateAsync(Match match)
        {
            match.MatchDate = DateTime.Now;
            await _genericRepository.CreateAsync(match);
        }

    }
}
