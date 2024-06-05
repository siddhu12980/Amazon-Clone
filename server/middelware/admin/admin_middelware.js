const jwt = require("jsonwebtoken");
const jwt_password = "Thisisjwtpassword";
const User = require("../../models/user");

require("mongoose");

async function adminMiddelWare(req, res, next) {
  try {
    const token = req.header("x-auth-token");

    if (!token)
      return res.status(401).json({
        msg: " Auth Token  not Found",
      });

    const decode = jwt.verify(token, jwt_password);
    console.log(decode);
    if (!decode)
      return res.json({
        msg: " Invalid Auth Token",
      });

    const user = await User.findById(decode.id);

    if (!user)
      return res.status(400).json({
        msg: " Invalid Auth Token",
      });

    if (user.role == "admin") {
      req.user = decode.id;
      req.token = token;

      next();
    } else {
      return res.status(401).json({
        msg: "You are Not Admin ..",
      });
    }
  } catch (e) {
    res.json({
      msg: e.message,
    });
  }
}

module.exports = {
  adminMiddelWare,
};
