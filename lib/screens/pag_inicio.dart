import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'package:flutter/cupertino.dart';

import 'package:lobozoo/widgets/Custom_input.dart';
import 'package:lobozoo/widgets/boton.dart';
class PagInicio extends StatelessWidget {
  const PagInicio({Key? key}) : super(key: key);

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
          height: MediaQuery.of(context).size.height * 0.9,
          // ? como vamos a mostrar lo que es la imagen y los inputs necesitamos ponerlo en columnas
          child: Column(
            // ? ponemos que se separen de maera vertical entre cad uno de ellos
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ? para tener un codigo mas limpio ponemos un metodo que nos haga referencia a los metodos
            children: <Widget>[
              _Form(),
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
  final format = DateFormat("yyyy-MM-dd");

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
          DateTimeField(
            format: format,
            style:const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Fecha de nacimiento',
              labelStyle: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal),
              filled: true,
              fillColor: Colors.black,
              prefixIcon: Icon(Icons.calendar_today, color: Colors.white),
              counterText: 'aaaa/mm/dd',
              counterStyle: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.normal),
              helperText: 'Formato de Fecha',
              helperStyle: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.normal),
            ),
            onShowPicker: (context, currentValue) async {
              final date = await showDatePicker(
                locale : const Locale("es","ES"),
                initialEntryMode: DatePickerEntryMode.input,
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                confirmText: 'Guardar',
                cancelText: 'Cancelar',
                initialDate: currentValue ?? DateTime.now(),
                helpText: 'Selecciona tu fecha de nacimiento',
              );
                if (date != null) {
                  return date;
                };
            },
          ),
          const Text(''),
          BotonAzul(
              color: Colors.green,
              text: 'Actualizar perfil',
              borde: 15,
              isNull: false,
              onPressed: () async {
                // Navigator.pushReplacementNamed(context, 'home');
              })
        ],
      ),
    );
  }
}
