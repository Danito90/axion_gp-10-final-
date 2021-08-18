import 'package:axion_gp/global_widgets/controller.dart';
import 'package:get/get.dart';

class AxionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AxionController>(() => AxionController());
  }
}
