import 'package:axion_gp/global_widgets/combutibles.dart';
import 'package:axion_gp/global_widgets/descarga.dart';

import 'package:get/get.dart';

class AxionController extends GetxController {
  Rx<Combustibles> combustibles;
  Rx<Descarga> descarga;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    combustibles = Combustibles(
            super_cm: "",
            premium_cm: "",
            diesel_cm: "",
            euro_cm: "",
            midio: "AVILA")
        .obs;

    descarga = Descarga(
            sI: "0",
            pI: "0",
            dI: "0",
            eI: "0",
            sF: "0",
            pF: "0",
            dF: "0",
            eF: "0",
            sD: "0",
            pD: "0",
            dD: "0",
            eD: "0")
        .obs;
  }

  void cmCalculo(String _super, String _premium, String _diesel, String _euro,
      String _midio) {
    combustibles.value = Combustibles(
        super_cm: _super,
        premium_cm: _premium,
        diesel_cm: _diesel,
        euro_cm: _euro,
        midio: _midio);
  }

  void medido(String _medido) {
    combustibles.value = Combustibles(midio: _medido);
  }

  void cmDescarga(
      String si,
      String pi,
      String di,
      String ei,
      String sf,
      String pf,
      String df,
      String ef,
      String sd,
      String pd,
      String dd,
      String ed) {
    descarga.value = Descarga(
      sI: si,
      pI: pi,
      dI: di,
      eI: ei,
      sF: sf,
      pF: pf,
      dF: df,
      eF: ef,
      sD: sd,
      pD: pd,
      dD: dd,
      eD: ed,
    );
  }
}
