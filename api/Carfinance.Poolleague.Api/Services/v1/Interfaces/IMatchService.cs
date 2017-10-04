using Carfinance.Poolleague.Api.Models.v1;
using System;
using System.Collections.Generic;
using System.Linq;

using System.Threading.Tasks;

namespace Carfinance.Poolleague.Api.Services.v1.Interfaces
{
    public interface IMatchService
    {
        Task CreateAsync(Match match);
    }
}
