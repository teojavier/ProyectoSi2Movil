import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('accountName'),
            accountEmail: Text('accountEmail'),
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
            onTap: () => print('add'),
          ),
          ListTile(
            leading: Icon(Icons.poll),
            title: Text('Pedidos'),
            onTap: () => print('ped'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Editar Perfil'),
            onTap: () => print('edit'),
          ),
          ListTile(
            leading: Icon(Icons.verified_user_sharp),
            title: Text('Cambiar Contraseña'),
            onTap: () => print('password'),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Cerrar Sesión'),
            onTap: () => print('logout'),
          ),
        ],
      ),
    );
  }
}
