import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lobozoo/routes/routes.dart';
// import 'package:lobozoo/screens/login_page.dart';
// import 'package:lobozoo/screens/home.dart';
import 'package:lobozoo/src/screens/mapascreen.dart';


void main() => runApp(Lobozoo());

/// This is the main application widget.
class Lobozoo extends StatelessWidget {
  const Lobozoo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    return MaterialApp(

      title: 'Lobozoo',
      // home: Home(),
      initialRoute: 'login',
      routes: appRoutes,


    );
  }
}
