using System.Runtime.Serialization;

namespace OnlineStore.Contracts
{
    public interface IViewProductManager
    {
        Product getProduct(int id);

    }
}
