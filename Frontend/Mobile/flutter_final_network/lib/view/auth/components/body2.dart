import 'package:flutter/material.dart';
import 'package:flutter_final_network/providers/auth_provider.dart';
import 'package:flutter_final_network/view/home/home_screen.dart';
import 'package:provider/provider.dart';
import './text_input.dart';

class Body extends StatefulWidget {
  final int typeScreen;
  const Body({super.key, required this.typeScreen});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isCheck = false;
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

   void handleRegister(BuildContext context) async {

    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;

    final userProvider = Provider.of<AuthProvider>(context, listen: false);

    try {
      await userProvider.registerUser(name, email, password);

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
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFieldInput(
              textEditingController: nameController,
              isPass: false,
              hintText: "Enter name",
              textInputType: TextInputType.text,
              typeTilte: 'User name'),
          TextFieldInput(
              textEditingController: emailController,
              isPass: false,
              hintText: "Enter email",
              textInputType: TextInputType.text,
              typeTilte: 'Email'),
          TextFieldInput(
              textEditingController: passwordController,
              isPass: true,
              hintText: "Enter your password",
              textInputType: TextInputType.visiblePassword,
              typeTilte: 'Password'),
          actionbody2(context)
        ],
      ),
    );
  }

  Center actionbody2(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [          
          Container(
            height: MediaQuery.sizeOf(context).height*0.085,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
               color: const Color.fromARGB(255, 46, 132, 99),
            ),
           
            child: InkWell(
              onTap: () => handleRegister(context),
              child: Center(child: Text("Sign Up", style: TextStyle(color: Colors.white,))
                      ),
            ))
        ],
      ),
    );
  }
}
