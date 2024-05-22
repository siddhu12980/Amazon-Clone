const expxress = require("express");
const User = require("../../models/user");
const { Product } = require("../../models/product");
const { Order } = require("../../models/order");
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

userDataRouter.delete("/api/cart", async (req, res) => {
  const _id = req.body.p_id;

  const user = await User.findById(req.user);
  const product = await Product.findById(_id);
  console.log(product);

  let isFound = false;

  if (user.cart.length == 0) {
    res.status(401).json({
      mgs: "Not Enough Product in cart",
    });
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

      product1.quantity -= 1;
    } else {
      res.status(401).json({
        mgs: "Not Enough Product in cart",
      });
    }
  }

  await user.save();
  res.json(user);
});

userDataRouter.post("/api/address", async (req, res) => {
  const add = req.body.address;

  const user = await User.findById(req.user);

  if (!user) {
    res.status(401).json({
      msg: "User Not Found",
    });
  }

  user.address = add;

  await user.save();
  res.json(user);
});

userDataRouter.post("/api/order", async (req, res) => {
  try {
    const { cart, total, add } = req.body;
    let orders = [];
    const user = await User.findById(req.user);

    if (!user) {
      res.status(401).json({
        msg: "User Not Found",
      });
    }

    for (let i = 0; i < cart.length; i++) {
      let product = await Product.findById(cart[i].product._id);

      if (product.quantity == 0) {
        res.status(400).json({
          msg: `${product.name} is Out Of Stock`,
        });
      } else if (product.quantity > cart[i].quantity) {
        product.quantity -= cart[i].quantity;
        orders.push({
          product: product,
          quantity: cart[i].quantity,
        });

        await product.save();
      } else {
        res.status(400).json({
          msg: `${product.name} is Not Enough`,
        });
      }
    }

    let usr = await user.findById(req.user);

    usr.cart = [];

    await usr.save();

    let order= new Order({
      products:orders,
      total,
      add,
      userid:req.user,
      orderat:new Date().getTime()
    })

    await order.save();

  } catch (e) {
    res.status(501).json({ msg: e.message });
  }
});
module.exports = {
  userDataRouter,
};
