import 'package:axion_gp/global_widgets/controller.dart';
import 'package:axion_gp/global_widgets/tabla.dart';
import 'package:axion_gp/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ResultadoPage extends GetView<AxionController> {
  DateTime fecha = new DateTime.now();
  double h = Get.height;
  double w = Get.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: h * 0.03,
            ),
            Container(
                height: h * 0.2,
                width: w - 20,
                child: Image.asset("marca.png")),
            SizedBox(
              height: h * 0.05,
            ),
            Container(
                height: h * 0.15,
                width: w,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: w * 0.04,
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
                        Text(
                          controller.combustibles.value?.midio,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * 0.05,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: w * 0.04,
                        ),
                        Text(
                          "FECHA: ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Container(
                          width: w * 0.02,
                        ),
                        Text(
                          _fecha(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                )),
            SizedBox(
              height: h * 0.05,
            ),
            Container(height: h * 0.5, width: w, child: LDataTable()),
            Container(
              height: h * 0.10,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.pink,
        child: Icon(CupertinoIcons.back),
        onPressed: () {
          controller.cmCalculo("", "", "", "", "AVILA");
          Get.toNamed(AppRoutes.HOME);
        },
      ),
    );
  }
}

String _fecha() {
  var dbTimekey = DateTime.now();
  var formatDate = DateFormat.yMEd().add_jms().format(DateTime.now());

  String date = formatDate;
  return date;
}
