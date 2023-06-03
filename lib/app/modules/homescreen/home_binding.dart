import 'package:get/get.dart';
import '../showdatascreen/show_controller.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ShowController());
  }
}