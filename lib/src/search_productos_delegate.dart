import 'package:appmovil/Models/Productos.dart';
import 'package:appmovil/Models/country.dart';
import 'package:appmovil/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SearchProductoDelegate extends SearchDelegate<Productos> {
  final List<Productos> countries;
  final int idpedido;
  List<Productos> filtro = [];
  SearchProductoDelegate(this.countries, this.idpedido);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close_rounded))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      close(context, Productos(id: 0, nombre: 'a', descripcion: 'descripcion', precio: 'precio', stock: 0, imagen: 'imagen', categoria: 'categoria', marca: 'marca'));
    }, icon: const Icon(Icons.arrow_back_ios_new));
  }

  @override
  Widget buildResults(BuildContext context) {
     return ListView.builder(
        itemCount: filtro.length,
        itemBuilder: (BuildContext context, int index) => ProductCardP(
          producto: filtro[index],
          idpedido: idpedido,
        ),
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    filtro = countries.where((producto) {
      return producto.nombre.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    return ListView.builder(
        itemCount: filtro.length,
        itemBuilder: (_,index){
          return ListTile(
            title: Text(filtro[index].nombre),
          );
        },
      );
  }
}
