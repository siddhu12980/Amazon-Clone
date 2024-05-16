const expxress = require("express");
const mongoose = require("mongoose");

const Product = require("../../models/product");

const dealRouter = expxress.Router();

dealRouter.get("/deal-of-day", async (req, res) => {
  try {
    let product = await Product.find({});

    res.status(200).json({
      product,
    });
  } catch (e) {
    res.json({
      msg: e.message,
    });
  }
});

module.exports = {
  dealRouter,
};
