
import 'dart:convert';
import 'package:appmovil/Models/Pedidos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PedidosService extends ChangeNotifier{
  late List<Pedidos> pedidos = [];
  late Pedidos selectedAtencion;
  bool isLoading = true;

  PedidosService(){
    this.loadPedidos();
  }

  Future<List<Pedidos>> loadPedidos() async{
    this.isLoading = true;
    notifyListeners();

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? user_id = pref.getString('user_id');

    final response = await http.get(Uri.parse('https://proyectosi2360.herokuapp.com/api/pedidos/'+ user_id!));
    //print(response);
    //print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    
    final List<dynamic> pedidoMap = json.decode(response.body);

    pedidoMap.forEach((element) { 
      final pedidoMap = Pedidos.fromMap(element);
      this.pedidos.add(pedidoMap);
    });
    //this.isLoading = true;
    notifyListeners();
    return this.pedidos;
  }

    void actualiazarPedidos() async{
    notifyListeners();
    this.pedidos = [];
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? user_id = pref.getString('user_id');
    final response = await http.get(Uri.parse('https://proyectosi2360.herokuapp.com/api/pedidos/'+ user_id!));
    //print(response);
    //print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    final List<dynamic> pedidoMap = json.decode(response.body);

    pedidoMap.forEach((element) { 
      final pedidoMap = Pedidos.fromMap(element);
      this.pedidos.add(pedidoMap);
    });
    //this.isLoading = true;
    notifyListeners();
  }



}