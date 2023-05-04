using System.Runtime.Serialization;
using Backend;

namespace Contracts
{
    [DataContract]
    public class CardInfo
    {
        [DataMember]
        public string? cardNumber { get; set; }

        [DataMember]
        public string? expDate { get; set; }

        [DataMember]
        public int? cvvNumber { get; set; }
    }
}