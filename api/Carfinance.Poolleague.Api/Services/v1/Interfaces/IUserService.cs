using Carfinance.Poolleague.Api.Models.v1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Carfinance.Poolleague.Api.Services.v1.Interfaces
{
    public interface IUserService
    {
        Task CreateAsync(User user);
        Task<IEnumerable<User>> GetAllAsync();
        Task<User> GetAsync(int id);
        Task UpdateAsync(User user);
    }
}
