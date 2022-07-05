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
        required this.categoriaId,
        required this.marcaId,
    });

    int id;
    String nombre;
    String descripcion;
    String precio;
    int stock;
    String imagen;
    int categoriaId;
    int marcaId;

    factory Productos.fromMap(Map<String, dynamic> json) => Productos(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        stock: json["stock"],
        imagen: json["imagen"],
        categoriaId: json["categoria_id"],
        marcaId: json["marca_id"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "precio": precio,
        "stock": stock,
        "imagen": imagen,
        "categoria_id": categoriaId,
        "marca_id": marcaId,
    };
}
