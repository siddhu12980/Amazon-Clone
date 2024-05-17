const expxress = require("express");
const mongoose = require("mongoose");

const { Product } = require("../../models/product");

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
  try {
    let product = await Product.find(
      {},
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

adminAddProduct.delete("/product/:productid", async (req, res) => {
  try {
    const id = req.params.productid;

    let product = await Product.findOneAndDelete({ _id: id });
    console.log(product);
    if (product) {
      res.status(200).json({
        msg: "Deleted",
        product: product,
      });
    } else {
      res.status(400).json({
        msg: "Product ID now found",
      });
    }
  } catch (e) {
    res.status(500).json({
      msg: e.message,
    });
  }
});

module.exports = {
  adminAddProduct,
};
