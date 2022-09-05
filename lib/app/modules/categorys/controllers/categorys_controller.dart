import 'package:abcd/app/data/models/categorys_model.dart';
import 'package:abcd/app/data/providers/categorys_provider.dart';
import 'package:get/get.dart';

class CategorysController extends GetxController {
  //TODO: Implement CategorysController
  var provider = Get.find<CategorysProvider>();
  final category = Categorys().obs;
  final category_list = <Categorys?>[].obs;
  final count = 0.obs;

  @override
  void onInit() async {
    getCategory();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getCategory() async {
    var _list = await provider.getCategorys();
    category_list.value = _list;
  }

  void increment() => count.value++;
}
