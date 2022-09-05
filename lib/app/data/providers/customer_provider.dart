import 'package:get/get_connect/connect.dart';

import '../models/customer_model.dart';

class CustomerssProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = "http://ssumon-001-site14.itempurl.com/api/";
  }

  Future<List<Customerss>> getCustomerss() async {
    final response = await get('Customers');
    //print(response.bodyString.toString());

    return (response.body['Customerss'] as List)
        .map((item) => Customerss.fromJson(item))
        .toList();
  }
}
