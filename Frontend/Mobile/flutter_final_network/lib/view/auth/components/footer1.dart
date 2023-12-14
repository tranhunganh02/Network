import 'package:flutter/material.dart';
import 'package:flutter_final_network/view/auth/sign_up_screen.dart';
import 'package:go_router/go_router.dart';


import 'footerTop.dart';

class Footer1 extends StatefulWidget {
  const Footer1({
    super.key,
  });
  @override
  State<Footer1> createState() => _FooterState();
}

class _FooterState extends State<Footer1> {
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
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.black),
                  ),
                  InkWell(
                   onTap: () => Navigator.pushNamed(context, '/register'),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.green),
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
              heroTag: "facebook",
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
                Icons.flutter_dash_sharp,
                color: Colors.black,
                size: 45.0,
              ),
              onPressed: () {},
            ),
          ],
        ));
  }
}
