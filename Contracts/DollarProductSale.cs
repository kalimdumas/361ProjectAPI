using System.Runtime.Serialization;

namespace OnlineStore.Contracts
{
    [DataContract]
    public class DollarProductSale : SaleInterface
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
        public List<Product>? saleProducts { get; set; }
    }
}
