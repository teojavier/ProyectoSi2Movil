import 'dart:convert';

import 'package:appmovil/Models/Configuracion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracionService extends ChangeNotifier {
  ConfiguracionService() {
    this.obtenerConf();
  }
  String _nombre = '';
  String _tel = '';

  get nombre {
    return _nombre;
  }
    get telefono {
    return _tel;
  }

  Future<String> obtenerConf() async {
    notifyListeners();
    final response =
        await http.get(Uri.parse('http://3.89.88.173/api/configuration'));
    final body = jsonDecode(response.body);
    print('${body['razon_social']}');
    print(body);
    this._nombre = '${body['razon_social']}';
    this._tel = '${body['telefono']}';
    notifyListeners();
    return response.body;
  }
}
