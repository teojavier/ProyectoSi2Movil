
import 'dart:convert';

import 'package:appmovil/Models/Productos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductoService extends ChangeNotifier{
  late final List<Productos> productos = [];
  late Productos selectedAtencion;
  bool isLoading = true;

  ProductoService(){
    this.loadProductos();
  }

  Future<List<Productos>> loadProductos() async{
    this.isLoading = true;
    notifyListeners();

    final resp = await http.get(Uri.parse('http://3.89.88.173/api/productos'));
    print(resp);
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    final List<dynamic> productMap = json.decode(resp.body);

    productMap.forEach((element) { 
      final productMap = Productos.fromMap(element);
      this.productos.add(productMap);
    });
    //this.isLoading = true;
    notifyListeners();
    return this.productos;
  }
}