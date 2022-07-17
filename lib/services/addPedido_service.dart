import 'dart:convert';

import 'package:appmovil/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AddPedidoService extends ChangeNotifier {

    Future<String> agregarPedidos(String tipoPago, String tipoEnvio, String promocion, String cliente_id ) async {
    notifyListeners();

    var response = await http.post(
        Uri.parse('https://proyectosi2360.herokuapp.com/api/storePedido'),
        body: ({
          'tipoPago': tipoPago,
          'tipoEnvio': tipoEnvio,
          'promocion': promocion,
          'cliente_id': cliente_id,
        }));
    final body = jsonDecode(response.body);
    print(response.body);
    notifyListeners();
    return response.body;
  }
}
