const mongoose = require("mongoose");
const productRatings = require("./rating");

const productSchema = mongoose.Schema({
  name: {
    type: String,
    trim: true,
  },

  description: {
    type: String,
    default: "",
    trim: true,
  },

  price: {
    type: Number,
  },

  quantity: {
    type: Number,
  },
  catogery: String,

  images: [
    {
      type: String,
    },
  ],

  ratings: [productRatings],
});

const Product = mongoose.model("Product", productSchema);
module.exports = { Product, productSchema };
