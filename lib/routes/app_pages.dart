import 'package:axion_gp/global_widgets/axion_bindings.dart';
import 'package:axion_gp/pages/descarga_page.dart';
import 'package:axion_gp/pages/home_page.dart';
import 'package:axion_gp/pages/resultado_page.dart';
import 'package:axion_gp/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => Home(),
      binding: AxionBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => Home(),
      binding: AxionBinding(),
    ),
    GetPage(
      name: AppRoutes.RESULTADO,
      page: () => ResultadoPage(),
      binding: AxionBinding(),
    ),
    GetPage(
      name: AppRoutes.DESCARGA,
      page: () => DescargaPage(),
      binding: AxionBinding(),
    ),
  ];
}
