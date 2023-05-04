using System.Runtime.Serialization;
using Backend;

namespace Contracts
{
    [DataContract]
    public class Address
    {
        [DataMember]
        public string? streetLineOne { get; set; }

        [DataMember]
        public string? streetLineTwo { get; set; }

        [DataMember]
        public string? city { get; set; }

        [DataMember]
        public string? state { get; set; }

        [DataMember]
        public string? country { get; set; }

        [DataMember]
        public string? zipCode { get; set; }
    }
}