import 'package:appmovil/services/editPerfil_service.dart';
import 'package:appmovil/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditarPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final perfilService = Provider.of<EditarPerfilService>(context);
    return Scaffold(
        drawer: Navbar(),
        appBar: AppBar(
          title: Text('Editar Perfil'),
        ),
        body: Container(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              CardContainer(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text('Datos', style: Theme.of(context).textTheme.headline4),
                    SizedBox(height: 30),
                    _EditForm(
                        perfilService.id,
                        perfilService.name,
                        perfilService.email,
                        perfilService.carnet,
                        perfilService.direccion,
                        perfilService.telefono),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}

class _EditForm extends StatelessWidget {
  final String? id;
  final String? name;
  final String? email;
  final String? ci;
  final String? direccion;
  final String? telefono;
  const _EditForm(
      this.id, this.name, this.email, this.ci, this.direccion, this.telefono);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Escriba el nombre',
                    labelText: name!,
                    prefixIcon: Icons.person),
              ),
              SizedBox(height: 10),
              TextFormField(
                autocorrect: false,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Escriba el E-mail',
                    labelText: email!,
                    prefixIcon: Icons.alternate_email_sharp),
              ),
              SizedBox(height: 10),
              TextFormField(
                autocorrect: false,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Escriba su Carnet',
                    labelText: ci!,
                    prefixIcon: Icons.numbers_sharp),
              ),
              SizedBox(height: 10),
              TextFormField(
                autocorrect: false,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Escriba su Direccion',
                    labelText: direccion!,
                    prefixIcon: Icons.place),
              ),
              SizedBox(height: 10),
              TextFormField(
                autocorrect: false,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Escriba su Telefono',
                    labelText: telefono!,
                    prefixIcon: Icons.phone_android),
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
                onPressed: () => print('EDITAR PERFIL'),
              ),
            ],
          )),
    );
  }
}
