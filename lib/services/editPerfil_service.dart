import 'dart:convert';

import 'package:appmovil/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EditarPerfilService extends ChangeNotifier {
  String? _id = '';
  String? _name = '';
  String? _email = '';
  String? _carnet = '';
  String? _direccion = '';
  String? _telefono = '';
  UserModel? cliente;

  get id {
    return _id;
  }

  get name {
    return _name;
  }

  get email {
    return _email;
  }

  get carnet {
    return _carnet;
  }

  get direccion {
    return _direccion;
  }

  get telefono {
    return _telefono;
  }

  EditarPerfilService() {
    this.cambiarDatos();
  }

  Future cambiarDatos() async {
    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    this._id = pref.getString('id');
    this._name = pref.getString('name');
    this._email = pref.getString('email');
    this._carnet = pref.getString('carnet');
    this._telefono = pref.getString('telefono');
    this._direccion = pref.getString('direccion');
    notifyListeners();
  }

  Future<String> edit(String nameE, String emailE, String ciE,
      String direccionE, String telefonoE) async {
    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? user_id = pref.getString('user_id');

    var response = await http.post(
        Uri.parse('http://127.0.0.1/Proyecto%20SI2/public/api/updatePerfil/' + user_id!),
        body: ({
          'name': nameE,
          'email': emailE,
          'ci': ciE,
          'direccion': direccionE,
          'telefono': telefonoE,
        }));
    final body = jsonDecode(response.body);
    this._name = '${body['name']}';
    this._email = '${body['email']}';
    this._carnet = '${body['ci']}';
    this._telefono = '${body['telefono']}';
    this._direccion = '${body['direccion']}';

    print(response.body);
    notifyListeners();
    return response.body;
  }

    Future<String> updatePassword(String newpass, String newnewpass) async {
    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? user_id = pref.getString('user_id');

    var response = await http.post(
        Uri.parse('http://3.89.88.173/api/updatePassword/' + user_id!),
        body: ({
          'newpass': newpass,
          'newnewpass': newnewpass,
        }));
    final body = jsonDecode(response.body);
    print(response.body);
    notifyListeners();
    return response.body;
  }
}
