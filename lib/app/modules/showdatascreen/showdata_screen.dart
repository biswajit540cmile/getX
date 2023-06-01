import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/app/modules/showdatascreen/show_controller.dart';

class ShowDataScreen extends StatelessWidget {
  const ShowDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('GetX Data Screen'),
        ),
        body:  const Center(
          child:Text("Api Calling Screen"),
        ),
      ),
    );
  }
}