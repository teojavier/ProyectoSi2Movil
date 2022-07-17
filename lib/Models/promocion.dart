import 'package:meta/meta.dart';
import 'dart:convert';

List<Promocion> promocionFromMap(String str) => List<Promocion>.from(json.decode(str).map((x) => Promocion.fromMap(x)));

String promocionToMap(List<Promocion> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Promocion {
    Promocion({
        required this.id,
        required this.nombre,
    });

    int id;
    String nombre;

    factory Promocion.fromMap(Map<String, dynamic> json) => Promocion(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
    };
}
