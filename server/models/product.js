const mongoose = require("mongoose");

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
});

const Product = mongoose.model("Product", productSchema);
module.exports = Product;
