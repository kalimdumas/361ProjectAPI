using System.Runtime.Serialization;

namespace OnlineStore.Contracts
{
    [DataContract]
    public class DollarCategorySale : SaleInterface
    {

        [DataMember]
        public int? id { get; set; }

        [DataMember]
        public string? startDate { get; set; }

        [DataMember]
        public string? endDate { get; set; }

        [DataMember]
        public double dollarOff { get; set; }

        [DataMember]
        public string? mainCategory { get; set; }

        [DataMember]
        public string? type { get; set;}

        [DataMember]
        public string? size { get; set; }
    }
}
