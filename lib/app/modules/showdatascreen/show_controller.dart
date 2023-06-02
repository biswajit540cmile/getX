import 'dart:convert';

import 'package:get/get.dart';

import '../../model/get_response.dart';
import '../../network/rest_api.dart';
class ShowController extends GetxController {
  final GetConnect connect = Get.find<GetConnect>();
 // Datum? obj;
var showList = <GetResponse>[].obs;
  // GetResponse? response1;
  GetResponse? response1;
 // var ok;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDataMethod();
    // restAPI.getDataMethod();

  }

Future<void> getDataMethod() async {
  Response response = await connect.get(
      'https://dummy.restapiexample.com/api/v1/employees');
  if (response.statusCode == 200) {

     response1 = GetResponse.fromJson(response.body);
    // showList.add(GetResponse(status: response1?.status, data: response1.data, message: response1.message));
    //showList.add(Datum(id: response1.id, employeeName: response1.employeeName, employeeSalary: response1.employeeSalary, employeeAge: response1.employeeAge, profileImage: response1.profileImage));
   // showList1.addAll(Datum(id: response1.data[0].id, employeeName:response1.data[0].employeeName , employeeSalary: response1.data[0].employeeSalary, employeeAge: response1.data[0].employeeAge, profileImage:response1.data[0].profileImage ) as Iterable<Datum>);
  // Datum obj = showList[0].data;
    print("@@@@  ${response1}");
  } else {
    return null;
  }
}



}