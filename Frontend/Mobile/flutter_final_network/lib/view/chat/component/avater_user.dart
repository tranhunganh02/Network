import 'package:flutter/material.dart';

import 'shape_circle.dart';

SizedBox ImageUser(BuildContext context, bool online, String imgUrl) {
  return SizedBox(
    height: double.infinity * 0.7,
    width: MediaQuery.sizeOf(context).width * 0.14,
    child: Stack(alignment: Alignment.topRight, children: [
      ClipRRect(
            borderRadius: BorderRadius.circular(15.0), // Điều chỉnh giá trị để thay đổi độ bo tròn
            child: Image.network(
              imgUrl, // Điều chỉnh đường dẫn cho ảnh của bạn
              width: 100.0,
              height: 100.0,
              scale: 1,
              fit: BoxFit.cover,
            ),
          ),
      online ? const OnlineIndicator() : Container(),
    ]),
  );
}
