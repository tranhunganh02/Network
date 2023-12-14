import 'dart:convert';
import 'package:flutter_final_network/utils/utils.dart';
import 'package:http/http.dart' as http;

// ignore: constant_identifier_names
const BaseURl = "http://192.168.88.120:5001/api";

class ChatService {

  static Future<Map<String, dynamic>> getListChat(
      String url) async {
      final response = await http.get(Uri.parse('$BaseURl$url'),
        headers: {'Content-Type': 'application/json'},);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      UtilsMessage.toastMessage(response.body);
      throw Exception('Failed to log in. Status code: ${response.statusCode}');
    }
  }

  static Future<Map<String, dynamic>> register(
      String url,String name, String email, String password) async {

    print(" data from repo $name   $email    $password");

      final response = await http.post(Uri.parse('$BaseURl$url'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'name': name, 'email': email, 'password': password}));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(response.body);
      UtilsMessage.toastMessage(response.body);
      throw Exception('Failed to log in. Status code: ${response.statusCode}');
    }
  }

}
