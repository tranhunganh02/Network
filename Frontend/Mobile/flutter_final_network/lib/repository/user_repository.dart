import 'package:flutter_final_network/models/user.dart';
import 'package:flutter_final_network/repository/user_repository_imp.dart';
import 'package:flutter_final_network/services/user_service.dart';

class UserRepository implements UserRepositoryImp{
  
  @override
  Future<User?> loginUser(String url, String email, String password) async {
   
    // TODO: implement loginUser
     try {

      final userData = await UserService.login(url, email, password);
      return User.fromJson(userData);

    } catch (e) {
          throw UnimplementedError();       
    }
  }
  
  @override
  Future<User?> registerUser(String url, String name, String email, String password) async {
    // TODO: implement registerUser
   try {

      final userData = await UserService.register(url, name, email, password);
      return User.fromJson(userData);

    } catch (e) {
          throw UnimplementedError();       
    }
  }
  

}