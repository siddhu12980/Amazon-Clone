const jwt = require("jsonwebtoken");
const jwt_password = "Thisisjwtpassword";
const User = require("../../models/user");

require("mongoose");

async function userMiddelWare(req, res, next) {
  try {
    const token = req.header("x-auth-token");

    if (!token)
      return res.status(401).json({
        msg: " Auth Token  not Found",
      });

    const decode = jwt.verify(token, jwt_password);

    if (!decode)
      return res.json({
        msg: " Invalid Auth Token",
      });

    const user = User.findById(decode.id);

    if (!user)
      return res.json({
        msg: " Invalid Auth Token",
      });

    req.user = decode.id;
    req.token = token;

    next();
  } catch (e) {
    res.json({
      msg: e.message,
    });
  }
}

module.exports = {
  userMiddelWare,
};
