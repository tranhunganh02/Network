import 'package:flutter/material.dart';

import '../../../constanst.dart';

// ignore: non_constant_identifier_names
AppBar Header(String title) {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(0.5),
      centerTitle: true,
      title: Text(title),
    );
  }