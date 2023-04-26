using System.Runtime.Serialization;

namespace OnlineStore.Contracts
{
    public interface ISearchProductsManager
    {
        List<Product> searchProductsByName(string searchString);

        List<Product> searchProductsByCategory(string category);

    }
}
