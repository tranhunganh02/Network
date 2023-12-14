import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_final_network/providers/auth_provider.dart';
import 'package:flutter_final_network/view/auth/login_screen.dart';
import 'package:flutter_final_network/view/auth/sign_up_screen.dart';
import 'package:flutter_final_network/view/chatRoom/chat_room_screen.dart';
import 'package:flutter_final_network/view/home/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:socket_io_client/socket_io_client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider())
      ],
      child: MaterialApp(
        initialRoute: "/login",
         routes:{
        '/login':(context) => SignInScreen(),
        '/home':(context) => HomeScreen(),
        '/register':(context) => SignUpScreen(),
        '/chatRoom':(context) => ChatRoom()
      },
        title: 'Socket.IO Demo',       
      ),
    );
  }

  // final GoRouter _router = GoRouter(routes: [
  //   GoRoute(path: "/login", builder: (context, state) => const SignInScreen(),),
  //   GoRoute(path: "/register", builder: (context, state) => const SignUpScreen(),),
  //   GoRoute(path: "/", builder: (context, state) => const SignInScreen(),),
  //   GoRoute(path: "/chatRoom", builder: (context, state) => const SignInScreen(),)
  // ]);
}

class SocketIoDemo extends StatefulWidget {
  const SocketIoDemo({super.key});

  @override
  _SocketIoDemoState createState() => _SocketIoDemoState();
}

class _SocketIoDemoState extends State<SocketIoDemo> {
//   late Socket socket; //initalize the Socket.IO Client Object 

//   @override
//   void initState() {
//     super.initState();
//     initializeSocket(); //--> call the initializeSocket method in the initState of our app.
//   }

//  @override
//   void dispose() {
//     socket.close(); // --> disconnects the Socket.IO client once the screen is disposed 
//     super.dispose();
//   }

// void initializeSocket() {
//       socket =
//           io("http://127.0.0.1:3000/", <String, dynamic>{
//         "transports": ["websocket"],
//         "autoConnect": true,
//       });
//       socket.connect();  //connect the Socket.IO Client to the Server

//       //SOCKET EVENTS
//       // --> listening for connection 
//       socket.emit('addNewUser', "s14432r3r");

//       //listen for incoming messages from the Server. 
//       socket.on('getOnlineUsers', (data) {
//        print(data); //
//       });

//       //listens when the client is disconnected from the Server 
//       socket.on('disconnect', (data) {
//         print('disconnect');
//       });
//   }


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
            //socket.emit('addNewUser', "27348742");
          },
          child: Text('Send Data to Server'),
        ),
      ),
    );
  }

}
