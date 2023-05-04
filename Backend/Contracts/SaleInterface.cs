using System.Runtime.Serialization;

namespace Contracts
{
    interface SaleInterface
    {
        [DataMember]
        public int? id { get; set; }
        
        [DataMember]
        public DateTime? startDate { get; set; }

        [DataMember]
        public DateTime? endDate { get; set; }
    }
}
