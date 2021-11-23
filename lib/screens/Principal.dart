import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 400, width: 150, child: tarjetas()),
          ),
        ],
      )),
    );
  }
}

class tarjetas extends StatelessWidget {
  const tarjetas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
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
          items: [
            Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Ink.image(
                image: cardImage,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

var cardImage =
    NetworkImage('https://source.unsplash.com/random/800x600?house');
