import 'package:flutter/material.dart';

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
            padding: EdgeInsets.all(30.0),
            alignment: Alignment.center,
            child: Image(image: AssetImage("assets/inicio_zoo.jpg"))),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: TextFormField(
              decoration: InputDecoration(
            hintText: "Realiza una busqueda",
            //labelText: ,
            prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          )),
        ),
      ],
    ));
  }
}
