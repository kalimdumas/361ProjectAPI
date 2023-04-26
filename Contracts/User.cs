using System.Runtime.Serialization;

namespace OnlineStore.Contracts
{
    [DataContract]
    public class User
    {
        [DataMember]
        public string? username { get; set; }

        [DataMember]
        public string? password { get; set; }

        [DataMember]
        public string? email { get; set; }

        [DataMember]
        public string? firstName { get; set; }

        [DataMember]
        public string? lastName { get; set; }

        [DataMember]
        public string? phoneNumber { get; set; }

        [DataMember]
        public CardInfo? paymentInfo { get; set; }

        [DataMember]
        public Address? billingAddress { get; set; }

        [DataMember]
        public Address? shippingAddress { get; set; }

        [DataMember]
        public List<Product>? cart { get; set; }
    }
}
