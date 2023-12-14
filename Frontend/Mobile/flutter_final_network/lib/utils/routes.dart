import 'package:flutter/material.dart';
import 'package:flutter_final_network/utils/routes_name.dart';
import 'package:flutter_final_network/view/auth/login_screen.dart';
import 'package:flutter_final_network/view/home/home_screen.dart';
class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings){
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());

      case RoutesName.login:
      return MaterialPageRoute(builder: (BuildContext context) => const SignInScreen());

     case RoutesName.signUp:
      return MaterialPageRoute(builder: (BuildContext context) => const Scaffold(
        body: Center(
          child: Text("data"),
        ),
      ));

      case RoutesName.product_details: 
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text("NOsnao"),
            ),
          );
        });
    }
  }
  
}