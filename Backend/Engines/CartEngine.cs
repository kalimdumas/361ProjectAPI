using Backend;

namespace Engines
{
    public class CartEngine
    {
        public double applySale(double price, bool isPercentDiscount, double discount) {
            if(isPercentDiscount){
                return price * (1 - discount / 100);
            } else {
                return price - discount;
            }
        }
    }
}
