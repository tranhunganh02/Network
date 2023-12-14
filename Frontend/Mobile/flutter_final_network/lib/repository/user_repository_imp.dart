import 'package:flutter_final_network/models/user.dart';

abstract class UserRepositoryImp{

  Future<User?> loginUser(String url , String email, String password);

  Future<User?> registerUser(String url , String name, String email, String password);

}