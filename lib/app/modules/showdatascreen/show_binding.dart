import 'package:get/get.dart';
import 'package:getx/app/modules/showdatascreen/show_controller.dart';

class ShowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShowController());
  }
}