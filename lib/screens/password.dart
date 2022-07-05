import 'package:appmovil/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Password extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Navbar(),
        appBar: AppBar(
          title: Text('Editar Contraseña'),
        ),
        body: Container(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 130),
              CardContainer(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text('Contraseña', style: Theme.of(context).textTheme.headline4),
                    SizedBox(height: 30),
                    _PasswordForm(),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}

class _PasswordForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                obscureText: true,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Escriba su nueva Contraseña',
                    labelText: 'Nueva Contraseña',
                    prefixIcon: Icons.lock_outline),
              ),
              SizedBox(height: 10),
              TextFormField(
                autocorrect: false,
                obscureText: true,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Repita su Contraseña',
                    labelText: 'Repita la Contraseña',
                    prefixIcon: Icons.lock_open),
              ),        
              SizedBox(height: 30),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.red,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    child: Text(
                      'Guardar',
                      style: TextStyle(color: Colors.white),
                    )),
                onPressed: () => print('GUARDAR PASSWORD'),
              ),
            ],
          )),
    );
  }
}