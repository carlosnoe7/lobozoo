import 'package:flutter/material.dart';

import 'package:lobozoo/screens/home.dart';
import 'package:lobozoo/screens/login_page.dart';
import 'package:lobozoo/screens/register_page.dart';


final  Map<String, Widget Function(BuildContext)> appRoutes = {
    // ? Nombre de ruta
                  // ? BuildContext
                            // ? nos retornara esta pagina
 'login'     : ( _ ) => LoginPage(),
 'home' : ( _ ) => Home(),
 'register': ( _ ) => RegisterPage(),
};