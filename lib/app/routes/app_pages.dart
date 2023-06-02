import 'package:get/get.dart';
import 'package:getx/app/modules/showdatascreen/showdata_screen.dart';

import '../modules/homescreen/home_binding.dart';
import '../modules/homescreen/home_screen.dart';
import '../modules/showdatascreen/show_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.showData,
      page: () => ShowDataScreen(),
      binding: ShowBinding(),
    ),
  ];
}