import 'package:get/get.dart';

class GetConnectInjection {
  static void init() async {
    Get.put<GetConnect>(GetConnect());
  }
}
