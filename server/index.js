require("../server/db/db");
const express = require("express");

const { adminAuthRouter } = require("./routes/admin/auth");
const { userAuthRouter } = require("./routes/user/user");
const { userDataRouter } = require("./routes/user/userdata");
const { userMiddelWare } = require("./middelware/user/auth_middelware");

const app = express();
const PORT = 3000;

app.use(express.json());
app.use("/admin", adminAuthRouter);
app.use("/user", userAuthRouter);
app.use("/user", userMiddelWare, userDataRouter);

app.use("*", (req, res) => {
  res.status(500).json({
    msg: "invalid url",
  });
});

app.listen(PORT, "0.0.0.0", () => {
  console.log("listening");
});
