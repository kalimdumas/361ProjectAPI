using System.Runtime.Serialization;

namespace OnlineStore.Contracts
{
    public interface IViewSaleManager
    {
        List<Product> getCategorySaleProducts(int id);

        List<Product> getProductSaleProducts(int id);

    }
}
