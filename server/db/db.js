const mongoose = require("mongoose");
require("dotenv");
// Connect to MongoDB
console.log(process.env.MONGO_URL);
mongoose.connect(process.env.MONGO_URL);
// Define schemasz
