import 'package:meta/meta.dart';
import 'dart:convert';

List<DetallePedido> detallePedidoFromMap(String str) => List<DetallePedido>.from(json.decode(str).map((x) => DetallePedido.fromMap(x)));

String detallePedidoToMap(List<DetallePedido> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class DetallePedido {
    DetallePedido({
        required this.id,
        required this.nombreProducto,
        required this.precioProducto,
        required this.cantidad,
        required this.precio,
    });

    int id;
    String nombreProducto;
    String precioProducto;
    int cantidad;
    String precio;

    factory DetallePedido.fromMap(Map<String, dynamic> json) => DetallePedido(
        id: json["id"],
        nombreProducto: json["nombreProducto"],
        precioProducto: json["precioProducto"],
        cantidad: json["cantidad"],
        precio: json["precio"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nombreProducto": nombreProducto,
        "precioProducto": precioProducto,
        "cantidad": cantidad,
        "precio": precio,
    };
}