const expxress = require("express");
const User = require("../../models/user");
const { Product } = require("../../models/product");
require("mongoose");

const userDataRouter = expxress.Router();

userDataRouter.get("/api/data", async (req, res) => {
  const user = await User.findById(req.user);

  res.status(200).json({
    ...user._doc,
    token: req.token,
  });
});

userDataRouter.post("/api/cart", async (req, res) => {
  const _id = req.body.p_id;

  const user = await User.findById(req.user);
  const product = await Product.findById(_id);
  console.log(product);

  let isFound = false;

  if (user.cart.length == 0) {
    user.cart.push({ product, quantity: 1 });
  } else {
    for (var i = 0; i < user.cart.length; i++) {
      if (user.cart[i].product._id.equals(product._id)) {
        isFound = true;
      }
    }

    if (isFound) {
      let product1 = user.cart.find((ele) =>
        ele.product._id.equals(product._id)
      );

      product1.quantity += 1;
    } else {
      user.cart.push({ product, quantity: 1 });
    }
  }

  await user.save();
  res.json(user);
});

module.exports = {
  userDataRouter,
};
