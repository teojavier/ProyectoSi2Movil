// To parse this JSON data, do
//
//     final productos = productosFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Productos> productosFromMap(String str) => List<Productos>.from(json.decode(str).map((x) => Productos.fromMap(x)));

String productosToMap(List<Productos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Productos {
    Productos({
        required this.id,
        required this.nombre,
        required this.descripcion,
        required this.precio,
        required this.stock,
        required this.imagen,
        required this.categoria,
        required this.marca,
    });

    int id;
    String nombre;
    String descripcion;
    String precio;
    int stock;
    String imagen;
    String categoria;
    String marca;

    factory Productos.fromMap(Map<String, dynamic> json) => Productos(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        stock: json["stock"],
        imagen: json["imagen"],
        categoria: json["categoria"],
        marca: json["marca"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "stock": stock,
        "imagen": imagen,
        "categoria": categoria,
        "marca": marca,
    };
}
