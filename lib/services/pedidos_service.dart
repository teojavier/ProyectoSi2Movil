
import 'dart:convert';
import 'package:appmovil/Models/Pedidos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PedidosService extends ChangeNotifier{
  late final List<Pedidos> pedidos = [];
  late Pedidos selectedAtencion;
  bool isLoading = true;

  PedidosService(){
    notifyListeners();
    this.loadPedidos();
    notifyListeners();
  }

  Future<List<Pedidos>> loadPedidos() async{
    this.isLoading = true;
    notifyListeners();

    SharedPreferences pref = await SharedPreferences.getInstance();
    //String? user_id = pref.getString('user_id');
    String? user_id = '3';

    final response = await http.get(Uri.parse('http://3.89.88.173/api/pedidos/'+ user_id));
    print(response);
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    
    final List<dynamic> pedidoMap = json.decode(response.body);

    pedidoMap.forEach((element) { 
      final pedidoMap = Pedidos.fromMap(element);
      this.pedidos.add(pedidoMap);
    });
    //this.isLoading = true;
    notifyListeners();
    return this.pedidos;
  }
}