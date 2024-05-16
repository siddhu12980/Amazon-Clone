require("../server/db/db");
const express = require("express");
const app = express();

const PORT = 3450;

app.use(express.json());

// const cors = require("cors");

const { adminAuthRouter } = require("./routes/admin/auth");
const { adminAddProduct } = require("./routes/admin/add_product");
const { userAuthRouter } = require("./routes/user/user");
const { userDataRouter } = require("./routes/user/userdata");
const { userMiddelWare } = require("./middelware/user/auth_middelware");
const { adminMiddelWare } = require("./middelware/admin/admin_middelware");
const { productRoute } = require("./routes/product/product");
const { rateProductRoute } = require("./routes/product/rate");

// app.use(
//   cors({
//     origin: "*",
//   })
// );

// app.use(cors);r
app.use("/admin", adminAuthRouter);
app.use("/admin", adminAddProduct);
app.use("/user", userAuthRouter);
app.use("/user", userMiddelWare, userDataRouter);
app.use("/api", productRoute);

app.use("/rating", userMiddelWare, rateProductRoute);

app.use("*", (req, res) => {
  res.status(500).json({
    msg: "invalid url",
  });
});

app.listen(PORT, "0.0.0.0", () => {
  console.log("listening");
});
