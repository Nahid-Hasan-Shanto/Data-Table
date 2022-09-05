import 'package:abcd/app/modules/categorys/bindings/customers_binding.dart';
import 'package:abcd/app/modules/categorys/views/data_table_view.dart';
import 'package:abcd/app/modules/categorys/views/list_item.dart';
import 'package:get/get.dart';

import '../modules/categorys/bindings/categorys_binding.dart';
import '../modules/categorys/views/categorys_view.dart';
import '../modules/categorys/views/customer_view.dart';
import '../modules/categorys/views/customer_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CATEGORYS;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORYS,
      page: () => CategorysView(),
      binding: CategorysBinding(),
    ),
    GetPage(
      name: _Paths.ListItem,
      page: () => ListItem(),
      binding: CategorysBinding(),
    ),
    GetPage(
      name: _Paths.DataTableView,
      page: () => DataTableView(),
      binding: CategorysBinding(),
    ),
    GetPage(
      name: _Paths.CustomerView,
      page: () => CustomerView(),
      binding: CustomerssBinding(),
    ),
  ];
}
