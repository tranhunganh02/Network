import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_final_network/models/user.dart';
import 'package:flutter_final_network/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/utils.dart';

class AuthProvider with ChangeNotifier {
  
  late UtilsMessage _ultis ;

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
  
  User? _user;

  User? get user => _user;

  final UserRepository _userRepository = UserRepository();


  //login user
  Future<void> loginUser(String email, String password) async {
    _user = await _userRepository.loginUser("/users/login", email, password);

    print("from provider");
    print(jsonEncode(_user));


    if (_user != null) {
      await UserPreferences.saveUser(_user!);

      await UserPreferences.printUserInfo();
    }
    notifyListeners();
  }

  

//register user
 Future<void> registerUser(String name, String email, String password) async {
    _user = await _userRepository.registerUser("/users/register", name, email, password);

    print("from provider");
    print(jsonEncode(_user));

    if (_user != null) {
      await UserPreferences.saveUser(_user!);

      await UserPreferences.printUserInfo();
    }
    notifyListeners();
  }

   Future<void> deleteUser() async {
    await UserPreferences.deleteUser();
    _user = null;
    notifyListeners();
  }
  
}


class UserPreferences {
   static const String _userKey = 'user';

  static const String _keyId = 'id';
  static const String _keyName = 'name';
  static const String _keyEmail = 'email';
  static const String _keyToken = 'token';

  //save current user
  static Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_keyId, user.id);
    prefs.setString(_keyName, user.name);
    prefs.setString(_keyEmail, user.email);
    prefs.setString(_keyToken, user.token);
  }

  //get information current user 
  static Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    final id = prefs.getString(_keyId);
    final name = prefs.getString(_keyName);
    final email = prefs.getString(_keyEmail);
    final token = prefs.getString(_keyToken);

    if (id != null && name != null && email != null && token != null) {
      return User(id: id, name: name, email: email, token: token);
    } else {
      return null;
    }
  }

  static Future<void> deleteUser() async {
    final prefs = await SharedPreferences.getInstance();

    User? user = await getUser();

    if (user != null) {
      // Nếu share_reference khớp với id của user hiện tại, xoá thông tin user
      await prefs.remove(_keyId);
      await prefs.remove(_keyName);
      await prefs.remove(_keyEmail);
      await prefs.remove(_keyToken);

      print('User has been deleted.');
    } else {
      print('User with share_reference ${user?.name} not found.');
    }
  }

  static Future<void> printUserInfo() async {
    final user = await getUser();
    if (user != null) {
      print('User Info:');
      print('ID: ${user.id}');
      print('Name: ${user.name}');
      print('Email: ${user.email}');
      print('Token: ${user.token}');
    } else {
      print('User not logged in.');
    }
  }

  //check user login
  static Future<bool> isLoggedIn() async {
    final user = await getUser();
    return user != null;
  }
}



