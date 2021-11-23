import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';

// color verde = 0A5D00
class Eventos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('eventos').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return ListView(
                children: snapshot.data!.docs.map((eventos) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: Card(
                          elevation: 4.0,
                          child: Column(
                            children: [
                              /*ListTile(
                title: Text(heading),
                subtitle: Text(subheading),
                trailing: Icon(Icons.favorite_outline),
              ), */
                              Container(
                                height: 200.0,
                                child: Image.network(
                                  eventos['foto'],
                                  fit: BoxFit.fill,
                                  height: 60,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.center,
                                child: Text(eventos['nombre']),
                              ),
                              Container(
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.center,
                                child: Text(eventos['descripcion']),
                              ),
                              Container(
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.center,
                                child: Text(eventos['dias']),
                              ),
                              Container(
                                padding: EdgeInsets.all(16.0),
                                alignment: Alignment.center,
                                child: Text(eventos['duracion']),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    child: const Text('Agregar Recordatorio'),
                                    onPressed: () {/* ... */},
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
        /*Container(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Image(image: AssetImage("assets/eventosZoo.jpg")),
                    
                    /*buildCard(),
                    buildCard(),
                    buildCard(),
                    buildCard(),
                    buildCard(),
                    buildCard(),
                    buildCard(), */
                  ],
                )),
          )*/
      ),
    );
  }

//cartas
  var cardImage =
      NetworkImage('https://source.unsplash.com/random/800x600?house');
  Card buildCard() {
    var heading = '\$2300 per month';
    var subheading = '2 bed, 1 bath, 1300 sqft';
    var cardImage =
        NetworkImage('https://source.unsplash.com/random/800x600?house');
    var supportingText =
        'Beautiful home to rent, recently refurbished with modern appliances...';
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            /*ListTile(
              title: Text(heading),
              subtitle: Text(subheading),
              trailing: Icon(Icons.favorite_outline),
            ), */
            Container(
              height: 100.0,
              child: Ink.image(
                image: cardImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(supportingText),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: const Text('Conocer mas'),
                  onPressed: () {/* ... */},
                )
              ],
            )
          ],
        ));
  }
}
