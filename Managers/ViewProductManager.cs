using OnlineStore.Accessors;
using OnlineStore.Contracts;

namespace OnlineStore.Managers
{
    public class ViewProductManager
    {
        public Product getProduct(int id){
            Product product = ProductAccessor.getProduct(id);
            return product;
        }

    }
}
