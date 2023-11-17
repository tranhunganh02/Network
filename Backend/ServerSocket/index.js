// Install the required packages
// npm install express socket.io

const express = require('express');
const http = require('http');
const socketIo = require('socket.io');

const app = express();
const server = http.createServer(app);
const io = socketIo(server);

// Khởi tạo mảng lưu trữ các người chơi
const players = [];

io.on('connection', (socket) => {
  console.log('A player has connected');

  // Tạo một người chơi mới và gửi thông tin về client
  const player = {
    id: socket.id,
    choice: null,
  };
  players.push(player);
  io.emit('updatePlayers', players);

  // Nhận lựa chọn từ client
  socket.on('choose', (choice) => {
    player.choice = choice;
    io.emit('updatePlayers', players);

    // Kiểm tra xem tất cả người chơi đã lựa chọn chưa
    if (players.every((p) => p.choice !== null)) {
      // Xử lý logic trò chơi ở đây, ví dụ: kiểm tra ai thắng
      const winner = determineWinner(players);

      // Gửi kết quả về client
      io.emit('gameResult', { winner, players });

      // Reset lựa chọn của người chơi
      players.forEach((p) => (p.choice = null));
    }
  });

  // Xử lý khi người chơi ngắt kết nối
  socket.on('disconnect', () => {
    console.log('A player has disconnected');
    const index = players.findIndex((p) => p.id === socket.id);
    if (index !== -1) {
      players.splice(index, 1);
      io.emit('updatePlayers', players);
    }
  });
});

// Hàm xử lý logic trò chơi
function determineWinner(players) {
  // Đơn giản: Trả về người chơi đầu tiên làm lựa chọn (rock, paper, or scissors)
  return players[0];
}

const PORT = process.env.PORT || 3001;
server.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
