import 'package:flutter/material.dart';
import './components/footer2.dart';

import 'components/body2.dart';
import 'components/header.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header("Sign up"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
          child: Column(
            children: [
              const SizedBox(height: 10,),
             Flexible(
                  flex: 3,
                  child: Body(
                    typeScreen: 1,
                  )),
              const Flexible(flex: 2, child: Footer2(titleFooter: "Already have an account?", nameScreen: "SignIn",))
            ],
          ),
        ),
      ),
    );
  }
}
