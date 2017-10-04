using Serilog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Carfinance.Poolleague.Gateway.Api.Extentions
{
    public static class SerilogExtentions
    {
        public static ILogger With(this ILogger logger, string category, int? AssociationId = null, string AssociationValue = null)
        {
            return logger
            .ForContext("Category", category, true)
            .ForContext("AssociationId", AssociationId, true)
            .ForContext("AssociationValue", AssociationValue, true);
        }

    }
}
