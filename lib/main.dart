import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'global_widgets/axion_bindings.dart';
import 'pages/home_page.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppRoutes.INITIAL, //homepage
    defaultTransition: Transition.fadeIn,
    getPages: AppPages.pages, //rutas declaradas
    home: Home(),
    initialBinding: AxionBinding(),
  ));
}
