using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace Carfinance.Poolleague.Gateway.Api.Services
{
    public interface IDbConnectionFactory
    {
        IDbConnection CreateConnection();
    }
}
