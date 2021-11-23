import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lobozoo/routes/routes.dart';

import 'package:lobozoo/widgets/Custom_input.dart';
import 'package:lobozoo/widgets/boton.dart';

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
              // ? aqui como ya tenemos nuestro servicio, variable y lo estamos llamando
              //? entonces le pasamos la validacion para saber si se esta autenticando
              //? y asi deshabilitamos el boton
              isNull: false,
              onPressed: () async {
                // ? quitamos el foco de donde sea que este por ahora y ocultamos el teclado
                FocusScope.of(context).unfocus();
                print(emailCtrl.text);
                print(passCtrl.text);
                // ? podemos poner aqui nuestro servicio como es una funcion o tambien en
                // ? la parte de arriba abajo del build
                // // ? mandamos a llamar el servicio
                // // ? of(context) para hacer la referencia al arbol de widgets
                // // ! ponemos el listen en false porquesino entonces intentaria redibujar nuestro widget
                // final authService = Provider.of<AuthService>(context, listen: false);
                // ? Aqui ya estamos mandando la info de el servicios
                //? el trim es para asegurarnos que no van espacios en blanco
//              final loginOk = await authService.login(emailCtrl.text.trim(), passCtrl.text.trim());

                // if ( loginOk ) {
                //   // ? Navegar a la pantalla
                //   socketService.connect();
                //   // ! Se le pone pushreplace... para que ya no pueda regresar a esta pantalla
                //     // ! pues ya esta logeado
                //   // ? conectar a nuestro socket server
                Navigator.pushReplacementNamed(context, 'home');
                // } else{
                //   // ? mostrar alerta
                //    mostrarAlerta(
                //      context,
                //      'Login incorrecto',
                //      'Favor de verificar los datos'
                //   );
                // }
              })
        ],
      ),
    );
  }
}
