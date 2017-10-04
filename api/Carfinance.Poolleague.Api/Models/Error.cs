using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Carfinance.Poolleague.Gateway.Api.Models
{
    public class Error
    {
        public string Message { get; }

        public List<ValidationError> ValidationErrors { get; }

        public Error(ModelStateDictionary modelState, string message)
        {
            ValidationErrors = new List<ValidationError>();
            Message = message;
            if(modelState != null)
            { 
                ValidationErrors = modelState.Keys
                        .SelectMany(key => modelState[key].Errors.Select(x => new ValidationError(key, x.ErrorMessage, x.Exception)))
                        .ToList();

            }
        }

    }
}
