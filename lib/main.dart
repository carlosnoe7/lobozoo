import 'package:flutter/material.dart';
import 'package:lobozoo/src/screens/mapascreen.dart';

import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lobozoo/routes/routes.dart';
// import 'package:lobozoo/screens/login_page.dart';
// import 'package:lobozoo/screens/home.dart';

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
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
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
