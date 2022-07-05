import 'package:appmovil/providers/login_form_provider.dart';
import 'package:appmovil/services/auth_service.dart';
import 'package:appmovil/services/configuracion_service.dart';
import 'package:appmovil/ui/input_decorations.dart';
import 'package:appmovil/widgets/auth_background.dart';
import 'package:appmovil/widgets/car_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final configuracionService = Provider.of<ConfiguracionService>(context);
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox( height: 250 ),
              CardContainer(
                child: Column(
                  children: [

                    SizedBox( height: 10 ),
                    Text('Login', style: Theme.of(context).textTheme.headline4),
                    SizedBox( height: 30),

                    ChangeNotifierProvider(
                      create: ( _ ) =>loginformprovider(),
                      child: _LoginForm()
                      )
                  ],
                ),
              ),
              SizedBox( height: 50),
              Text('Bienvenido a '+configuracionService.nombre, style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
              Text('', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
              Text('Contactanos al Nro: '+configuracionService.telefono, style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox( height: 50),
            ],
          ),
        )
      )
    );
  }
  
}

class _LoginForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final loginForm = Provider.of<loginformprovider>(context);
    return Container(
      child: Form(
        //TODO: mantener la referencia al Key
        key: loginForm.formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'user@gmail.com',
                labelText: 'Corre Electronico',
                prefixIcon: Icons.alternate_email_sharp
              ),
              onChanged: ( value ) => loginForm.email = value,
              validator:( value ){
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                ? null
                : 'Tienes que utilizar un Correo';
              },
            ),
            
            SizedBox( height: 30),
            
            TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecorations.authInputDecoration(
              hintText: 'Password',
              labelText: 'Contraseña',
              prefixIcon: Icons.lock_outline
            ),
            onChanged: ( value ) => loginForm.password = value,
                validator:( value ){
                  if ( value != null && value.length >=6 ) return null;
                  return 'La contraseña debe tener mas de 6 caractares';
              },
          ),
          
          SizedBox( height: 30),

          MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Colors.grey,
            elevation: 0,
            color: Colors.red,
            child: Container(
              padding: EdgeInsets.symmetric( horizontal: 80, vertical: 15),
              child: Text(
                loginForm.isLoading
                ? 'Espere'
                : 'Ingresar',
                style: TextStyle(color: Colors.white ),
              )
            ),
            onPressed: loginForm.isLoading ? null :() async{
              FocusScope.of(context).unfocus();
              if(!loginForm.isValidForm()) return;
              loginForm.isLoading = true;
              await Future.delayed(Duration(seconds: 2));
              
              final authService = Provider.of<AuthService>(context, listen: false);
              final String respuesta = await authService.login(loginForm.email, loginForm.password);
              
              print(respuesta);
              if ( respuesta.contains('email')) {
                loginForm.isLoading = false;
                Navigator.pushReplacementNamed(context, 'home');
              }else{
                loginForm.isLoading = false;
                return showDialog(
                    context: context,
                    builder: (_) => _DialogoAlerta(
                      mensaje: "Contraseña incorrecta",
                    ),
                  );
              }
              loginForm.isLoading = false;
            }
            //TUDO: LOGINFORM
            )
          ],
        )
      ),
    );
  }
}

class _DialogoAlerta extends StatelessWidget {
  final String mensaje;

  const _DialogoAlerta({required this.mensaje});
  @override
  
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Error'),
      content: Text(this.mensaje),
    );
  }
}