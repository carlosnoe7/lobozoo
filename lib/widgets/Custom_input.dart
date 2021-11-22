import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {

  // ? Lo que estaremos recibiendo para ponerselo al boton
  // ? el icono
  final IconData icon;
  // ? placeholder
  final String placeholder;
  // ? Obtener el valor de la caja de texto actual
  final TextEditingController textControler;
  // ? que es lo que se llenara, que tipo Ej, un email, number etc
  final TextInputType keywordType;
  // ? si es una contraseña
  final bool isPassword;

  const CustomInput({
    // ? si se ocupa la referencia de este
    Key? key,
    required this.icon,
    required this.placeholder,
    required this.textControler,
    this.keywordType = TextInputType.text ,
    this.isPassword = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // ? Modificar que al momento de llenarse el texto quede pegado al final del input
      // padding: EdgeInsets.only( top: 0, left: 0, bottom: 0, right: 0),
      // ? separacion de margen con otros widgets
      margin: EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        // ? para la sombra que aparece atras
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity( 0.5 ),
            // ? Mover la sombra
            offset: Offset(0,5),
            // ? como un difuminado
            blurRadius: 5
          )
        ]
      ),
      child: TextField(
        // ? valor del input
        controller: this.textControler,
        // ? que no autocomplete
        autocorrect: false,
        // ? para decir que es lo que meteran
        keyboardType: this.keywordType,
        cursorColor: Colors.white,
        // ? para ponerlo como si fuera una contraseña
        obscureText: this.isPassword,
        // ? decoracion el input
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Colors.white
          ),
          // ? icono en el principio
          prefixIcon: Icon(this.icon, color: Colors.white,),
          // ? quitar la linea de abajo
          focusedBorder: InputBorder.none,
          // ? quitar la otra linea aunque no este seleccionado
          border: InputBorder.none,
          // ? como un placeholder, lo que pondra por defecto en el boton
          hintText: this.placeholder,
          fillColor: Colors.white,
        ),
        style: TextStyle(
          color: Colors.white
        ),
      ),
    );
  }
}