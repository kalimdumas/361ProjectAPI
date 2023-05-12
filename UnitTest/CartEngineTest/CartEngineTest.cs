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
            Assert.AreEqual(50, engine.applySale(100, true, 50), 0.0001);
            Assert.AreEqual(25, engine.applySale(250, true, 90), 0.0001);
            Assert.AreEqual(635.25, engine.applySale(847, true, 25), 0.0001);
            Assert.AreNotEqual(153, engine.applySale(2151, true, 75), 0.0001);
        }

        [TestMethod]
        public void AmountSaleTest()
        {
            var engine = new Engines.CartEngine();
            Assert.AreEqual(13, engine.applySale(100, false, 87), 0.0001);
            Assert.AreEqual(50.25, engine.applySale(62.5, false, 12.25), 0.0001);
            Assert.AreEqual(235, engine.applySale(326, false, 91), 0.0001);
            Assert.AreNotEqual(123, engine.applySale(2352, false, 2351), 0.0001);
        }

    }
}
