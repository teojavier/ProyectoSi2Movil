import 'dart:convert';

import 'package:appmovil/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddProductoService extends ChangeNotifier {
  int? _cantidad;
  int? _idpedido;
  int? _idproducto;

  get cantidad {
    return _cantidad;
  }

  get idpedido {
    return _idpedido;
  }

  get idproducto {
    return _idproducto;
  }

    Future<String> agregarProductos(int cant, int pe, int pro) async {
    notifyListeners();

    var response = await http.post(
        Uri.parse('https://proyectosi2360.herokuapp.com/api/addProducto'),
        body: ({
          'cantidad': cant.toString(),
          'idpedido': pe.toString(),
          'idproducto': pro.toString(),
        }));
    final body = jsonDecode(response.body);
    print(response.body);
    notifyListeners();
    return response.body;
  }
}
