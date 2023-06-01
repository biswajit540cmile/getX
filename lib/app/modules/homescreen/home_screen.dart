import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('GetX Home Screen'),
        ),
        body:  Center(
          child: ElevatedButton(onPressed: () => Get.toNamed(AppRoutes.showData), child: const Text("Click Me")),
        ),
      ),
    );
  }
}