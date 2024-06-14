const expxress = require("express");
const { Order } = require("../../../models/order");
const { compareSync } = require("bcryptjs");

require("../../../db/db");

const adminProductServices = expxress.Router();
// const { Product } = require("../../models/product");

adminProductServices.get("/orders", async (req, res) => {
  try {
    const orders = await Order.find({});

    res.json(orders);
  } catch (e) {
    res.json({
      msg: e.message,
    });
  }
});

adminProductServices.post("/status", async (req, res) => {
  try {
    const { id, status } = req.body;
    const orders = await Order.findOneAndUpdate(
      {
        _id: id,
      },
      {
        status: status,
      },
      { new: true }
    );

    res.json(orders);
  } catch (e) {
    res.json({
      msg: e.message,
    });
  }
});

async function fetchCategoryWiseProduct(category) {
  let earnings = 0;
  let categoryOrders = await Order.find({
    "products.product.catogery": category,
  });

  for (let i = 0; i < categoryOrders.length; i++) {
    for (let j = 0; j < categoryOrders[i].products.length; j++) {
      earnings +=
        categoryOrders[i].products[j].quantity *
        categoryOrders[i].products[j].product.price;
    }
  }
  return earnings;
}

adminProductServices.get("/analytics", async (req, res) => {
  try {
    const orders = await Order.find({});
    let totalEarnings = 0;

    for (let i = 0; i < orders.length; i++) {
      for (let j = 0; j < orders[i].products.length; j++) {
        totalEarnings +=
          orders[i].products[j].quantity * orders[i].products[j].product.price;
      }
    }
    // CATEGORY WISE ORDER FETCHING
    let mobileEarnings = await fetchCategoryWiseProduct("Mobiles");
    let essentialEarnings = await fetchCategoryWiseProduct("Essentials");
    let applianceEarnings = await fetchCategoryWiseProduct("Appliances");
    let booksEarnings = await fetchCategoryWiseProduct("Books");
    let fashionEarnings = await fetchCategoryWiseProduct("Fashion");

    let earnings = {
      totalEarnings,
      mobileEarnings,
      essentialEarnings,
      applianceEarnings,
      booksEarnings,
      fashionEarnings,
    };

    console.log(earnings);

    res.json(earnings);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = {
  adminProductServices,
};
