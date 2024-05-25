const expxress = require("express");
const mongoose = require("mongoose");

const { Product } = require("../../models/product");

const productRoute = expxress.Router();

productRoute.get("/", async (req, res) => {
  try {
    let product = await Product.find(
      {},
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
    console.log(product);

    res.status(200).json({
      product,
    });
  } catch (e) {
    res.json({
      msg: e.message,
    });
  }
});

// catogery

productRoute.get("/search", async (req, res) => {
  const searchQuery = req.query.product;

  try {
    let product = await Product.find(
      {
        name: { $regex: searchQuery, $options: "i" },
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
