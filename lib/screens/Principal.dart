import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';


final List<Tarjeta> tarj = [];

Future<dynamic> guardarDatos() async {
  FirebaseFirestore.instance
      .collection('tarjetas')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      Tarjeta n1 = Tarjeta(doc["nombre"], doc["descripcion"], doc["foto"]);
      tarj.add(n1);
    });
  });

  return "bien";
}

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: FutureBuilder(
          future: guardarDatos(),
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return ListView(
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
              );
            } else {
              return Center(
                child: Text('Loading...'),
              );
            }
          },
        ),
      ),
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
    querySnapshot.docs.forEach((doc) {
      Tarbus n1 = Tarbus(doc["nombre"], doc["descripcion"], doc["link"]);
      busq1.add(n1);
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

class tarjetas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('tarjetas')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Tarjeta n1 = Tarjeta(doc["nombre"], doc["descripcion"], doc["foto"]);
      });
    });
    guardarDatos();
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
        )
        );
  }
}

