import 'package:abcd/app/modules/categorys/controllers/categorys_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItem extends StatelessWidget {
  final controller = Get.find<CategorysController>();
  ListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //centerTitle: true,
        title: Text('List Item Page'),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          height: 800,
          width: 500,
          color: Colors.grey.shade300,
          child: Obx(() => ListView.builder(
                itemCount: controller.category_list.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 5, left: 5),
                    height: 130,
                    //color: Colors.red,
                    child: Card(
                      //color: Colors.green.shade200,
                      elevation: 5,
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.only(left: 20, top: 10, right: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${controller.category_list.value[index]!.categoryID.toString()}.",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                  Text(
                                    controller
                                        .category_list.value[index]!.category
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.amber),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller
                                        .category_list.value[index]!.createdBy
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    controller
                                        .category_list.value[index]!.createdDate
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller
                                        .category_list.value[index]!.modifyBy
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    controller
                                        .category_list.value[index]!.modifyDate
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.lightGreen),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )),
        ),
      ),
    );
  }
}
