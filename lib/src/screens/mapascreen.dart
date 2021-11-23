import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lobozoo/src/widgets/buttonimg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//List<String>  animals = ['leon','mono','jirafa','jirafa']..length = 20;




var animals=['leon','mono','jirafa','jirafa'];
var textosanimals=["Este es el texto del leon","Este es el texto del mono","Este es el texto de la jirafa","Texto de jirafa"];


class MapaScreen extends StatelessWidget {
  const MapaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('eventos')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc["descripcion"]);
      });
    });
    return Scaffold(
     body: Stack(
       children: <Widget>[
         new Container(
           decoration: new BoxDecoration(
             image:new DecorationImage(image: new AssetImage("assets/mapa2.png"),fit: BoxFit.cover)
           ),
         ),
         Center(
           child: StaggeredGridView.count(crossAxisCount: 4,
             children: <Widget>[
               ButtonImg(descripcion: textosanimals[0],img: "assets/"+animals[0]+".jpg"),
               ButtonImg(descripcion: textosanimals[1],img: "assets/"+animals[1]+".jpg"),
               ButtonImg(descripcion: textosanimals[2],img: "assets/"+animals[2]+".jpg"),
               ButtonImg(descripcion: textosanimals[2],img: "assets/"+animals[3]+".jpg"),
               ButtonImg(descripcion: textosanimals[2],img: "assets/"+animals[3]+".jpg"),
             ],
             staggeredTiles: const [
               StaggeredTile.count(2, 2), // takes up 2 rows and 2 columns space
               StaggeredTile.count(2, 1), // takes up 2 rows and 1 column
               StaggeredTile.count(1, 2),
               StaggeredTile.count(1, 2),
               StaggeredTile.count(2, 2),
               // takes up 1 row and 2 column space
             ],
           )
         )
       ],
     ),
    );
  }
}
/*
ButtonImg(descripcion: textosanimals[index],img: "assets/"+animals[index]+".jpg")
 */