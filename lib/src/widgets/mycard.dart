import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String btnmessage;
  final bool empezado;
  final String numreto;
  const CustomCard({Key? key,this.btnmessage="Empezar reto",this.empezado=true,this.numreto="1"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(

      // Con esta propiedad modificamos la forma de nuestro card
      // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

      // Con esta propiedad agregamos margen a nuestro Card
      // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
      margin: EdgeInsets.all(15),

      // Con esta propiedad agregamos elevación a nuestro card
      // La sombra que tiene el Card aumentará
      elevation: 10,
      color: Colors.black87,

      // La propiedad child anida un widget en su interior
      // Usamos columna para ordenar un ListTile y una fila con botones
      child: Column(
        children: <Widget>[

          // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
          Padding(
              padding: EdgeInsets.all(16.0),
              child:Center(
                child: Text('Reto '+numreto,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
              )
          ),
          Row(
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                const Expanded(child:Text(
                  'Este es el subtitulo del card. Aqui podemos colocar descripción de este card.',style: TextStyle(color: Colors.white),
                ) ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                Column(
                  children: [
                    ClipOval(
                      child: Container(
                        color: Colors.blueAccent,
                        padding: EdgeInsets.symmetric(horizontal: 9),
                        child: Text(
                          "3",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    Text("Puntos",style: TextStyle(color: Colors.white),)
                  ],

                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 12))

              ]
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          ElevatedButton(onPressed: (){}, child:  Text(btnmessage),style: ElevatedButton.styleFrom(
              primary: Color(empezado ? 0xff40CBF8 : 0xff30CC2D),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              )
          ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10)),

          // Usamos una fila para ordenar los botones del card

        ],
      ),
    );
  }
}

