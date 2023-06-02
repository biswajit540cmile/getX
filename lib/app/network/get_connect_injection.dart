import 'package:get/get.dart';
import 'package:getx/app/network/rest_api.dart';

class GetConnectInjection {
  static void init() async {
    Get.put<GetConnect>(GetConnect());
  }
}
