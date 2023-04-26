using OnlineStore.Contracts;

namespace OnlineStore.Engines
{
    public class CartEngine
    {
        List<Product> cart; // TODO: get cart from accessors

        // TODO: implement
        bool saleApplies<T>(Product item, ref T sale) where T : SaleInterface
        {
            return true;
        }

        // Use generic types TODO: implement
        double applySale<T>(Product item, ref T sale) where T : SaleInterface
        {
            return 0;
        }

        // Or use method overloading TOOD: implement
        double applySale(Product item, PercentProductSale sale) {
            return 0;
        }
        double applySale(Product item, PercentCategorySale sale) {
            return 0;
        }
        double applySale(Product item, DollarProductSale sale) {
            return 0;
        }
        double applySale(Product item, DollarCategorySale sale) {
            return 0;
        }

        // TODO: finish
        double getTotalCost<T>(List<Product> cart, ref List<T> sales) where T : SaleInterface
        {
            double total = 0;
            foreach (var item in cart)
            {
                // if (saleApplies(item, sales)) {
                //     total += applySale(item, sale);
                // }
            }
            return total;
        }
    }
}
