using Microsoft.AspNetCore.Mvc.ModelBinding;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Carfinance.Poolleague.Gateway.Api.Models
{
    public class ValidationError
    {
        [JsonProperty(NullValueHandling = NullValueHandling.Ignore)]
        public string Field { get; }
        public string Message { get; }

        public ValidationError(string field, string message, Exception ex)
        {
            Field = field != string.Empty ? field : null;
            Message = message ;

            if (ex != null)   message =  string.IsNullOrWhiteSpace(ex.Message) ? ex.Message : ". " + ex.Message;

        }
    }

}
