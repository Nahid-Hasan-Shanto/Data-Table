import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/categorys_controller.dart';
import 'customer_view.dart';
import 'data_table_view.dart';
import 'list_item.dart';
import 'new_table_view.dart';

class CategorysView extends GetView<CategorysController> {
  CategorysView({Key? key}) : super(key: key);
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CategorysView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            child: Column(
              children: [
                // Row(
                //   children: [
                //     Container(
                //       // height: 80,
                //       // width: 500,
                //       // padding: EdgeInsets.only(top: 10),
                //       height: 50,
                //       width: 400,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           color: Colors.green),
                //       child: TextFormField(
                //         onChanged: (text) {
                //           print('First text field: $text');
                //         },
                //         controller: myController,
                //         decoration: InputDecoration(
                //           border: OutlineInputBorder(
                //             borderRadius: BorderRadius.all(
                //               Radius.circular(10),
                //             ),
                //           ),
                //           hintText: 'Enter a search term',
                //           focusColor: Colors.white,
                //
                //           //labelText: 'Text Something',
                //           suffixIcon: IconButton(
                //             onPressed: () {
                //               myController.clear();
                //             },
                //             icon: Icon(Icons.clear),
                //             color: Colors.white,
                //           ),
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 30,
                //     ),
                //     Container(
                //       padding: EdgeInsets.only(top: 10),
                //       height: 50,
                //       width: 400,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           color: Colors.red),
                //       child: Obx(
                //         () => Text(
                //           textAlign: TextAlign.center,
                //           'Categorys:    ' +
                //               controller.category.value.category.toString(),
                //           style: TextStyle(fontSize: 20, color: Colors.white),
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 30,
                //     ),
                //     Container(
                //       padding: EdgeInsets.only(top: 10),
                //       height: 50,
                //       width: 400,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           color: Colors.purple),
                //       child: Obx(
                //         () => Text(
                //           textAlign: TextAlign.center,
                //           'Categorys:    ' +
                //               controller.category.value.category.toString(),
                //           style: TextStyle(fontSize: 20, color: Colors.white),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    //Get.to(() => ListItem());

                    //loadItemController.loadData();
                    //controller.getCategory();
                    Get.to(() => ListItem());
                    //controller.getCategory();
                  },
                  child: const Text("Go to List"),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => DataTableView());
                  },
                  child: const Text("Go to Table"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => NewTableView());
                  },
                  child: const Text("New Data Table"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => CustomerView());
                  },
                  child: const Text("Customer Page"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
