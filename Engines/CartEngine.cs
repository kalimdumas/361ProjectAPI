using OnlineStore.Contracts;

namespace OnlineStore.Engines
{
    public class CartEngine
    {
        List<Product> cart; // TODO: get cart from accessors
        List<T> sales; // TODO: get sales from accessors

        double saleApplies(Product item, PercentProductSale sale) {
            return (sale.saleProducts).Contains(item);
        }
        double saleApplies(Product item, PercentCategorySale sale) {
            return sale.mainCategory == item.mainCategory;
        }
        double saleApplies(Product item, DollarProductSale sale) {
            return (sale.saleProducts).Contains(item);
        }
        double saleApplies(Product item, DollarCategorySale sale) {
            return sale.mainCategory == item.mainCategory;
        }

        /* returns the cost of the item after applying the sale,
         * assuming the sale applies to that item
        */
        double applySale(Product item, PercentProductSale sale) {
            return item.price * (1 - (sale.percentOff / 100.0));
        }
        double applySale(Product item, PercentCategorySale sale) {
            return item.price * (1 - (sale.percentOff / 100.0));
        }
        double applySale(Product item, DollarProductSale sale) {
            return item.price - sale.dollarOff;
        }
        double applySale(Product item, DollarCategorySale sale) {
            return item.price - sale.dollarOff;
        }


        double getTotalCost<T>(List<Product> cart, ref List<T> sales) where T : SaleInterface
        {
            double total = 0;
            foreach (var item in cart)
            {
                for (int i=0; i<sales.Count; i++) {
                    if (saleApplies(item, sales[i])) {
                        total += applySale(item, sales[i]);
                    }
                }
            }
            return total;
        }
    }
}
