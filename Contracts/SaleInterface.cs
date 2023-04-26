using System.Runtime.Serialization;

namespace OnlineStore.Contracts
{
    interface SaleInterface
    {
        [DataMember]
        public int? id { get; set; }
        
        [DataMember]
        public string? startDate { get; set; }

        [DataMember]
        public string? endDate { get; set; }
    }
}
