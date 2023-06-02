import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/app/modules/showdatascreen/show_controller.dart';

class ShowDataScreen extends StatefulWidget {
   ShowDataScreen({super.key}) {
     // TODO: implement ShowDataScreen
     throw UnimplementedError();
   }

  @override
  State<ShowDataScreen> createState() => _ShowDataScreenState();
}

class _ShowDataScreenState extends State<ShowDataScreen> {
//ShowController controller1 = Get.find<ShowController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('GetX Data Screen'),
        ),
        body:   SingleChildScrollView(
          child: Column(
            children: [
              Text("Api Calling Screen"),
     ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: controller.response1?.data.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              border: Border.all(width: 2)
            ),
            child: Column(
              children: [
                Text("${controller.response1?.data[index].id}"),
                Text("${controller.response1?.data[index].employeeName}"),
                Text("${controller.response1?.data[index].employeeAge}"),
                Text("${controller.response1?.data[index].employeeSalary}"),
              ],
            ),
          ),
        );
      },)

            ]
          ),
        ),
      ),
    );
  }
}