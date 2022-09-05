import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTableView extends StatelessWidget {
  const NewTableView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Table View'),
      ),
      body: Row(
        children: [
          SizedBox(
            width: 200,
          ),
          Container(
            child: DataTable(
              dataTextStyle: TextStyle(color: Colors.redAccent),

              // headingRowColor: MaterialStateProperty,
              columns: [
                DataColumn(label: Text("Market Type")),
                DataColumn(label: Text("Index Value")),
                DataColumn(label: Text("Change")),
                DataColumn(label: Text("% Change"))
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(Text('DSEX')),
                    DataCell(Text('6544')),
                    DataCell(Text('51')),
                    DataCell(Text('.70')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('DSEX')),
                    DataCell(Text('4557')),
                    DataCell(Text('40')),
                    DataCell(Text('.60')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('DSEX')),
                    DataCell(Text('4557')),
                    DataCell(Text('40')),
                    DataCell(Text('.60')),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(Text('DSEX')),
                    DataCell(Text('4557')),
                    DataCell(Text('40')),
                    DataCell(Text('.60')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
