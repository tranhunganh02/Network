  import 'package:flutter/material.dart';
import 'package:flutter_final_network/view/chat/component/shape_circle.dart';

// ignore: non_constant_identifier_names
Container TimeAndNumNoti(BuildContext context, int index, DateTime now) {
    return Container(

                        height: double.infinity,
                        width: MediaQuery.sizeOf(context).width*(1-0.14-0.64) - 40,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          Text("${now.hour}:${now.minute}"),
                          numOfNotification(index % 2 )
                        ]),
                      );
  }
