using OnlineStore.Accessors;
using OnlineStore.Contracts;
namespace OnlineStore.Contracts
{
    public class ViewSaleManager
    {
        public List<Product> getCategorySaleProducts(int id){
            string category = SaleAccessor.getSaleCategory(id);
            List<Product> saleProducts = ProductAccessor.getProductsWithCategory(category);
            return saleProducts;
        }

        public List<Product> getProductSaleProducts(int id){
            List<Product> saleProducts = ProductAccessor.getProductsWithSale(id);
            return saleProducts;
        }
    }
}
