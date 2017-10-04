using Carfinance.Poolleague.Api.Models.v1;
using Carfinance.Poolleague.Gateway.Api.Models.v1;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Carfinance.Poolleague.Gateway.Api.Validators
{
    public class UserValidator : AbstractValidator<User>
    {
        public UserValidator()
        {          
            RuleFor(user => user.NickName).NotNull().WithMessage("NickName is required");
            RuleFor(user => user.FirstName).NotNull().WithMessage("NickName is required");
            RuleFor(user => user.Surname).NotNull().WithMessage("NickName is required");
        }
    }
}
