using Carfinance.Poolleague.Gateway.Api.Middleware;
using Carfinance.Poolleague.Gateway.Api.Models.v1;
using Carfinance.Poolleague.Gateway.Api.Repository;
using Carfinance.Poolleague.Gateway.Api.Services;
using Carfinance.Poolleague.Api.Services.v1;
using Carfinance.Poolleague.Api.Services.v1.Interfaces;
using FluentValidation.AspNetCore;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Serilog;
using Serilog.Events;
using Serilog.Sinks.Http.BatchFormatters;
using Serilog.Sinks.Http.TextFormatters;
using Swashbuckle.AspNetCore.Swagger;
using System;
using System.IO;
using System.Net.Http;
using System.Text;


namespace Carfinance.Poolleague.Gateway.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            var logger = new LoggerConfiguration()
              .MinimumLevel.Information()
              .Enrich.WithProperty("ClientId", Configuration["ClientId"])
              .WriteTo.LiterateConsole()
              .WriteTo.Logger(l => l.Filter.ByIncludingOnly(e => e.Level == LogEventLevel.Information && IsSourceContext(e, Configuration["ClientId"]))
                               .WriteTo.Http(Configuration["LogApi"] + "/logging"))
              .WriteTo.Logger(l => l.Filter.ByIncludingOnly(e => e.Level == LogEventLevel.Warning && IsSourceContext(e, Configuration["ClientId"]))
                                .WriteTo.Http(Configuration["LogApi"] + "/logging"))
              .WriteTo.Logger(l => l.Filter.ByIncludingOnly(e => e.Level == LogEventLevel.Error && IsSourceContext(e, Configuration["ClientId"]))
                                .WriteTo.Http(Configuration["ErrorApi"] + "/errors"))
              .WriteTo.Logger(l => l.Filter.ByIncludingOnly(e => e.Level == LogEventLevel.Fatal && IsSourceContext(e, Configuration["ClientId"]))
                                .WriteTo.Http(Configuration["ErrorApi"] + "/errors"))
              .CreateLogger();

            services.AddSingleton<Serilog.ILogger>(logger);

            services.AddMvc()
                .AddFluentValidation(fvc =>
                fvc.RegisterValidatorsFromAssemblyContaining<Startup>());

            services.AddAuthorization(options =>
            {
                options.AddPolicy("AccessTypeRequirement",
                                  policy => policy.Requirements.Add(
                                      new AccessTypeRequirement(new AccessType[] { AccessType.IntranetUser, AccessType.Client },
                                      Configuration["ClientId"])
                                  ));

                options.AddPolicy("AccessTypeAttributeRequirement",
                                    policy => policy.Requirements.Add(
                                      new AccessTypeAttributeRequirement(Configuration["ClientId"])
                                  ));
            });

            services.AddTransient<IAuthorizationHandler, AccessTypePolicyHandler>();
            services.AddTransient<IAuthorizationHandler, AccessTypePolicyAttributeHandler>();
            services.AddTransient<IUserService, UserService>();
            services.AddTransient<IDbConnectionFactory>(s => new SqlConnectionFactory(Configuration["ConnectionString"]));
            services.AddTransient(typeof(IGenericRepository<>), typeof(GenericRepository<>));

            services.AddAuthentication()
            .AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;

                cfg.TokenValidationParameters = new TokenValidationParameters()
                {
                    RequireExpirationTime = true,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = false,
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    ValidIssuer = Configuration["AuthApi"],
                    ValidAudience = Configuration["AuthApi"],
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration["JWTVERIFICATIONKEYS"])),
                    ClockSkew = TimeSpan.Zero
                };
            });

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new Info { Title = Configuration["ClientId"], Version = "v1" });
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            app.UseMiddleware<ErrorHandlingMiddleware>();

            app.UseAuthentication();

            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", $"{Configuration["ClientId"]} V1");
            });

            app.UseSwagger();

            app.UseMvc();
        }

        private bool IsSourceContext(LogEvent logEvent, string startsWith)
        {
            LogEventPropertyValue name;

            return logEvent.Properties.TryGetValue("SourceContext", out name)
                &&((name as ScalarValue)?.Value as string).StartsWith(startsWith, StringComparison.InvariantCultureIgnoreCase);
        }
    }
}