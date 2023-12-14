// ignore: file_names
import 'package:flutter/material.dart';
SizedBox footerTop(BuildContext context) {
    return SizedBox(
        height: MediaQuery.sizeOf(context).height*0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width:  MediaQuery.sizeOf(context).width/3.5,
            height: 1,
              decoration: const BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                
              color: Colors.grey,
              ),
            ),
            const Text("Or Sign Up With", style: TextStyle(color: Colors.black),),
            Container(
              width:  MediaQuery.sizeOf(context).width/3.5,
              height: 1,
              decoration: const BoxDecoration(
                border: Border.fromBorderSide(BorderSide(width: 1)),
                color: Colors.grey
              ),
            ),
          ],
        ),
      );
  }
