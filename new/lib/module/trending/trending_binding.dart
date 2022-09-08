import 'package:hi_get/hi_get.dart';
import 'trending_controller.dart';

class TrendingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrendingController>(() => TrendingController());
  }
}
