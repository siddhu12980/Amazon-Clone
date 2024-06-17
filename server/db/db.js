const mongoose = require("mongoose");
try {
  mongoose.connect(process.env.MONGO_URL);
} catch (e) {
  console.log(e.message);
}
