using System.Runtime.Serialization;

namespace OnlineStore.Contracts
{
    public class PercentCategorySale : SaleInterface
    {
        [DataMember]
        public int? id { get; set; }

        [DataMember]
        public string? startDate { get; set; }

        [DataMember]
        public string? endDate { get; set; }

        [DataMember]
        public double percentOff { get; set; }

        [DataMember]
        public string? mainCategory { get; set; }

        [DataMember]
        public string? type { get; set; }

        [DataMember]
        public string? size { get; set; }
    }
}
