import 'package:get/get.dart';

import '../../../data/providers/customer_provider.dart';
import '../controllers/customers_controller.dart';

class CustomerssBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerssProvider>(() => CustomerssProvider());
    Get.lazyPut<CustomerssController>(
      () => CustomerssController(),
    );
  }
}
