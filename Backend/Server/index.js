// server.js
const mongoose = require("mongoose");
const express = require("express");
const cors = require("cors");
// app.js or index.js or server.js
require('dotenv').config();
const app = express();
const userRouter = require("./routers/userRoute")
const chatRouter = require("./routers/chatRoute")
const messageRouter = require("./routers/messRoute")

app.use(express.json());
app.use(cors());
app.use("/api/users", userRouter)
app.use("/api/chats", chatRouter)
app.use("/api/messages", messageRouter)

const PORT = process.env.PORT || 4000;
const uri = process.env.ATLAS_URI;

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

mongoose
  .set("strictQuery", false)
  .connect(uri, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => console.log("connect success"))
  .catch(console.log("connect fails: ", mongoose.Error));
