const expxress = require("express");
const mongoose = require("mongoose");

const Product = require("../../models/product");

const adminAddProduct = expxress.Router();

adminAddProduct.post("/product", async (req, res) => {
  try {
    const { name, description, images, quantity, price, catogery } = req.body;
    // const {...data} = req.body;

    let product = new Product({
      name,
      description,
      price,
      quantity,
      catogery,
      images,
    });

    product_res = await product.save();

    res.json(product_res);
  } catch (e) {
    res.json({
      msg: e.message,
    });
  }
});

adminAddProduct.get("/product", async (req, res) => {
  let product = await Product.find({});

  res.status(200).json({
    product,
  });
});

module.exports = {
  adminAddProduct,
};
