import 'dart:convert';
import 'package:appmovil/Models/deleteDetalle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DeleteDetalleService extends ChangeNotifier {
  bool isLoading = true;


   Future<void> eliminarDetalles() async {
    this.isLoading = true;
    notifyListeners();

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? id_detalle = pref.getString('id_detalle');

    final response = await http.get(Uri.parse('https://proyectosi2360.herokuapp.com/api/deleteDetalle/' + id_detalle!));

    notifyListeners();
  }

}
