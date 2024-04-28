const expxress = require("express");
const mongoose = require("mongoose");

const Product = require("../../models/product");

const productRoute = expxress.Router();

productRoute.get("/products", async (req, res) => {
  const cato = req.query.catogery;

  try {
    let product = await Product.find(
      {
        catogery: cato,
      },
      {
        __v: 0,
      }
    );

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
  productRoute,
};
