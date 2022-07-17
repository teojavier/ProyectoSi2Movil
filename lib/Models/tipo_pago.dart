import 'package:meta/meta.dart';
import 'dart:convert';

List<TipoPago> tipoPagoFromMap(String str) => List<TipoPago>.from(json.decode(str).map((x) => TipoPago.fromMap(x)));

String tipoPagoToMap(List<TipoPago> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class TipoPago {
    TipoPago({
        required this.id,
        required this.nombre,
    });

    int id;
    String nombre;

    factory TipoPago.fromMap(Map<String, dynamic> json) => TipoPago(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
    };
}
