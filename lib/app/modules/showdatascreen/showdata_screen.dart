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
        body:   Obx(()=>!controller.isLoading.value ? const Center(child: CircularProgressIndicator()) :
          SingleChildScrollView(
            child: Column(
              children: [
                const Text("Api Calling Screen"),
     ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.res1.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: 2)
              ),
              child: Column(
                children: [
                  Text("${controller.res1[index].userId}"),
                  Text("${controller.res1[index].id}"),
                  Text(controller.res1[index].title,style: const TextStyle(overflow: TextOverflow.ellipsis)),
                ],
              ),
            ),
          );
      },)
              ]
            ),
          ),
        ),
      ),
    );
  }
}