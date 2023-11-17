import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Socket.IO Demo',
      home: SocketIoDemo(),
    );
  }
}

class SocketIoDemo extends StatefulWidget {
  const SocketIoDemo({super.key});

  @override
  _SocketIoDemoState createState() => _SocketIoDemoState();
}

class _SocketIoDemoState extends State<SocketIoDemo> {
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();

    // Kết nối đến máy chủ Socket.IO
    socket = IO.io('http://127.0.0.1:3001');

    // Lắng nghe sự kiện 'connect'
    socket.on('connect', (_) {
      print('Connected to server');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Socket.IO Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Gửi dữ liệu khi nút được nhấn
            print("object");
            socket.emit('clientData', {'message': 'Hello from Flutter!'});
          },
          child: Text('Send Data to Server'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Đóng kết nối khi widget được hủy
    socket.disconnect();
    super.dispose();
  }
}
