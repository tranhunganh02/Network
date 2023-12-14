const { Server } = require("socket.io");

const io = new Server({
  // cors: "http://localhost:5173"
  cors: {
    origin: "*",
  },
});

let onLineUser = [];

io.on("connection", (socket) => {
  // ...
  console.log("new connection", socket.id);

  //listen connection
  socket.on("addNewUser", (userId) => {
    !onLineUser.some((user) => user.userId === userId) &&
      onLineUser.push({
        userId,
        socketId: socket.id,
      });

    console.log("onlineUsers: ", onLineUser);

    io.emit("getOnlineUsers", onLineUser);
  });

  //add message
  socket.on("sendMessage", (message) => {
    const user = onLineUser.find(
      (user) => user.userId === message.recipientId
    );

    if (user) {
      io.to(user.socketId).emit("getMessage", message);
    }
  });

  socket.on("disconnect", () => {
    onLineUser = onLineUser.filter((user) => user.socketId !== socket.id);

    io.emit("getOnLineUsers", onLineUser);
  });
});

io.listen(3000);
