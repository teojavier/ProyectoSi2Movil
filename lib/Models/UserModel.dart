// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class UserModel {
    UserModel({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.ci,
        required this.direccion,
        required this.telefono,
        required this.tipo,
    });

    int id;
    String name;
    String email;
    dynamic emailVerifiedAt;
    String ci;
    String direccion;
    String telefono;
    String tipo;

    factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        ci: json["ci"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        tipo: json["tipo"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "ci": ci,
        "direccion": direccion,
        "telefono": telefono,
        "tipo": tipo,
    };
}
