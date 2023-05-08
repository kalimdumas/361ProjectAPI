
namespace Engines
{
    public class CartEngine
    {
        public double applySale(double price, double percentOff, double dollarsOff)
        {
            return price * (1 - (percentOff / 100.0)) - dollarsOff;
        }
    }
}
