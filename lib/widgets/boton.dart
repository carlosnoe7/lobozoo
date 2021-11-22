import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class BotonAzul extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isNull;
  final Color color;
  final double borde;

  const BotonAzul({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isNull,
    required this.color,
    required this.borde,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ? es el boton azul
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: this.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(this.borde),
        ),
      ),
      onPressed: this.isNull
          ? null
          : () {
              this.onPressed();
            },
      // ? para ponerle borde redondeado
      // shape: StadiumBorder(),
      child: Container(
        // ? para que obtenga todo el ancho posible
        width: double.infinity,
        // ? para que este mas alto el boton
        height: 50,
        //  color: ,
        child: Center(
            child: Text(this.text,
                style: TextStyle(color: Colors.white, fontSize: 17))),
      ),
    );
  }
}
