import 'package:get/get.dart';

import '../models/categorys_model.dart';

class CategorysProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://ssumon-001-site14.itempurl.com/api/';
  }

  Future<List<Categorys>> getCategorys() async {
    final response = await get('categorys');
    //print(response.bodyString.toString());
    return (response.body['Categoryss'] as List)
        .map((item) => Categorys.fromJson(item))
        .toList();
  }

  Future<Response<Categorys>> postCategorys(Categorys categorys) async =>
      await post('categorys', categorys);
  Future<Response> deleteCategorys(int id) async =>
      await delete('categorys/$id');
}
