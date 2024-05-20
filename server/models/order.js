const mongoose = require("mongoose");
const { productSchema } = require("./product");

const orderSchema = mongoose.Schema({
  product: [productSchema],

  userid: String,

  total: {
    type: Number,
  },

  quantity: {
    type: Number,
  },
});

const Order = mongoose.model("Product", orderSchema);
module.exports = { Order, orderSchema };
