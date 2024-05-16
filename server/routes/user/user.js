const expxress = require("express");
const User = require("../../models/user");
const bycrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");

const jwt_password = "Thisisjwtpassword";
require("mongoose");

const userAuthRouter = expxress.Router();

userAuthRouter.post("/api/signup", async (req, res) => {
  console.log(req.body);

  const { name, email, password } = req.body;
  hashedPassword = await bycrypt.hash(password, 10);
  try {
    const user = await User.findOne({ email: email });

    if (user) {
      return res.status(400).json({ msg: "User Exists" });
    }
    const new_user = new User({
      name: name,
      email: email,
      password: hashedPassword,
    });
    await new_user.save();
    return res.status(200).json({ msg: "USer Created" });
  } catch (e) {
    res.status(500).json({ msg: e.message });
  }
});

userAuthRouter.post("/api/signin", async (req, res) => {
  const email = req.body.email;
  const password = req.body.password;

  try {
    const usr = await User.findOne({
      email: email,
    });
    if (!usr) {
      return res.status(400).json({
        msg: "No Such User Exists",
      });
    } else {
      const check = await bycrypt.compare(password, usr.password);

      if (!check) {
        res.status(400).json({
          msg: "Incorrect Passowrd",
        });
      }

      const token = jwt.sign(
        { email: email, name: usr.name, role: usr.role, id: usr._id },
        jwt_password
      );
      console.log(token);

      res.status(200).json({ token, ...usr._doc });

      console.log(token, ...usr._doc);
    }
  } catch (e) {}
});

userAuthRouter.post("/api/verify", (req, res) => {
  try {
    const token = req.header("auth-token");

    if (!token) res.json(false);

    const decode = jwt.verify(token, jwt_password);
    if (!decode) res.json(false);

    const user = User.findById(decode.id);

    if (!user) res.json(false);

    res.json(true);
  } catch (e) {
    res.status(500).json({
      msg: e.message,
    });
  }
});

userAuthRouter.get("/", (req, res) => {
  res.send("Connected");
});

module.exports = {
  userAuthRouter,
};
