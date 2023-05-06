using System.Runtime.Serialization;

namespace Contracts
{
    [DataContract]
    public class Sale : SaleInterface
    {

        [DataMember]
        public int? id { get; set; }
        
        [DataMember]
        public DateTime? startDate { get; set; }

        [DataMember]
        public DateTime? endDate { get; set; }

        [DataMember]
        public double discount { get; set; }

        [DataMember]
        public bool isPercentDiscount { get; set; }
    }
}
