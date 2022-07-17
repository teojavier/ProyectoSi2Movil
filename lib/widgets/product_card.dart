import 'package:appmovil/Models/Atencion.dart';
import 'package:appmovil/Models/Productos.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProductCard extends StatelessWidget {
  final Productos producto;

  const ProductCard({Key? key, required this.producto}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20), //es en general en el view
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 20), //es solo para el card
        width: double.infinity,
        height: 550,
        decoration: _carBorders(),
        child: Column(
          children: [
            _BackgroundImage(producto.imagen),
            _ProductDetail(producto.nombre, producto.precio,
                producto.descripcion, producto.marca, producto.categoria, producto.stock),
          ],
        ),
      ),
    );
  }

  BoxDecoration _carBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 5), blurRadius: 10)
          ]);
}

class _ProductDetail extends StatelessWidget {
  final String? nombre;
  final String? precio;
  final String? descripcion;
  final String? marcaId;
  final String? categoriaId;
  final int? stock;
  const _ProductDetail(this.nombre, this.precio, this.descripcion, this.marcaId,
      this.categoriaId, this.stock);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 140,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre:  ' + nombre!,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Descripcion:  ' + descripcion!,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Precio:  ' + precio! + '  Bs',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Categoria:  ' + categoriaId!,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Marca:  ' + marcaId!,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Stock:  ' + stock.toString(),
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)));
}

class _BackgroundImage extends StatelessWidget {
  final String? imagen;
  const _BackgroundImage(this.imagen);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: WebView(
          initialUrl: imagen!,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
