import 'package:appmovil/screens/editar_perfil.dart';
import 'package:appmovil/screens/password.dart';
import 'package:appmovil/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appmovil/services/auth_service.dart';
import 'package:provider/provider.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authservice = Provider.of<AuthService>(context);
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(authservice.nombre),
            accountEmail: Text(authservice.email),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://cdn.pixabay.com/photo/2018/11/13/22/01/avatar-3814081_640.png',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://w0.peakpx.com/wallpaper/895/344/HD-wallpaper-sunset-in-paradise-red-oceans-fantasy-graphy-sunsets-landscapes-nature-abstract.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Agregar Pedido'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AgregarPedidos()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.poll),
            title: Text('Pedidos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Pedidos()),
              );
            },
          ),
          Divider(
            thickness: 3,
            indent: 15,
            endIndent: 15,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Editar Perfil'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditarPerfil()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user_sharp),
            title: Text('Cambiar Contraseña'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Password()),
              );
            },
          ),
          Divider(
            thickness: 3,
            indent: 15,
            endIndent: 15,
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Cerrar Sesión'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
