
import 'dart:convert';
import 'package:appmovil/Models/promocion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PromocionService extends ChangeNotifier{
  late  List<Promocion> listapromocion = [];

  PromocionService(){
    this.loadPromociones();
  }

  Future<List<Promocion>> loadPromociones() async{
    notifyListeners();
    final respuesta = await http.get(Uri.parse('https://proyectosi2360.herokuapp.com/api/promociones'));
    final List<dynamic> promocionMap = json.decode(respuesta.body);

    promocionMap.forEach((element) { 
      final promocionMap = Promocion.fromMap(element);
      this.listapromocion.add(promocionMap);
    });
    notifyListeners();
    return this.listapromocion;
  }

   void actualizarPromociones() async{
    notifyListeners();
    this.listapromocion = [];
    final respuesta = await http.get(Uri.parse('https://proyectosi2360.herokuapp.com/api/promociones'));
    final List<dynamic> promocionMap = json.decode(respuesta.body);

    promocionMap.forEach((element) { 
      final promocionMap = Promocion.fromMap(element);
      this.listapromocion.add(promocionMap);
    });
    notifyListeners();
  }
}