using System.Runtime.Serialization;

namespace OnlineStore.Contracts
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