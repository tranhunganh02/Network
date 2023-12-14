import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UtilsMessage {

  static toastMessage(String message) {
    Fluttertoast.showToast(timeInSecForIosWeb: 2,
        msg: message, backgroundColor: Colors.red, textColor: Colors.white);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeInOut,
          message: message,
          padding: const EdgeInsets.all(10.0),
          backgroundColor: Colors.red,
          title: "Wrong!!!",
          messageColor: Colors.black,
          duration: const Duration(seconds: 1),
          icon:const Icon(Icons.error, size: 30, color: Colors.white,),
        )..show(context));
  }
}
