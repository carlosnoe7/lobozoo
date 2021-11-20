import 'package:flutter/material.dart';

class Labels extends StatelessWidget {

  final String rutaNavegar;
  final String titulo;
  final String subtitulo;

  const Labels({
    Key? key,
    required this.rutaNavegar,
    required this.titulo,
    required this.subtitulo,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(this.titulo, style: TextStyle( color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300 ),),
          SizedBox( height: 10 ),
          // ! como queremos que en este texto lo mande a otra pantalla por runts haremos lo sig.
          // ? el Gestur... permite poner cualquier gesto y reconocerlo, como el ontap
          GestureDetector(
            child: Text( this.subtitulo , style: TextStyle( color: Colors.blue[600], fontSize: 15, fontWeight: FontWeight.bold )),
            onTap: () {
              Navigator.pushReplacementNamed(context, this.rutaNavegar);
            },
          ),

        ],
      ),
    );
  }
}