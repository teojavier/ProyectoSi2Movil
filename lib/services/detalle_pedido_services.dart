import 'dart:convert';
import 'package:appmovil/Models/Detalle_pedido.dart';
import 'package:appmovil/Models/Productos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DetalleService extends ChangeNotifier {
  late  List<DetallePedido> detalle_pedido = [];
  String idpedido = '';
  bool isLoading = true;
  String nombreP = '';



  Future<List<DetallePedido>> loadDetalles() async {
    this.isLoading = true;
    notifyListeners();

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? id_pedido = pref.getString('id_pedido');

    final response = await http.get(Uri.parse('https://proyectosi2360.herokuapp.com/api/pedido_detalle/' + id_pedido!));
    //print(response);
    //print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    
    final List<dynamic> detalleMap = json.decode(response.body);

    detalleMap.forEach((element) { 
      final detalleMap = DetallePedido.fromMap(element);
      this.detalle_pedido.add(detalleMap);
    });
    //this.isLoading = true;
    notifyListeners();
    return this.detalle_pedido;
  }

  void actualizarDetalles() async {
    notifyListeners();
    this.detalle_pedido = [];

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? id_pedido = pref.getString('id_pedido');

    final response = await http.get(Uri.parse('https://proyectosi2360.herokuapp.com/api/pedido_detalle/' + id_pedido!));
    
    final List<dynamic> detalleMap = json.decode(response.body);

    detalleMap.forEach((element) { 
      final detalleMap = DetallePedido.fromMap(element);
      this.detalle_pedido.add(detalleMap);
    });
    //this.isLoading = true;
    //print('aaaaaaaaaaaaaaaaaaaaaaa');
    //print(this.detalle_pedido);
    notifyListeners();
  }


}
