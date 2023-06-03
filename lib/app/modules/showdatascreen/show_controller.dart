import 'package:get/get.dart';
import '../../model/get_response.dart';

class ShowController extends GetxController {
  final GetConnect connect = Get.find<GetConnect>();
  GetResponse? getResponse;
  List<GetResponse> res1 = <GetResponse>[].obs;
  var isLoading = false.obs;//use for

  @override
  void onInit() {
    super.onInit();
    getDataMethod();
  }

  Future<void> getDataMethod() async {
    Response response =
        await connect.get('https://jsonplaceholder.typicode.com/albums');
    //print("@@  ${response.statusCode}");
    if (response.statusCode == 200) {
      var res = response.body as Iterable;
      res1 = res.map((v) => GetResponse.fromJson(v)).toList();
      isLoading.value = true;
    } else {
      return;
    }
  }
}
