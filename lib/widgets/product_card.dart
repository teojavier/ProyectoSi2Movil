import 'package:appmovil/Models/Atencion.dart';
import 'package:appmovil/Models/Productos.dart';
import 'package:flutter/material.dart';

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
        height: 500,
        decoration: _carBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(),
            _ProductDetail(
                producto.nombre,
                producto.precio,
                producto.descripcion,
                'producto.marcaId',
                'producto.categoriaId'),
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
  const _ProductDetail(this.nombre, this.precio, this.descripcion, this.marcaId,
      this.categoriaId);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 120,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Producto:  ' + nombre!,
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
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 500,
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage('https://1.bp.blogspot.com/-XdN0Kf19nJ8/WIpVQvbedZI/AAAAAAAAEcI/aZhbIUyKXcoQoRvDgmi3FM5_PQLDk-p4wCLcB/s1600/La%2Bmarca%2Bdel%2Bproducto%2BDefinici%25C3%25B3n%252C%2Bclasificaci%25C3%25B3n%252C%2Bc%25C3%25B3mo%2Bnacen%2By%2Bm%25C3%25A1s.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
