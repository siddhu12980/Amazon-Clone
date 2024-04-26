// final String name;
// final String description;
// final double price;
// final int quantity;
// final String catogery;
// final List<String> images;
// final String? id;
// final String? userId;

const mongoose = require("mongoose");

// const { productSchema } = require("./product");

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

  id: {
    type: String,
  },
});

const Product = mongoose.model("Product", productSchema);
module.exports = Product;
