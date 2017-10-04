using Carfinance.Poolleague.Gateway.Api.Models;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using Serilog;
using System;
using System.Net;
using System.Threading.Tasks;

namespace Carfinance.Poolleague.Gateway.Api.Middleware
{
    public class ErrorHandlingMiddleware
    {
        private readonly RequestDelegate next;
        private readonly ILogger _logger;

        public ErrorHandlingMiddleware(RequestDelegate next, ILogger logger)
        {
            this.next = next;
            _logger = logger;
        }

        public async Task Invoke(HttpContext context /* other scoped dependencies */)
        {
            try
            {
                await next(context);
            }
            catch (Exception ex)
            {
                await HandleExceptionAsync(context, ex);
            }
        }

        private Task HandleExceptionAsync(HttpContext context, Exception exception)
        {
            var code = HttpStatusCode.InternalServerError;

            var errorResponse = new Error(null, exception.Message);

            var result = JsonConvert.SerializeObject(errorResponse,
                                Formatting.None,
                                new JsonSerializerSettings
                                {
                                    NullValueHandling = NullValueHandling.Ignore
                                });

            context.Response.ContentType = "application/json";
            context.Response.StatusCode = (int)code;

            _logger.Error(exception, exception.Message);

            return context.Response.WriteAsync(result);
        }
    }
}