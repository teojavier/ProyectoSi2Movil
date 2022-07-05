import 'package:appmovil/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  UserModel? user;
Future<String> login(String email, String password) async {
    var response = await http.post(
        Uri.parse('http://3.89.88.173/api/login'),
        body: ({
          'email': email,
          'password': password,
        }));
    print(response.body);
    if (response.body.contains('email')) {
      user = UserModel.fromJson(response.body);
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('user_id', user!.id.toString());
    }

    return response.body;
  }
}