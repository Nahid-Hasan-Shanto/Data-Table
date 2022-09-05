import 'package:abcd/app/modules/categorys/controllers/customers_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../data/models/customer_model.dart';

class CustomerView extends StatefulWidget {
  const CustomerView({Key? key}) : super(key: key);

  @override
  State<CustomerView> createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  final controller = Get.put(CustomerssController());
  List<Customerss> customerss = <Customerss>[];
  late CustomerssDataSource customerssDataSource;
  @override
  void initState() {
    super.initState();
    customerssDataSource = CustomerssDataSource(customerssData: customerss);
    controller.getCustomers().then((value) {
      customerss.addAll(value as List<Customerss>);
      print(customerss.length);
      customerssDataSource = CustomerssDataSource(customerssData: customerss);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter DataGrid'),
      ),
      body: SfDataGrid(
        source: customerssDataSource,
        columnWidthMode: ColumnWidthMode.fill,
        columns: <GridColumn>[
          GridColumn(
              columnName: 'customerID',
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text(
                    'CustomerID',
                  ))),
          GridColumn(
              columnName: 'customerCode',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('CustomerCode'))),
          GridColumn(
              columnName: 'name',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text(
                    'name',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'address',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('address'))),
          GridColumn(
              columnName: 'mobile',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('mobile'))),
          GridColumn(
              columnName: 'type',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('type'))),
          GridColumn(
              columnName: 'createdBy',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('createdBy'))),
          GridColumn(
              columnName: 'createdDate',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('createdDate'))),
          GridColumn(
              columnName: 'modifyBy',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('modifyBy'))),
          GridColumn(
              columnName: 'modifyDate',
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('modifyDate'))),
        ],
      ),
    );
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class CustomerssDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  CustomerssDataSource({required List<Customerss?> customerssData}) {
    _customerssData = customerssData
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<int>(columnName: 'customerID', value: e!.customerID),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(columnName: 'mobile', value: e.mobile),
              DataGridCell<int>(columnName: 'type', value: e.type),
              DataGridCell<int>(columnName: 'createdBy', value: e.createdBy),
              DataGridCell<String>(
                  columnName: 'createdDate', value: e.createdDate),
              DataGridCell<String>(columnName: 'address', value: e.address),
              DataGridCell<String>(
                  columnName: 'customerCode', value: e.customerCode),
              DataGridCell<int>(columnName: 'modifyBy', value: e.modifyBy),
              DataGridCell<String>(
                  columnName: 'modifyDate', value: e.modifyDate),
            ],
          ),
        )
        .toList();
  }

  List<DataGridRow> _customerssData = [];

  @override
  List<DataGridRow> get rows => _customerssData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
