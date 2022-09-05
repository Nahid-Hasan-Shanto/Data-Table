import 'package:abcd/app/data/models/customer_model.dart';
import 'package:abcd/app/data/providers/customer_provider.dart';
import 'package:get/get.dart';

class CustomerssController extends GetxController {
  //TODO: Implement CategorysController
  var provider = Get.put(CustomerssProvider());
  final customesrss_list = <Customerss>[].obs;

  void onInit() async {
    getCustomers();
    print('Hello nahid');

    super.onInit();
  }

  Future<List<Customerss>> getCustomers() async {
    var _list = await provider.getCustomerss();

    customesrss_list.value = _list;
    return _list;
  }
}
