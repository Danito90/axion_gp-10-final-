import 'dart:io';

import 'package:axion_gp/global_widgets/controller.dart';

import 'package:axion_gp/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetView<AxionController> {
  final _formKey = GlobalKey<FormState>();
  double h = Get.height;
  double w = Get.width;
  int super_data = 0;
  int premium_data = 0;
  int diesel_data = 0;
  int euro_data = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: h * 0.02,
            ),
            Container(
                height: h * 0.2,
                width: w - 20,
                child: Image.asset("marca.png")),
            SizedBox(
              height: h * 0.03,
            ),
            Container(
              height: h * 0.18,
              width: w,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: w * 0.1,
                      ),
                      Text(
                        "APELLIDO: ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Container(
                        width: w * 0.1,
                      ),
                      LDropDown(),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: w * 0.1,
                      ),
                      Text(
                        "INGRESAR MEDICION: ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: w * 0.02,
                ),
                Container(
                  height: h * 0.50,
                  width: w / 2,
                  child: Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(width: w / 2, child: _crearSuper()),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Container(width: w / 2, child: _crearPremium()),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Container(width: w / 2, child: _crearDiesel()),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Container(width: w / 2, child: _crearEuro()),
                        ]),
                  ),
                ),
                Container(
                  width: w * 0.08,
                ),
                Container(
                    height: h * 0.40,
                    width: w / 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _crearBoton(),
                        SizedBox(
                          height: h * 0.06,
                        ),
                        RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(color: Colors.black)),
                            child: Text("Descarga",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            color: Colors.white,
                            textColor: Colors.pink,
                            onPressed: () {
                              Get.toNamed(AppRoutes.DESCARGA);
                            }),
                        SizedBox(
                          height: h * 0.06,
                        ),
                        RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: BorderSide(color: Colors.white)),
                            child: Icon(Icons.exit_to_app),
                            color: Colors.black,
                            textColor: Colors.white,
                            onPressed: () {
                              exit(0);
                            }),
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: h * 0.01,
            )
          ],
        ),
      ),
    );
  }

  Widget _crearBoton() {
    return RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(color: Colors.black)),
      child: Text("Calcular",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      color: Colors.white,
      textColor: Colors.pink,
      onPressed: () {
        if (super_data > 2046 ||
            premium_data > 2046 ||
            diesel_data > 2852 ||
            euro_data > 2046) {
          Get.snackbar(
            "Atencion!",
            "Medicion maxima para:\n S: 2046 \n Qn: 2046 \n D: 2852    \n Qd: 2046",
          );
        } else {
          if (_formKey.currentState.validate()) {
            controller.cmCalculo(
                super_data?.toString(),
                premium_data?.toString(),
                diesel_data?.toString(),
                euro_data?.toString(),
                controller.combustibles.value?.midio);

            Get.toNamed(AppRoutes.RESULTADO);
          }
        }
      },
    );
  }

  Widget _crearSuper() {
    return TextFormField(
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      cursorColor: Colors.white,
      keyboardType: TextInputType.number,
      initialValue: "",
      maxLength: 5,
      textCapitalization: TextCapitalization.sentences,
      //decoration: InputDecoration(labelText: 'Nombre'),
      decoration: InputDecoration(
        labelText: 'Super',
        fillColor: Colors.grey[200],
        //filled: true,
        hintText: 'Ingresar CM',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            //color: Colors.transparent,
            width: 3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
      onChanged: (valor) {
        super_data = (double.parse(valor.replaceAll(',', '.')) * 10).truncate();
      },
    );
  }

  Widget _crearPremium() {
    return TextFormField(
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      cursorColor: Colors.white,
      keyboardType: TextInputType.number,
      initialValue: "",
      maxLength: 5,
      textCapitalization: TextCapitalization.sentences,
      //decoration: InputDecoration(labelText: 'Nombre'),
      decoration: InputDecoration(
        labelText: 'Quantium Nafta',
        fillColor: Colors.grey[200],
        //filled: true,
        hintText: 'Ingresar CM',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            //color: Colors.transparent,
            width: 3,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
      onChanged: (valor) {
        premium_data =
            (double.parse(valor.replaceAll(',', '.')) * 10).truncate();
      },
    );
  }

  Widget _crearDiesel() {
    return TextFormField(
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      cursorColor: Colors.white,
      keyboardType: TextInputType.number,
      initialValue: "",
      maxLength: 5,
      textCapitalization: TextCapitalization.sentences,
      //decoration: InputDecoration(labelText: 'Nombre'),
      decoration: InputDecoration(
        labelText: 'Diesel',
        fillColor: Colors.grey[200],
        //filled: true,
        hintText: 'Ingresar CM',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            //color: Colors.transparent,
            width: 4,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
      onChanged: (valor) {
        diesel_data =
            (double.parse(valor.replaceAll(',', '.')) * 10).truncate();
      },
    );
  }

  Widget _crearEuro() {
    return TextFormField(
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      cursorColor: Colors.white,
      keyboardType: TextInputType.number,
      initialValue: "",
      maxLength: 5,
      textCapitalization: TextCapitalization.sentences,
      //decoration: InputDecoration(labelText: 'Nombre'),
      decoration: InputDecoration(
        labelText: 'Quantium Diesel',
        fillColor: Colors.grey[200],
        //filled: true,
        hintText: 'Ingresar CM',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            //color: Colors.transparent,
            width: 4,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
      onChanged: (valor) {
        euro_data = (double.parse(valor.replaceAll(',', '.')) * 10).truncate();
      },
    );
  }
}

class LDropDown extends StatefulWidget {
  @override
  _LDropDownState createState() => _LDropDownState();
}

class _LDropDownState extends State<LDropDown> {
  String dropdownValue = 'AVILA';
  final AxionController c = Get.put(AxionController());
  List<String> dropdownItems = <String>[
    'AVILA',
    'CORDERO',
    'DIAZ',
    "ESTRADA",
    "FUNES",
    "GALDAME",
    "GIL",
    "MARTINEZ",
    "MIGUEZ",
    "SIGNES",
    "VIDELA",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: DropdownButton<String>(
          value: dropdownValue,
          dropdownColor: Colors.black,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 20,
          elevation: 8,
          style: TextStyle(color: Colors.white, fontSize: 20),
          onChanged: (String newValue) {
            c.medido(newValue);

            setState(() {
              dropdownValue = newValue;
            });
          },
          items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}

/* **************
***************
***************
              * END***
***************
***************
************** */
