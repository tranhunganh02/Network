import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_final_network/constanst.dart';
import 'package:flutter_final_network/providers/auth_provider.dart';
import 'package:flutter_final_network/view/home/home_screen.dart';
import 'package:provider/provider.dart';
import './components/footer1.dart';
import 'components/header.dart';
import 'components/text_input.dart';
import 'package:http/http.dart' as http;

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isCheck = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleLogin(BuildContext context) async {
    final email = emailController.text;
    final password = passwordController.text;

    final userProvider = Provider.of<AuthProvider>(context, listen: false);

    try {
      await userProvider.loginUser(email, password);

      final user = userProvider.user;

      if (user != null) {
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    } catch (e) {
      // Xử lý lỗi ở đây (hiển thị thông báo, ghi log, vv.)
      print('Error during login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Header("Sign in"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
          child: Column(
            children: [
              Flexible(
                  flex: 4,
                  child: SizedBox(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Checkbox(
                                        checkColor: Colors.black,
                                        side: const BorderSide(
                                            width: 1, color: Colors.grey),
                                        fillColor:
                                            const MaterialStatePropertyAll(
                                                Colors.white),
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
                                      SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.12,
                                      ),
                                      TextButton(
                                          onPressed: () {},
                                          child:
                                              const Text("Forget password?"))
                                    ],
                                  )),
                              Flexible(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      handleLogin(context);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15),
                                        color: const Color.fromARGB(
                                            255, 34, 158, 111),
                                      ),
                                      child: Center(
                                        child: authProvider.loading
                                            ? const CircularProgressIndicator()
                                            : Text("Login"),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              Flexible(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: const Footer1(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
