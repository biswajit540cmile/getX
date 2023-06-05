import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
        body:   Obx(()=> controller.isFirstLoadRunning.value ? const Center(child: CircularProgressIndicator()) :
          SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              children: [
                const Text("Api Calling Screen"),
     ListView.builder(
         // controller: scrollController,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.res1.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 55,
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
      },),
                // when the _loadMore function is running
                if (controller.isLoadMoreRunning.value == true)
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 40),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),

                // When nothing else to load
                if (controller.hasNextPage.value == false)
                  Container(
                    padding: const EdgeInsets.only(top: 30, bottom: 40),
                    color: Colors.amber,
                    child: const Center(
                      child: Text('You have fetched all of the content'),
                    ),
                  ),

              ]
            ),
          ),
        ),
      ),
    );
  }
}