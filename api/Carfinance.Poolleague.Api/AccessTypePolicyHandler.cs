using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.ObjectModel;
using System.Linq;
using System.Reflection;
using System.Security.Claims;
using System.Threading.Tasks;

namespace Carfinance.Poolleague.Gateway.Api
{
    public enum AccessType
    {
        IntranetUser = 1,
        Client = 2,
        Customer = 3,
        AffiliateUser = 4
    }

    public class AccessTypeRequirement : IAuthorizationRequirement
    {
        public AccessType[] AllowedAccessTypeIds;
        public string ClientId; 

        public AccessTypeRequirement(AccessType[] allowedAccessTypesIds, string clientId)
        {
            AllowedAccessTypeIds = allowedAccessTypesIds;
            ClientId = clientId;
        }
    }

    public class AccessTypePolicyHandler : AuthorizationHandler<AccessTypeRequirement>
    {
        protected override Task HandleRequirementAsync(AuthorizationHandlerContext context, AccessTypeRequirement requirement)
        {
            ClaimsPrincipal principal = context.User as ClaimsPrincipal;

            var accessTypeIdClaim = principal.Claims.FirstOrDefault(c => c.Type == "accessType");
            if (accessTypeIdClaim == null) return Task.CompletedTask;

            if (!requirement.AllowedAccessTypeIds.Contains(((AccessType)int.Parse(accessTypeIdClaim.Value))))
                return Task.CompletedTask;

            if (accessTypeIdClaim.Value == AccessType.Client.ToString("d"))
            {
                if (principal.HasClaim("allowedClients", requirement.ClientId))
                {
                    context.Succeed(requirement);
                    return Task.CompletedTask;
                }
            }

            return Task.CompletedTask;
        }

        private AccessType GetAccessTypeFromClaim(Claim claim)
        {
            return (AccessType)int.Parse(claim.Value);
        }
    }

    public class AccessTypeAttributeRequirement : IAuthorizationRequirement
    {
        public string ClientId;

        public AccessTypeAttributeRequirement(string clientId)
        {
            ClientId = clientId;
        }
    }

    public class AccessTypePolicyAttributeHandler : AuthorizationHandler<AccessTypeAttributeRequirement>
    {
        protected override Task HandleRequirementAsync(AuthorizationHandlerContext context, AccessTypeAttributeRequirement requirement)
        {
            try
            {
                var AllowedAccessTypeIds = GetTheFirstConstructorValueForAuthorizeAllowedAccessTypeAtrribute(context);

                //TODO duplicate code
                ClaimsPrincipal principal = context.User as ClaimsPrincipal;

                var accessTypeIdClaim = principal.Claims.FirstOrDefault(c => c.Type == "accessType");
                if (accessTypeIdClaim == null) return Task.CompletedTask;

                if (AllowedAccessTypeIds.Contains(((AccessType)int.Parse(accessTypeIdClaim.Value))))
                    return Task.CompletedTask;

                if (accessTypeIdClaim.Value == AccessType.Client.ToString("d"))
                {
                    if (principal.HasClaim("allowedClients", requirement.ClientId))
                    {
                        context.Succeed(requirement);
                        return Task.CompletedTask;
                    }
                }

                return Task.CompletedTask;

            }
            catch(Exception ex)
            {
                return Task.CompletedTask;
            }
        }

        private AccessType[] GetTheFirstConstructorValueForAuthorizeAllowedAccessTypeAtrribute(AuthorizationHandlerContext context)
        {

            var authFilterContext = context.Resource as AuthorizationFilterContext;
            var descriptor = authFilterContext?.ActionDescriptor as ControllerActionDescriptor;
            var customAttributes = descriptor.ControllerTypeInfo.CustomAttributes;

            var attribute = customAttributes.Where(a => a.AttributeType == typeof(AuthroizeAllowedAccessTypeAttribute)).FirstOrDefault();
            var args = (ReadOnlyCollection<CustomAttributeTypedArgument>)attribute.ConstructorArguments[0].Value;
            var AllowedAccessTypeIds = args.Select(x => (AccessType)x.Value).ToList();

            return AllowedAccessTypeIds.ToArray();

        }
    }

    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = false, Inherited = true)]
    public sealed class AuthroizeAllowedAccessTypeAttribute : AuthorizeAttribute
    {
        public AuthroizeAllowedAccessTypeAttribute(AccessType[] allowedAccessTypes)
        {

        }
    }


}