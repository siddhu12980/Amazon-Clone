const expxress = require("express");
const mongoose = require("mongoose");

const Product = require("../../models/product");
const productRatings = require("../../models/rating");

const rateProductRoute = expxress.Router();

rateProductRoute.post("/", async (req, res) => {
  try {
    const p_id = req.body.id;
    const rating = req.body.rating;

    console.log(req.user);

    const prod = await Product.findById({
      _id: p_id,
    });
    console.log(prod);

    for (var i = 0; i < prod.ratings.length; i++) {
      if (prod.ratings[i].userID == req.user) {
        console.log("User is same");
        prod.ratings.splice(i, 1);
      }
    }

    const ratingSchema = {
      userID: req.user,
      rating: rating,
    };

    prod.ratings.push(ratingSchema);
    let ress = await prod.save();

    console.log(ress);

    if (!ress) {
      res.json({
        msg: "rating falied",
      });
    }

    res.status(200).json({
      ress,
    });
  } catch (e) {
    res.json({
      msg: e.message,
    });
  }
});

rateProductRoute.get("/", async (req, res) => {
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

// catogery

module.exports = {
  rateProductRoute,
};
