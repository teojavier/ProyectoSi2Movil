import 'package:flutter/material.dart';


class InputDecorationsPedidos{

  static InputDecoration pedidosInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon
  }){
   return InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 255, 255, 255),
                )
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255)
              ),
              labelText: labelText,
              labelStyle: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255)
              ),
              prefixIcon: prefixIcon != null
               ? Icon( prefixIcon, color: Color.fromARGB(255, 255, 255, 255))
               :null
              ); 
  }
}