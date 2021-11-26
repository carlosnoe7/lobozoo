import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: ListView(
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height: 400, width: 150, child: tarjetas()),
              ),
            ],
          )),
    );
  }
}

class Tarjeta {
  String nombre = "";
  String desc = "";
  String foto = "";

  Tarjeta(String nombre, String desc, String foto) {
    this.nombre = nombre;
    this.desc = desc;
    this.foto = foto;
  }
}

final List<Tarjeta> tarj = [];

Future<String> guardarDatos() async {
  FirebaseFirestore.instance
      .collection('tarjetas')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      Tarjeta n1 = Tarjeta(doc["nombre"], doc["descripcion"], doc["foto"]);
      // print(n1.foto);
      tarj.add(n1);
      // print(doc["nombre"] + doc["descripcion"]);
    });
  });

  return "bien";
}

class tarjetas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('tarjetas')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Tarjeta n1 = Tarjeta(doc["nombre"], doc["descripcion"], doc["foto"]);
        //print(n1.foto);
        // print(doc["nombre"] + doc["descripcion"]);
      });
    });
    //print(tarj[0].desc + "val");
    return CarouselSlider(
        items: tarj
            .map((e) => Stack(children: [
                  Image.network(e.foto, fit: BoxFit.cover),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
                    child: Container(
                      color: Colors.green,
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
                        child: Text(
                          e.nombre,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 160.0, 0.0, 0.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                        child: Text(
                          e.desc,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ]))
            .toList(),
        options: CarouselOptions(
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          viewportFraction: 0.8,
        ));
    /* ListView(
      children: <Widget>[
        SizedBox(
          height: 30.0,
          width: 200,
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 350.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            viewportFraction: 0.8,
          ),
          items: //nombres.map((e) => Center()),
           [
                  


            Container(
              width: 200,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Stack(
                children: [
                  Ink.image(
                    image: cardImage,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
                    child: Container(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Titulo",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Texto relleno",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ), 
          ],
        ),
      ],
    ); */
  }
}

var cardImage =
    NetworkImage('https://source.unsplash.com/random/800x600?house');
