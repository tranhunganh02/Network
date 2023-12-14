// ignore: file_names
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

import '../appExcaption.dart';
import 'BaseApiSevices.dart';
import 'package:http/http.dart' as http;

// ignore: constant_identifier_names
const BaseURl = "http://127.0.0.1:5001/api/";

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApiResponse(String Url) async {
    // TODO: implement getApiResponse
    dynamic responseJson;

    try {
      final response =
          await http.get(Uri.parse(Url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  @override
  // Future postApiResponse(String url, dynamic data) async {
  //   final Map<String, dynamic> loginInfo = data;

  //   dynamic responseJson;

  //   try {
  //     final response = await http
  //         // .post(
  //         //   Uri.parse(url),
  //         //   headers: <String, String>{
  //         //     'Content-Type': 'application/json; charset=UTF-8',
  //         //   },
  //         //   body: jsonEncode(loginInfo),
  //         // )
  //         // .timeout(const Duration(seconds: 1));

  //         .post(Uri.parse(url),
  //         headers:     <String, String>{
  //             'Content-Type': 'application/json; charset=UTF-8',
  //           },
  //          body: jsonEncode(data));

  //    final responseJson = returnResponse(response);
  //   } on SocketException {
  //     throw FetchDataException('No internet connection');
  //   }
  //   return responseJson;
  // }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw FetchDataException(response.body.toString());
      case 404:
        throw FetchDataException(response.body.toString());
      default:
        throw FetchDataException(
            'Error accured while communicating with serverwith status code${response.statusCode}');
    }
  }
   Future postApiResponse(String url, String email, String password) async  {
    // Thay thế bằng URL cụ thể của bạn
  final Map<String, dynamic> loginInfo = {
    // Thay thế bằng dữ liệu đăng nhập của bạn
    "email": "hunganh.dh2021@gmail.com",
    "password": "Tha@021103",
  };

  try {
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(loginInfo),
    );

    if (response.statusCode == 200) {
      // Kiểm tra nếu không có lỗi
      // Đặt thông báo đăng nhập thành công ở đây
      print('Login successful');
      // Lưu thông tin người dùng vào local storage
      // Lưu ý: Trong Flutter, thường sử dụng package SharedPreferences cho việc lưu trữ cục bộ
      // Để sử dụng SharedPreferences, bạn cần thêm 'shared_preferences' vào file pubspec.yaml
      // và chạy `flutter pub get` để cài đặt.
      // Sau đó, bạn có thể thực hiện lưu trữ như sau:
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString("User", jsonEncode(response.body));
      print(jsonDecode(response.body));
      return jsonEncode(response.body);
    } else {
      // Xử lý lỗi khi có lỗi từ server
      print('Login failed with status ${response.statusCode}');
      // Đặt thông báo đăng nhập không thành công ở đây
    }
  } catch (error) {
    // Xử lý lỗi nếu có lỗi kết nối hoặc lỗi khác
    print('Error: $error');
    // Đặt thông báo đăng nhập không thành công ở đây
  }
}
}
