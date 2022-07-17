import 'dart:convert';
import 'package:appmovil/Models/tipo_pago.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TipoPagoService extends ChangeNotifier {
  late  List<TipoPago> listaTipoPago = [];

  TipoPagoService() {
    //this.loadTipoPagos();
    this.loadTipoPago();
  }

  /*Future<List<TipoPago>> loadTipoPagos() async{
    notifyListeners();
    final respuesta = await http.get(Uri.parse('https://proyectosi2360.herokuapp.com/api/tipoPagos'));
    this.listaTipoPago = json.decode(respuesta.body);
    notifyListeners();
    return this.tipoPago;
  }*/

  Future<List<TipoPago>> loadTipoPago() async {
    notifyListeners();
    final response = await http
        .get(Uri.parse('https://proyectosi2360.herokuapp.com/api/tipoPagos'));
    final List<dynamic> tipoPagoMap = json.decode(response.body);

    tipoPagoMap.forEach((element) {
      final tipoPagoMap = TipoPago.fromMap(element);
      this.listaTipoPago.add(tipoPagoMap);
    });
    notifyListeners();
    //print(this.listaTipoPago);
    return this.listaTipoPago;
  }

  void actualizarTipoPago() async {
    notifyListeners();
    this.listaTipoPago = [];
    final response = await http
        .get(Uri.parse('https://proyectosi2360.herokuapp.com/api/tipoPagos'));
    final List<dynamic> tipoPagoMap = json.decode(response.body);

    tipoPagoMap.forEach((element) {
      final tipoPagoMap = TipoPago.fromMap(element);
      this.listaTipoPago.add(tipoPagoMap);
    });
    notifyListeners();
  }
}
