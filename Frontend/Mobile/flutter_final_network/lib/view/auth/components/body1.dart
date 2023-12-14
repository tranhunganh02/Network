import 'package:flutter/material.dart';
import './text_input.dart';

class Body extends StatefulWidget {
  final int typeScreen;
  const Body({super.key, required this.typeScreen});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isCheck = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFieldInput(
              textEditingController: emailController,
              isPass: false,
              hintText: "Enter name",
              textInputType: TextInputType.text,
              typeTilte: 'User name'),
          TextFieldInput(
              textEditingController: passwordController,
              isPass: true,
              hintText: "Enter your password",
              textInputType: TextInputType.visiblePassword,
              typeTilte: 'Password'),
         SizedBox(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                    
                        checkColor: Colors.black,
                        side: const BorderSide(width: 1, color: Colors.grey),
                        fillColor:
                            const MaterialStatePropertyAll(Colors.white),
                        value: isCheck,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheck = value!;
                          });
                        },
                      ),
                      const Text(
                        "Remember Me",
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(width: MediaQuery.sizeOf(context).width*0.12,),
                      TextButton(
                    onPressed: () {}, child: const Text("Forget password?"))
                    ],
                  )),
              Flexible(flex: 1, child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                   color: const Color.fromARGB(255, 34, 158, 111),
                ),
               
                child: const Center( child: Text("Login"))),
              )
            ],
          ),
        )
        ],
      ),
    );
  }
}
