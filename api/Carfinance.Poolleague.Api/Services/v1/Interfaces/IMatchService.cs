using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Carfinance.Poolleague.Api.Services.v1.Interfaces
{
    public interface IMatchService
    {
        Task CreateAsync(Match match);
    }
}
