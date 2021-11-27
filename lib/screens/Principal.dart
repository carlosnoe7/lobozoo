import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

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
              busqueda(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height: 400, width: 150, child: tarjetas()),
              ),
            ],
          )),
    );
  }
}

class busqueda extends StatefulWidget {
  const busqueda({
    Key? key,
  }) : super(key: key);

  @override
  _busquedaState createState() => _busquedaState();
}

class _busquedaState extends State<busqueda> {
  String _searchText = "";
  TextEditingController _searchController = new TextEditingController();
  List Listaoriginal = ["perro", "gato"];
  List flitroLista = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: TextField(
        onSubmitted: (value) {
          print(value);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => busq(val: value)));
        },
        controller: _searchController,
        decoration: InputDecoration(
          hintText: "Buscar",
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          suffixIcon: _searchText.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void filter(String inputString) {
    flitroLista =
        Listaoriginal.where((i) => i.toLowerCase().contains(inputString))
            .toList();
    setState(() {});
  }
}

class busq extends StatelessWidget {
  final String val;
  const busq({Key? key, required this.val}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //busq1.clear();
    buscarda(val);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Regresar")),
            Container(
              width: 500,
              height: 300,
              child: ListView.builder(
                  itemCount: busq1.length,
                  itemBuilder: (BuildContext contex, int index) {
                    return ListTile(
                      onTap: () {
                        _launchURL(busq1[index].link);
                      },
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.grey.shade200,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  busq1[index].nombre,
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                              Container(
                                  child: Text(
                                busq1[index].desc,
                                style: TextStyle(fontSize: 20),
                              )),
                              Container(
                                  child: Text("conocer mas",
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.blue.shade400,
                                      ))),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

_launchURL(String link) async {
  var url = link;
  if (!await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'no se abiro';
  }
}

class Tarbus {
  String nombre = "";
  String desc = "";
  String link = "";

  Tarbus(String nombre, String desc, String link) {
    this.nombre = nombre;
    this.desc = desc;
    this.link = link;
  }
}

final List<Tarbus> busq1 = [];

Future<String> buscarda(String idb) async {
  FirebaseFirestore.instance
      .collection('busqueda')
      .doc('animales')
      .collection('animales')
      .get()
      .then((QuerySnapshot querySnapshot) {
    busq1.clear();
    //print("hola ${documentSnapshot.reference.snapshots(sna)}");
    querySnapshot.docs.forEach((doc) {
      Tarbus n1 = Tarbus(doc["nombre"], doc["descripcion"], doc["link"]);
      // print(n1.foto);
      busq1.add(n1);
      //print(doc["nombre"] + doc["descripcion"]);
    });
  });

  return "bien";
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
    guardarDatos();
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
