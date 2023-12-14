import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatProvider extends ChangeNotifier {
  List<String> userList = []; // Thay đổi kiểu dữ liệu tùy thuộc vào nhu cầu

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String _currentChat = '';

  String get getCurrentChat => _currentChat;

  set setCurrentChat(String value) {
    _currentChat = value;
    notifyListeners();
  }

  Future<void> getUserList() async {
    try {
      isLoading = true; // Set loading to true before fetching data

      // Simulate fetching user list from an API or database
      await Future.delayed(const Duration(milliseconds: 1500));
      userList = ['User1', 'User2', 'User3']; // Replace with actual user data
    } finally {
      isLoading = false; // Set loading to false after data fetching is complete
    }
  }
}
