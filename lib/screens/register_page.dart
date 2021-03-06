import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:lobozoo/routes/routes.dart';
import 'package:lobozoo/widgets/Custom_input.dart';
import 'package:lobozoo/widgets/boton.dart';
import 'package:lobozoo/widgets/mostrarAlerta.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
                    text: 'Iniciar Sesion',
                    isNull: false,
                    onPressed: () {
                      Navigator.pushNamed(context, 'login');
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
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final passCtrl1 = TextEditingController();
  final passCtrl2 = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(top: 40),
      // ? que use lo mismo en toda la parte horizontal de unos 50
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.account_circle_outlined,
            placeholder: 'Nombre',
            keywordType: TextInputType.name,
            textControler: nameCtrl,
          ),
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keywordType: TextInputType.emailAddress,
            textControler: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_clock_outlined,
            placeholder: 'Contrase??a',
            textControler: passCtrl1,
            isPassword: true,
          ),
          CustomInput(
            icon: Icons.lock_clock_outlined,
            placeholder: 'Confirmar Contrase??a',
            textControler: passCtrl2,
            isPassword: true,
          ),
          BotonAzul(
              color: Colors.green,
              text: 'Crear Cuenta',
              borde: 15,
              isNull: false,
              onPressed: () async {
                if (nameCtrl.text == '' ||
                    emailCtrl.text == '' ||
                    passCtrl2.text == '') {
                  mostrarAlerta(context, 'Reguistro incorrecto',
                      'Favor de verificar los datos');
                  return;
                }

                if (passCtrl1.text != passCtrl2.text) {
                  mostrarAlerta(context, 'Reguistro incorrecto',
                      'Las contrase??as no coinciden');
                  return;
                }

                if (passCtrl1.text.length < 9) {
                  mostrarAlerta(context, 'Reguistro incorrecto',
                      'La contrase??a debe tener al menos 9 caracteres');
                  return;
                }

                if (passCtrl2.text.length < 9) {
                  mostrarAlerta(context, 'Reguistro incorrecto',
                      'La contrase??a debe tener al menos 9 caracteres');
                  return;
                }

                final userExist =
                    await users.doc(emailCtrl.text).get().then((value) {
                  if (value.exists) {
                    mostrarAlerta(context, 'Reguistro incorrecto', 'Usuario ya existente');
                    return 0;
                  }
                });

                if (userExist == 0) {
                  return;
                }

                if (passCtrl1.text == passCtrl2.text) {
                    users.doc(emailCtrl.text).set({
                      'name': nameCtrl.text,
                      'password': passCtrl2.text,
                    }).then((value) => print("User Added"))
                    .catchError((error) => print("Failed to add user: $error"));
                  Navigator.pushNamed(context, 'login');
                }
              })
        ],
      ),
    );
  }
}
