//import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/get_response.dart';

class ShowController extends GetxController {
  // ScrollController scrollController = ScrollController();
  final GetConnect connect = Get.find<GetConnect>();
  GetResponse? getResponse;
  List<GetResponse> res1 = <GetResponse>[].obs;
  var isLoading = false.obs; //use for
  RxInt page = 1.obs;
  var lastPage = false.obs;

  Future<void> getDataMethod() async {
    Response response =
    await connect.get('https://jsonplaceholder.typicode.com/albums?_page=${page
        .value}&_limit=10');
    //print("@@  ${response.body} ${page.value}");
    if (response.statusCode == 200) {
      var res = response.body as Iterable;
      List<GetResponse> ress = res.map((v) => GetResponse.fromJson(v)).toList();
      // print(ress);
      isLoading.value = true;
      if(ress.isEmpty){
        lastPage.value = true;
      }else {
        res1.addAll(ress);

        page.value++;
      }
    } else {
      return;
    }
  }
}
