using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace CartEngineTest
{
    [TestClass]
    public class CartEngineTest
    {
        [TestMethod]
        public void PercentSaleTest()
        {
            var engine = new Engines.CartEngine();
            Assert.AreEqual(50, engine.applySale(100, 50, 0));
            Assert.AreEqual(423.5, engine.applySale(847, 50, 0));
        }

        [TestMethod]
        public void AmountSaleTest()
        {
            var engine = new Engines.CartEngine();
            Assert.AreEqual(13, engine.applySale(100, 0, 87));
            Assert.AreEqual(50.25, engine.applySale(62.5, 0, 12.25));
        }

    }
}
