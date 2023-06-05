import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/sockets/src/socket_notifier.dart';
import '../../model/get_response.dart';

class ShowController extends GetxController {
  final GetConnect connect = Get.find<GetConnect>();
 //final ScrollController scrollController = ScrollController();
  GetResponse? getResponse;
  List<GetResponse> res1 = <GetResponse>[].obs;
  var isLoading = false.obs;//use for
  int page = 1;
  var hasNextPage = true.obs;
  var isFirstLoadRunning = false.obs;
  var isLoadMoreRunning = false.obs;

  Future<void> getDataF() async {

    isFirstLoadRunning.value = true;
    try{
      Response response =
      await connect.get('https://jsonplaceholder.typicode.com/albums?_page=$page&_limit=10');
      if (response.statusCode == 200) {
        var res = response.body as Iterable;
        res1 = res.map((v) => GetResponse.fromJson(v)).toList();
      //  isLoading.value = true;
       // page++;
      } else {
        print(response.statusCode);
      }
    }catch(e){
      print(e);
    } finally {
      isFirstLoadRunning.value = false;
    }

  }

  void loadMore() async {
    print("Extent ${scrollController.position.maxScrollExtent}");
    print("Pixels ${scrollController.position.pixels}");
    if (hasNextPage.value == true &&
        isFirstLoadRunning.value == false &&
        isLoadMoreRunning.value == false &&
        scrollController.position.maxScrollExtent <= 118)
    {
if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        isLoadMoreRunning.value = true; // Display a progress indicator at the bottom
        page += 1; // Increase _page by 1

        try{
          Response response =
          await connect.get('https://jsonplaceholder.typicode.com/albums?_page=$page&_limit=10');
          //?_page=$page
          //  print("@@  ${response.statusCode}");
          if (response.statusCode == 200) {
            var res = response.body as Iterable;

            if (res.isNotEmpty) {
              res1 = res.map((v) => GetResponse.fromJson(v)).toList();
              isLoading.value = true;
              page++;

            } else {
              // This means there is no more data
              // and therefore, we will not send another GET request
              hasNextPage.value = false;
            }
          } else {
            print(response.statusCode);
          }
        }catch(e){
          print(e);
        } finally {
          // isLoading.value = false;
        }
        isLoadMoreRunning.value = false;
    }

  }}
  late ScrollController scrollController;
  @override
  void onInit() {
    super.onInit();
    getDataF();
scrollController =  ScrollController()..addListener(loadMore);
  }

  @override
  void onClose() {
    scrollController.removeListener(loadMore);
    super.onClose();
  }


}
