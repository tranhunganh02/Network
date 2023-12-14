import 'package:flutter/material.dart';
import 'package:flutter_final_network/view/auth/login_screen.dart';
import 'package:go_router/go_router.dart';

import 'footerTop.dart';

class Footer2 extends StatelessWidget {


  const Footer2({
    super.key, required this.titleFooter, required this.nameScreen,
  });
    final String titleFooter;
      final String nameScreen;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(children: [
        footerTop(context),
        footerCenter(context),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.12,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    titleFooter
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child:  Text(
                      nameScreen,
                      style: const TextStyle(color: Colors.green),
                    ),
                  )
                ]),
          ),
        )
      ]),
    );
  }

  SizedBox footerCenter(BuildContext context) {
    return SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.09,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton.extended(
              heroTag: 'facebook',
              label: const Text(

                'FACEBOOK',
                style: TextStyle(color: Colors.black),
              ), // <-- Text
              backgroundColor: Colors.white,
              icon: const Icon(
                // <-- Icon
                Icons.facebook,
                color: Colors.blue,
                size: 45.0,
              ),
              onPressed: () {},
            ),
            FloatingActionButton.extended(
              heroTag: "google",
              label: const Text(
                'GOOGLE',
                style: TextStyle(color: Colors.black),
              ), // <-- Text

              icon: const Icon(
                // <-- Icon
                Icons.tiktok,
                color: Colors.black,
                size: 45.0,
              ),
              onPressed: () {},
            ),
          ],
        ));
  }
}
