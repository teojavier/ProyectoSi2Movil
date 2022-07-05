
import 'dart:convert';

import 'package:appmovil/Models/Atencion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AtencionService extends ChangeNotifier{
  late final List<Atencion> atenciones = [];
  late Atencion selectedAtencion;
  bool isLoading = true;

  AtencionService(){
    this.loadAtenciones();
  }

  Future<List<Atencion>> loadAtenciones() async{
    this.isLoading = true;
    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? user_id = pref.getString('user_id');

    final resp = await http.get(Uri.parse('http://10.0.2.2/Examen%20SI2%20Montalvo/public/api/atenciones/'+ user_id!));
    print(resp);
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    final List<dynamic> atencionMap = json.decode(resp.body);

    atencionMap.forEach((element) { 
      final tempAtencion = Atencion.fromMap(element);
      this.atenciones.add(tempAtencion);
    });
    //this.isLoading = true;
    notifyListeners();
    return this.atenciones;
  }
}