import 'package:flutter/material.dart';
import 'package:lobozoo/screens/Eventos.dart';
import 'package:lobozoo/screens/Principal.dart';
import 'package:lobozoo/screens/pag_inicio.dart';

class Home extends StatefulWidget {
  @override
  State createState() {
    return _HomeState();
  }
}

class _HomeState extends State {
  @override
  int _currentIndex = 2;
  final List _children = [
    Eventos(),
    PagInicio(Colors.deepOrange),
    Principal(),
    PagInicio(Colors.yellow),
    PagInicio(Colors.black)
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Lobozoo"),
      ), */
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        iconSize: 40,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Eventos',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Retos',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil',
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
