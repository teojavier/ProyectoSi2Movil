import 'package:appmovil/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  UserModel? user;
  String _nombre = '';
  String _email = '';

  get nombre {
    return _nombre;
  }

  get email {
    return _email;
  }

  Future<String> login(String email, String password) async {
    var response = await http.post(Uri.parse('https://proyectosi2360.herokuapp.com/api/login'),
        body: ({
          'email': email,
          'password': password,
        }));
    if (response.body.contains('email')) {
      this.user = UserModel.fromJson(response.body);
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('user_id', user!.id.toString());
      pref.setString('id', user!.id.toString());
      pref.setString('name', user!.name.toString());
      pref.setString('email', user!.email.toString());
      pref.setString('direccion', user!.direccion.toString());
      pref.setString('carnet', user!.ci.toString());
      pref.setString('telefono', user!.telefono.toString());
      this._nombre = user!.name;
      this._email = user!.email;
    }

    return response.body;
  }
}
