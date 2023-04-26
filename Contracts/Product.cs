using System.Runtime.Serialization;

namespace OnlineStore.Contracts
{
    [DataContract]
    public class Product
    {
        [DataMember]
        public string? id { get; set; }

        [DataMember]
        public string? name { get; set; }

        [DataMember]
        public List<string>? images { get; set; }

        [DataMember]
        public string? manufacturerInfo { get; set; }

        [DataMember]
        public string? description { get; set; }

        [DataMember]
        public double? height { get; set; }

        [DataMember]
        public double? width { get; set; }

        [DataMember]
        public double? depth { get; set; }

        [DataMember]
        public double? weight { get; set; }

        [DataMember]
        public double? productRating { get; set; }

        [DataMember]
        public int? sku { get; set; }

        [DataMember]
        public string? mainCategory { get; set; }

        [DataMember]
        public string? type { get; set; }

        [DataMember]
        public string? size { get; set; }

        [DataMember]
        public double? price { get; set; }
    }
}
