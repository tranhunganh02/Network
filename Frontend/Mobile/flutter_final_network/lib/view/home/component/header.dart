 import 'package:flutter/material.dart';

import '../../../constanst.dart';

// ignore: non_constant_identifier_names
AppBar Header() {
    return AppBar(
      centerTitle: true,
      titleSpacing: 1.2,
      title: const Text("Chat app"),
      backgroundColor: kSecondPrimaryColor,
    );
  }