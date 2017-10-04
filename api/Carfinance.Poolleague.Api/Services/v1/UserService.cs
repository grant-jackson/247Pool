using Carfinance.Poolleague.Gateway.Api.Models.v1;
using Carfinance.Poolleague.Gateway.Api.Repository;
using Carfinance.Poolleague.Gateway.Api.Services;
using Carfinance.Poolleague.Api.Models.v1;
using Carfinance.Poolleague.Api.Services.v1.Interfaces;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Carfinance.Poolleague.Api.Services.v1
{
    public class UserService : IUserService
    {
        private readonly IConfiguration _configuration;
        private readonly IDbConnectionFactory _dbConnectionFactory;
        private readonly IGenericRepository<User> _genericRepository;

        public UserService(IConfiguration configuration, IDbConnectionFactory dbConnectionFactory,
            IGenericRepository<User> genericRepository)
        {
            _configuration = configuration;
            _dbConnectionFactory = dbConnectionFactory;
            _genericRepository = genericRepository;
        }

        public async Task CreateAsync(User user)
        {
            await _genericRepository.CreateAsync(user);
        }

        public async Task<IEnumerable<User>> GetAllAsync()
        {
            return await _genericRepository.ListAllAsync();
        }


        public async Task<User> GetAsync(int id)
        {
            return await _genericRepository.GetByIdAsync(id);
        }

        public async Task UpdateAsync(User user)
        {
            await _genericRepository.UpdateAsync(user);
        }
    }
}
