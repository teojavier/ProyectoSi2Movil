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

    EditarPerfilService(){
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
}
