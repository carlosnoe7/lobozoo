import 'package:flutter/material.dart';

import 'package:lobozoo/routes/routes.dart';

import 'package:lobozoo/widgets/Custom_input.dart';
import 'package:lobozoo/widgets/boton.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // backgroundColor: Colors.black,
      // ),
      // ? fondo de colo de la pantalla
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
          // ? con esto podemos hacer scroll pero lo que esta adentro se junta
          child: SingleChildScrollView(
        // ? pone una animacion como tipo rebote cuando haces el scroll hasta arriba
        physics: const BouncingScrollPhysics(),
        child: Container(
          // ! Aqui solucionamos el problema que teniamos cuando hacemos que la
          // ! pantalla se veia muy apretada, encerrando nuestra columna en un container
          // ! y poniendo el heigt que cubra el 90% de la pantalla
          height: MediaQuery.of(context).size.height * 0.9,
          // ? como vamos a mostrar lo que es la imagen y los inputs necesitamos ponerlo en columnas
          child: Column(
            // ? ponemos que se separen de maera vertical entre cad uno de ellos
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ? para tener un codigo mas limpio ponemos un metodo que nos haga referencia a los metodos
            children: <Widget>[
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
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final passCtrl1 = TextEditingController();
  final passCtrl2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ! quitamos ek build porque aqui ya se podra redibujar si esta propiedad
    // ! para poder obtener los servicios tenemos que extablecerlos en el main
    //final authService   = Provider.of<AuthService>( context );

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
            placeholder: 'Contraseña',
            textControler: passCtrl1,
            isPassword: true,
          ),
          CustomInput(
            icon: Icons.lock_clock_outlined,
            placeholder: 'Confirmar Contraseña',
            textControler: passCtrl2,
            isPassword: true,
          ),
          BotonAzul(
              color: Colors.green,
              text: 'Crear Cuenta',
              borde: 15,
              isNull: false,
              onPressed: () async {
                if (passCtrl1.text == passCtrl2.text) {
                  // print('son iguales');
                }
                // Navigator.pushReplacementNamed(context, 'home');
              })
        ],
      ),
    );
  }
}
