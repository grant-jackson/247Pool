using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Carfinance.Poolleague.Gateway.Api.Models
{
    public class ValidationResult : ObjectResult
    {

        public ValidationResult(ModelStateDictionary modelState)
            : base(new Error(modelState, "Validation Failure"))
        {
            StatusCode = StatusCodes.Status422UnprocessableEntity;
        }
    }
}
