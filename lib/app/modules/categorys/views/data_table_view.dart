import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_data_table/web_data_table.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/categorys_controller.dart';

class DataTableView extends StatefulWidget {
  DataTableView({Key? key}) : super(key: key);

  @override
  State<DataTableView> createState() => _DataTableViewState();
}

class _DataTableViewState extends State<DataTableView> {
  late String _sortColumnName;
  final controller = Get.find<CategorysController>();
  late bool _sortAscending;

  List<String>? _filterTexts;

  bool _willSearch = true;

  Timer? _timer;

  int? _latestTick;

  List<String> _selectedRowKeys = [];

  int _rowsPerPage = 10;

  @override
  void initState() {
    super.initState();
    _sortColumnName = 'browser';
    _sortAscending = false;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!_willSearch) {
        if (_latestTick != null && timer.tick > _latestTick!) {
          _willSearch = true;
        }
      }
      if (_willSearch) {
        _willSearch = false;
        _latestTick = null;
        setState(() {
          if (_filterTexts != null && _filterTexts!.isNotEmpty) {
            _filterTexts = _filterTexts;
            print('filterTexts = $_filterTexts');
          }
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WebDataTable Sample'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: WebDataTable(
              header: Text('Sample Data'),
              actions: [
                if (_selectedRowKeys.isNotEmpty)
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: MaterialButton(
                      color: Colors.red,
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        print('Delete!');
                        setState(() {
                          _selectedRowKeys.clear();
                        });
                      },
                    ),
                  ),
                Container(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'increment search...',
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFCCCCCC),
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFCCCCCC),
                        ),
                      ),
                    ),
                    onChanged: (text) {
                      _filterTexts = text.trim().split(' ');
                      _willSearch = false;
                      _latestTick = _timer?.tick;
                    },
                  ),
                ),
              ],
              source: WebDataTableSource(
                sortColumnName: _sortColumnName,
                sortAscending: _sortAscending,
                filterTexts: _filterTexts,
                columns: [
                  WebDataColumn(
                    name: 'CategoryID',
                    label: const Text('ID'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'Category',
                    label: const Text('Category'),
                    dataCell: (value) => DataCell(Text('$value')),
                    filterText: (value) => value.toLowerCase(),
                  ),

                  WebDataColumn(
                    name: 'CreatedBy',
                    label: const Text('CreatedBy'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'CreatedDate',
                    label: const Text('Created Date'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'ModifyBy',
                    label: const Text('Modify By'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  // WebDataColumn(
                  //   name: 'cssGrade',
                  //   label: const Text('CSS grade'),
                  //   dataCell: (value) => DataCell(Text('$value')),
                  //   sortable: false,
                  // ),
                  WebDataColumn(
                    name: 'CreatedDate',
                    label: const Text('DateTime'),
                    dataCell: (dtvalue) {
                      if (dtvalue != null) {
                        print(dtvalue.runtimeType);
                        if (dtvalue.runtimeType == String) {
                          DateTime value = DateTime.parse(dtvalue!);
                          if (value is DateTime) {
                            final text =
                                '${value.year}/${value.month}/${value.day} ${value.hour}:${value.minute}:${value.second}';
                            return DataCell(Text(text));
                          }
                        }
                      }
                      return DataCell(Text(dtvalue.toString()));
                    },
                    filterText: (value) {
                      if (value is DateTime) {
                        return '${value.year}/${value.month}/${value.day} ${value.hour}:${value.minute}:${value.second}';
                      }
                      return value.toString();
                    },
                  ),
                ],
                rows: controller.category_list
                    .map((element) => element!.toJson())
                    .toList(),

                selectedRowKeys: _selectedRowKeys,
                onTapRow: (rows, index) {
                  print('onTapRow(): index = $index, row = ${rows[index]}');
                },
                onSelectRows: (keys) {
                  print('onSelectRows(): count = ${keys.length} keys = $keys');
                  setState(() {
                    _selectedRowKeys = keys;
                  });
                },
                primaryKeyName: 'id',
                //rows: [],
              ),
              horizontalMargin: 150,
              onPageChanged: (offset) {
                print('onPageChanged(): offset = $offset');
              },
              onSort: (columnName, ascending) {
                print(
                    'onSort(): columnName = $columnName, ascending = $ascending');
                setState(() {
                  _sortColumnName = columnName;
                  _sortAscending = ascending;
                });
              },
              onRowsPerPageChanged: (rowsPerPage) {
                print('onRowsPerPageChanged(): rowsPerPage = $rowsPerPage');
                setState(() {
                  if (rowsPerPage != null) {
                    _rowsPerPage = rowsPerPage;
                  }
                });
              },
              rowsPerPage: _rowsPerPage,
            ),
          ),
        ),
      ),
    );
  }
}
