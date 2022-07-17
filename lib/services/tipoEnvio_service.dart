
import 'dart:convert';
import 'package:appmovil/Models/tipo_envio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TipoEnvioService extends ChangeNotifier{
  late List<TipoEnvio> listaTipoEnvio = [];

  TipoEnvioService(){
    this.loadTipoEnvios();
  }

  Future<List<TipoEnvio>> loadTipoEnvios() async{
    notifyListeners();
    final respuesta = await http.get(Uri.parse('https://proyectosi2360.herokuapp.com/api/tipoEnvios'));
    final List<dynamic> tipoEnvioMap = json.decode(respuesta.body);

    tipoEnvioMap.forEach((element) { 
      final tipoEnvioMap = TipoEnvio.fromMap(element);
      this.listaTipoEnvio.add(tipoEnvioMap);
    });
    notifyListeners();
    return this.listaTipoEnvio;
  }

    void actualizarTipoEnvios() async{
    notifyListeners();
    this.listaTipoEnvio = [];
    final respuesta = await http.get(Uri.parse('https://proyectosi2360.herokuapp.com/api/tipoEnvios'));
    final List<dynamic> tipoEnvioMap = json.decode(respuesta.body);

    tipoEnvioMap.forEach((element) { 
      final tipoEnvioMap = TipoEnvio.fromMap(element);
      this.listaTipoEnvio.add(tipoEnvioMap);
    });
    notifyListeners();
  }
}