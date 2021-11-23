import 'package:flutter/material.dart';
import 'package:lobozoo/src/screens/mapascreen.dart';

import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lobozoo/routes/routes.dart';
// import 'package:lobozoo/screens/login_page.dart';
// import 'package:lobozoo/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Lobozoo());
}

/// This is the main application widget.
class Lobozoo extends StatefulWidget {
  const Lobozoo({Key? key}) : super(key: key);

  @override
  _LobozooState createState() => _LobozooState();
}

class _LobozooState extends State<Lobozoo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('es'),
      ],
      title: 'Lobozoo',
      // home: Home(),
      initialRoute: 'login',
      routes: appRoutes,


    );
  }
}



/*
return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('es'),
      ],
      title: 'Lobozoo',
      // home: Home(),
      initialRoute: 'login',
      routes: appRoutes,


    );



*/
