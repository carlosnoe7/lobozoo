import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

mostrarAlerta ( BuildContext context , String titulo, String subtitulo ){

  // ? importar platform de Dart:io
  if ( Platform.isAndroid ) {
    showDialog(
      context: context,
      builder: ( _ ) => AlertDialog(
        title: Text( titulo ),
        content: Text( subtitulo ),
        actions: <Widget>[
          MaterialButton(
            child: Text( 'Aceptar' ),
            elevation: 5,
            textColor: Colors.green,
            onPressed: () => Navigator.pop(context)
          )
        ],
      )
    );
  } else {

    showCupertinoDialog(
      context: context,
      builder: ( _ ) => CupertinoAlertDialog(
        title: Text( titulo ),
        content: Text( subtitulo ),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('ok'),
            onPressed: () => Navigator.pop(context) ,
          )
        ],
      )
    );


  }


}