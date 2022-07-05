import 'package:appmovil/screens/screens.dart';
import 'package:appmovil/services/atencion_service.dart';
import 'package:appmovil/services/configuracion_service.dart';
import 'package:appmovil/services/auth_service.dart';
import 'package:appmovil/services/productos_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() => runApp(AppState());

class AppState extends StatefulWidget {
  @override
  _AppStateState createState() => _AppStateState();
}

class _AppStateState extends State<AppState> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => AtencionService()),
        ChangeNotifierProvider(create: (_) => ConfiguracionService()),
        ChangeNotifierProvider(create: (_) => ProductoService()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tienda',
      initialRoute: 'home',
      routes: { 
        'login': ( _ ) =>LoginScreen(),
        'home' : ( _ ) => HomeScreen(),
        'atencion' : ( _ ) => AtencionScreen(),
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.red
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 136, 17, 17),
          elevation: 0
        )
      ),
    );
  }
}