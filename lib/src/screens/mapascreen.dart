import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lobozoo/src/widgets/buttonimg.dart';

List<String> animals=['leon','mono','jirafa'];
List<String> textosanimals=["Este es el texto del leon","Este es el texto del mono","Este es el texto de la jirafa"];


class MapaScreen extends StatelessWidget {
  const MapaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Stack(
       children: <Widget>[
         new Container(
           decoration: new BoxDecoration(
             image:new DecorationImage(image: new AssetImage("assets/mapa.jpg"),fit: BoxFit.cover)
           ),
         ),
         Center(
           child: StaggeredGridView.count(crossAxisCount: 4,
             children: List.generate(3,
                 (index)=>Center(
                   child: ButtonImg(descripcion: textosanimals[index],img: "assets/"+animals[index]+".jpg")
                 )),
             staggeredTiles: const [
               StaggeredTile.count(2, 2), // takes up 2 rows and 2 columns space
               StaggeredTile.count(2, 1), // takes up 2 rows and 1 column
               StaggeredTile.count(1, 2), // takes up 1 row and 2 column space
             ],
           )
         )
       ],
     ),
    );
  }
}
