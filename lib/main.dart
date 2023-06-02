import 'package:flutter/material.dart';
//import 'package:flutter_getx/app/modules/home_binding.dart';
// import 'package:flutter_getx/app/modules/home_page.dart';
// import 'package:flutter_getx/app/routes/app_pages.dart';
import 'package:get/get.dart';

import 'app/modules/homescreen/home_binding.dart';
import 'app/modules/homescreen/home_screen.dart';
import 'app/network/get_connect_injection.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
  GetConnectInjection.init();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialBinding: HomeBinding(),
      home: const HomePage(),
      getPages: AppPages.pages,
    );
  }
}