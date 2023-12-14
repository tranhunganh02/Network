
import 'package:flutter/material.dart';
import 'package:flutter_final_network/constanst.dart';

class OnlineIndicator extends StatelessWidget {
  const OnlineIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15.0,
      height: 15.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green,
      ),
    );
  }
}



  Container numOfNotification(int num) {
    return Container(
    width: 25.0,
    height: 25.0,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: kSencondComponent,
    ),
    child: Center(child: Text("$num")),
  );
  }
