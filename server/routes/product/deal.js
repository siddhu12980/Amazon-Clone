const expxress = require("express");
const mongoose = require("mongoose");

const { Product } = require("../../models/product");

const dealRouter = expxress.Router();

dealRouter.get("/deal", async (req, res) => {
  try {
    let product = await Product.find({});

    product = product.sort((p1, p2) => {
      let p1_sum = 0;
      let p2_sum = 0;

      for (let i = 0; i < p1.ratings.length; i++) {
        p1_sum += p1.ratings[i].ratings;
      }
      for (let i = 0; i < p2.ratings.length; i++) {
        p2_sum += p2.ratings[i].ratings;
      }

      return p1_sum < p2_sum ? 1 : -1;
    });

    res.status(200).json(product[0]);
  } catch (e) {
    res.json({
      msg: e.message,
    });
  }
});

module.exports = {
  dealRouter,
};
