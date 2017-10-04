namespace Carfinance.Poolleague.Gateway.Api.Models
{

    public enum EmploymentStatus
    {
        Unknown = 0,
        EmployedFullTime = 1,
        EmployedPartTime = 2,
        SelfEmployed = 3,
        ArmedForces = 4,
        NotEmployed = 5,
        Retired = 6,
        AgencyWorker = 7,
        ContractWorker = 8,
        SubContractor = 9,
        Disability = 10,
        Housewife = 11,
        Student = 12,
        Carer = 13,
        NonProfessionalCarer = 24
    }

    public enum Gender
    {
        Male = 1,
        Female = 2,
        Unknown = 3
    }

    public enum ProposalStatus
    {
        Processing = 1,
        Declined = 2,
        Accepted = 3,
        Signed = 4,
        Payout = 5,
        Live = 6,
    }

    public enum LoanTier
    {
       Standard = 1
    }

    public enum Title
    {
        Mr = 1,
        Mrs = 2,
        Miss = 3,
        Ms = 4,
        Dr = 5
    }

    public enum DrivingLicenceType
    {
        FullUKPhotocard = 1,
        FullUK = 2,
        International = 4,
        None = 5,
        ProvisionalUK = 6,
        EU = 7
    }

    public enum MaritalStatus
    {
        Married = 1,
        Cohabiting = 2,
        Single = 3,
        Divorced = 4,
        Seperated = 5,
        Widowed = 6,
        CivilPartnership = 7
    }

    public enum ResidentialStatus
    {
        Unknown = 0,
        HomeOwner = 1,
        PrivateTenant = 2,
        CouncilTenant = 3,
        LivingWithParents = 4
    }

    public enum AssetType
    {
        Unknown = 0,
        Car = 1,
        BlackCab = 2,
        Caravan = 3,
        LCV = 4,
        Motorbike = 5,
        Motorhome = 6,
        Commercial = 7,
        CoachBus = 8,
        Van = 9
    }

    public enum BrokerType
    {
        Carfinance247 = 1
    }
}