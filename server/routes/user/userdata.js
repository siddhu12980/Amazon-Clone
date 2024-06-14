require("mongoose");
const expxress = require("express");
const User = require("../../models/user");
const { Product } = require("../../models/product");
const { Order } = require("../../models/order");

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
  console.log(user);
  res.json(user);
});

userDataRouter.post("/api/orders", async (req, res) => {
  try {
    const cart = req.body.cart;
    const add = req.body.address;
    const total = req.body.totalPrice;

    console.log(cart, add, total);

    let orders = [];
    const user = await User.findById(req.user);

    if (!user) {
      res.status(401).json({
        msg: "User Not Found",
      });
    }
    console.log("user check");

    for (let i = 0; i < cart.length; i++) {
      let product = await Product.findById(cart[i].product._id);

      if (!product) {
        res.status(400).json({
          msg: `${product.name} is Not Found`,
        });
      }

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

    console.log("for check");
    let usr = await User.findById(req.user);
    console.log("use ");

    usr.cart = [];
    console.log("user cart");

    await usr.save();

    console.log("user saved");

    let order = new Order({
      products: orders,
      totalPrice: total,
      add,
      userid: req.user,
      orderat: new Date().getTime(),
    });

    await order.save();
    console.log("Save");
  } catch (e) {
    res.status(501).json({ msg: e.message });
  }
});

userDataRouter.get("/api/orders", async (req, res) => {
  try {
    console.log("inside");
    console.log(req.user);
    const orders = await Order.find({
      userid: req.user,
    });
    console.log(orders);

    const new_order = [...orders];
    console.log(new_order);

    res.json(new_order);
  } catch (e) {
    res.json({
      msg: e.message,
    });
  }
});
module.exports = {
  userDataRouter,
};
