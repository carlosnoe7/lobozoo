import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter/cupertino.dart';

import 'package:lobozoo/widgets/Custom_input.dart';
import 'package:lobozoo/widgets/boton.dart';
import 'package:lobozoo/widgets/mostrarAlerta.dart';

final _storage = const FlutterSecureStorage();
CollectionReference users = FirebaseFirestore.instance.collection('users');

var namecool;
var emailcool;
var birhdaycool;

Future<dynamic> someFutureStringFunction() async {
  final email = await _storage.read(key: 'email');
  return users.doc(email).get().then((value) {
    namecool = value.get('name');
    emailcool = email;
    if(value.get('birthday') != null){
      birhdaycool = DateTime.parse(value.get('birthday'));
    }else{
      birhdaycool = DateTime.now();
    }

    dynamic datos = {
      'name': namecool,
      'email': emailcool,
      'birthday': birhdaycool,
    };

    return datos;
  }).catchError((e) {
    return '';
  });
  // return await namecool;
}

class PagInicio extends StatelessWidget {
  const PagInicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: FutureBuilder(
        future: someFutureStringFunction(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _Form(),
                  ],
                ),
              ),
            ));
          } else {
            return Center(
              child: Text('Loading...'),
            );
          }
        },
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController(text: emailcool);
  final nameCtrl = TextEditingController(text: namecool);
  final format = DateFormat("yyyy-MM-dd");
  dynamic _date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.account_circle_outlined,
            placeholder: namecool != null ? namecool : 'Nombre',
            keywordType: TextInputType.name,
            textControler: nameCtrl,
          ),
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: emailcool != null ? emailcool : 'Correo',
            keywordType: TextInputType.emailAddress,
            textControler: emailCtrl,
          ),
          DateTimeField(
            format: format,
            initialValue: birhdaycool,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'Fecha de nacimiento',
              labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal),
              filled: true,
              fillColor: Colors.black,
              prefixIcon: Icon(Icons.calendar_today, color: Colors.white),
              counterText: 'aaaa/mm/dd',
              counterStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.normal),
              helperText: 'Formato de Fecha',
              helperStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
            onShowPicker: (context, currentValue) async {
              final date = await showDatePicker(
                locale: const Locale("es", "ES"),
                initialEntryMode: DatePickerEntryMode.input,
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                confirmText: 'Guardar',
                cancelText: 'Cancelar',
                initialDate: birhdaycool != null ? birhdaycool : DateTime.now(),
                helpText: 'Selecciona tu fecha de nacimiento',
              );
              if (date != null) {
                _date = date;
                return date;
              }
              else{
                return birhdaycool;
              }
            },
          ),
          const Text(''),
          BotonAzul(
              color: Colors.green,
              text: 'Actualizar perfil',
              borde: 15,
              isNull: false,
              onPressed: () async {
                final email = await _storage.read(key: 'email');
                if(_date == null){
                  mostrarAlerta(context,'Error','Para actualizar debe agregar su fecha de nacimiento');
                    return;
                }
                String formattedDate = DateFormat('y-M-d').format(_date);
                users
                    .doc(email)
                    .update({
                      'name': nameCtrl.text,
                      'email': emailCtrl.text,
                      'birthday': formattedDate,
                    })
                    .then((value) => print("update user"))
                    .catchError((error) => print("Failed to add user: $error"));
                Navigator.pushReplacementNamed(context, 'home');
              })
        ],
      ),
    );
  }
}
