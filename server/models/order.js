const mongoose = require("mongoose");
const { productSchema } = require("./product");

const orderSchema = mongoose.Schema({
  products: [
    {
        product:productSchema,
        quantity:Number
    }
  ],


  userid: String,

  total: {
    type: Number,
  },

  address: {
    type: String,
  },

  orderat:{
    type:Number,
  }
  ,
  status:{
    type:Number,
    enum:[0,1,2,3,4],
    default:0,
  }
});

const Order = mongoose.model("Order", orderSchema);
module.exports = { Order, orderSchema };
