import 'package:hi_get/hi_get.dart';
import 'star_controller.dart';

class StarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StarController>(() => StarController());
  }
}
