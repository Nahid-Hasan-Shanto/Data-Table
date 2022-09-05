import 'package:abcd/app/data/providers/categorys_provider.dart';
import 'package:get/get.dart';

import '../controllers/categorys_controller.dart';

class CategorysBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategorysProvider>(() => CategorysProvider());
    Get.lazyPut<CategorysController>(
      () => CategorysController(),
    );
  }
}
