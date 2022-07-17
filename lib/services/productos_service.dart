
import 'dart:convert';

import 'package:appmovil/Models/Productos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductoService extends ChangeNotifier{
  late List<Productos> productos = [];
  late Productos selectedAtencion;
  bool isLoading = true;

  ProductoService(){
    this.loadProductos();
  }

  Future<List<Productos>> loadProductos() async{
    this.isLoading = true;
    notifyListeners();

    final resp = await http.get(Uri.parse('https://proyectosi2360.herokuapp.com/api/productos'));
    final List<dynamic> productMap = json.decode(resp.body);

    productMap.forEach((element) { 
    final map = Productos.fromMap(element);
      this.productos.add(map);
    });
    //this.isLoading = true;
    notifyListeners();
    return this.productos;
  }

    void actualizarProductos() async{
    notifyListeners();
    this.productos = [];
    final resp = await http.get(Uri.parse('https://proyectosi2360.herokuapp.com/api/productos'));
    print(resp);
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    final List<dynamic> productMap = json.decode(resp.body);

    productMap.forEach((element) { 
    final map = Productos.fromMap(element);
      this.productos.add(map);
    });
    //this.isLoading = true;
    notifyListeners();
  }
}