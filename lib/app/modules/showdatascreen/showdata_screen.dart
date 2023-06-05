import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/app/modules/showdatascreen/show_controller.dart';
class ShowDataScreen extends StatefulWidget {
   const ShowDataScreen({super.key});

  @override
  State<ShowDataScreen> createState() => _ShowDataScreenState();
}

class _ShowDataScreenState extends State<ShowDataScreen> {
  ScrollController scrollController = ScrollController();
  ShowController showController = Get.find<ShowController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showController.getDataMethod();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        showController.getDataMethod();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.removeListener((){});
    super.dispose();
  }

   @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('GetX Data Screen'),
        ),
         // controller.lastPage.value == true ? const SnackBar(content: Text("There is no data to fetch")) :
        body:   Obx(()=>
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                const Text("Api Calling Screen"),
     ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.res1.length + 1,
          itemBuilder: (BuildContext context, int index) {
     if (index < controller.res1.length) {
       return
         InkWell(
           onTap: ()=> print("${index}  ok  ${controller.res1.length}"),
           child: Padding(
             padding: const EdgeInsets.all(10.0),
             child: Container(
               decoration: BoxDecoration(
                   borderRadius: const BorderRadius.all(Radius.circular(10)),
                   border: Border.all(width: 2)
               ),
               child: Column(
                 children: [
                   Text("${controller.res1[index].userId}"),
                   Text("${controller.res1[index].id}"),
                   Text(controller.res1[index].title,
                       style: const TextStyle(overflow: TextOverflow.ellipsis)),
                 ],
               ),
             ),
           ),
         );
     }else if(controller.lastPage.value){
       return  InkWell(
         onTap: ()=> print("${index}${controller.res1.length}"),
         child: const GetSnackBar(
             title: "There is no data to fetch",
             message: "Now Happy!",
            backgroundColor: Colors.red,
             icon: Icon(Icons.notifications_none),
             duration: Duration(seconds: 6),
           ),
       );
     }else if(controller.isLoading.value){
      return const Center(child: CircularProgressIndicator());
     }
     return null;
          },)
              ]
            ),
          ),
        ),
      ),
    );
  }
}