const mongoose = require("mongoose");

const productRatings = mongoose.Schema({
  userID: {
    type: String,
    trim: true,
    required: true,
  },
  rating: {
    type: Number,
    required: true,
  },
});

module.exports = productRatings;
