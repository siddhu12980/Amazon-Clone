const expxress = require("express");
require("mongoose");

const userDataRouter = expxress.Router();

userDataRouter.get("/api/data", async (req, res) => {
  const User = await User.findById(req.user);

  res.status(200).json({
    ...User._doc,
    token: req.token,
  });
});

module.exports = {
  userDataRouter,
};
