import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:lobozoo/routes/routes.dart';
import 'package:lobozoo/widgets/Custom_input.dart';
import 'package:lobozoo/widgets/boton.dart';
import 'package:lobozoo/widgets/mostrarAlerta.dart';

 final _storage = const FlutterSecureStorage();

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ? fondo de colo de la pantalla
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
          // ? con esto podemos hacer scroll pero lo que esta adentro se junta
          child: SingleChildScrollView(
        // ? pone una animacion como tipo rebote cuando haces el scroll hasta arriba
        physics: const BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          // ? como vamos a mostrar lo que es la imagen y los inputs necesitamos ponerlo en columnas
          child: Column(
            // ? ponemos que se separen de maera vertical entre cad uno de ellos
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ? para tener un codigo mas limpio ponemos un metodo que nos haga referencia a los metodos
            children: <Widget>[
              const Image(image: AssetImage("assets/inicio_zoo.jpg")),
              _Form(),
              SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: BotonAzul(
                    color: Colors.black,
                    borde: 0,
                    text: 'Crear cuenta',
                    isNull: false,
                    onPressed: () {
                      Navigator.pushNamed(context, 'register');
                    },
                  )),
            ],
          ),
        ),
      )),
    );
  }
}

// ? metodo que contendra el formulario
class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Container(
      margin: const EdgeInsets.only(top: 40),
      // ? que use lo mismo en toda la parte horizontal de unos 50
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keywordType: TextInputType.emailAddress,
            textControler: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_clock_outlined,
            placeholder: 'Password',
            textControler: passCtrl,
            isPassword: true,
          ),
          BotonAzul(
              color: Colors.green,
              text: 'Iniciar Session',
              borde: 15,
              isNull: false,
              onPressed: () async {
                // ? quitamos el foco de donde sea que este por ahora y ocultamos el teclado
                FocusScope.of(context).unfocus();
                if( emailCtrl.text == '' || passCtrl.text == ''){
                  mostrarAlerta(context, 'Error', 'Por favor llene todos los campos');
                  return;
                }
                if(passCtrl.text.length < 9){
                  mostrarAlerta(context, 'Error', 'La contraseña debe tener al menos 9 caracteres');
                  return;
                }
                users.doc(emailCtrl.text).get().then((value) {
                  if (value.exists) {
                    if (value.get('password') == passCtrl.text) {
                      _storage.write(key: 'email', value: emailCtrl.text);
                      Navigator.pushReplacementNamed(context, 'home');
                    } else {
                      mostrarAlerta(context,'Login incorrecto','Favor de verificar los datos');
                      return;
                    }
                  } else {
                    mostrarAlerta(context,'Login incorrecto','Favor de verificar los datos');
                    return;
                  }
                });
              })
        ],
      ),
    );
  }
}
