import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lobozoo/src/widgets/buttonimg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//List<String>  animals = ['leon','mono','jirafa','jirafa']..length = 20;




List<dynamic> animals=[];
List<dynamic> nombresAnimales=[];
List<dynamic> textosanimals=[];

Future<List<dynamic>> someFutureStringFunction() async {
  int i=0;
  return  FirebaseFirestore.instance
      .collection('animales')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
     // print(doc.data());
      //print(doc["name"]);
      print(doc["image"]);
      //print("El indice es "+'$i');
      //animals[i]=doc["image"];
      textosanimals.add(doc["description"]);
      animals.add(doc["image"]);
      //nombresAnimales[i]=  doc["name"];
      nombresAnimales.add(doc["name"]);
      i++;
    });
    i=0;
    return nombresAnimales;
  }).catchError((onError)=>print(onError));

}

class MapaScreen extends StatelessWidget {
  const MapaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
     body: FutureBuilder(

       future: someFutureStringFunction(),
       builder: (context,AsyncSnapshot<List<dynamic>>snapshot){
         if (snapshot.hasData) {
           return Stack(
             children: <Widget>[
               new Container(
                 decoration: new BoxDecoration(
                     image:new DecorationImage(image: new AssetImage("assets/mapa2.png"),fit: BoxFit.cover)
                 ),
               ),
               Center(
                   child: StaggeredGridView.count(crossAxisCount: 4,
                     children: <Widget>[

                       ButtonImg(descripcion: textosanimals[0],img: animals[0],title:nombresAnimales[0]),
                       ButtonImg(descripcion: textosanimals[1],img: animals[1],title:nombresAnimales[1]),
                       ButtonImg(descripcion: textosanimals[2],img: animals[2],title:nombresAnimales[2]),
                       ButtonImg(descripcion: textosanimals[3],img: animals[3],title:nombresAnimales[3]),
                       ButtonImg(descripcion: textosanimals[4],img: animals[4],title:nombresAnimales[4]),
                       ButtonImg(descripcion: textosanimals[5],img: animals[5],title:nombresAnimales[5]),
                       ButtonImg(descripcion: textosanimals[6],img: animals[6],title:nombresAnimales[6]),
                       ButtonImg(descripcion: textosanimals[7],img: animals[7],title:nombresAnimales[7]),
                     ],
                     staggeredTiles: const [
                       StaggeredTile.count(2, 2), // takes up 2 rows and 2 columns space
                       StaggeredTile.count(2, 1), // takes up 2 rows and 1 column
                       StaggeredTile.count(1, 2),
                       StaggeredTile.count(1, 2),
                       StaggeredTile.count(2, 2),
                       StaggeredTile.count(2, 1), // takes up 2 rows and 1 column
                       StaggeredTile.count(1, 2),
                       StaggeredTile.count(2, 1), // takes up 2 rows and 1 column
                       // takes up 1 row and 2 column space
                     ],
                   )
               )
             ],
           );
         } else {
           return Scaffold(
             body: Center(
                child: SpinKitRotatingCircle(
                  color: Colors.lightGreen,
                  size: 50.0,
                ),
             ),
           );
         }
       },
     )
    );
  }
}
/*
ButtonImg(descripcion: textosanimals[index],img: "assets/"+animals[index]+".jpg")
 */

/*
Stack(
       children: <Widget>[
         new Container(
           decoration: new BoxDecoration(
             image:new DecorationImage(image: new AssetImage("assets/mapa2.png"),fit: BoxFit.cover)
           ),
         ),
         Center(
           child: StaggeredGridView.count(crossAxisCount: 4,
             children: <Widget>[

               ButtonImg(descripcion: textosanimals[0],img: animals[0],title:nombresAnimales[0]),
               ButtonImg(descripcion: textosanimals[1],img: animals[1],title:nombresAnimales[1]),
               ButtonImg(descripcion: textosanimals[2],img: animals[2],title:nombresAnimales[2]),
               ButtonImg(descripcion: textosanimals[1],img: animals[1],title:nombresAnimales[1]),
               ButtonImg(descripcion: textosanimals[2],img: animals[2],title:nombresAnimales[2]),
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
*/