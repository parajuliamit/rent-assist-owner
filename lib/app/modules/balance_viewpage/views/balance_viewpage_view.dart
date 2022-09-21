import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/balance_viewpage_controller.dart';

class BalanceViewpageView extends GetView<BalanceViewpageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Rent Collected Monthly',
            style: TextStyle(
                // color: kWhiteColor,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          DataTable(
            columns: const [
              DataColumn(
                label: Text(
                  'S.n.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Month',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Rent Collected',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
            rows: const [
              DataRow(
                cells: [
                  DataCell(
                    Text('1'),
                  ),
                  DataCell(
                    Text('Jan 2022'),
                  ),
                  DataCell(
                    Text('60000'),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text('2'),
                  ),
                  DataCell(
                    Text('Feb 2022'),
                  ),
                  DataCell(
                    Text('50000'),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text('3'),
                  ),
                  DataCell(
                    Text('March 2022'),
                  ),
                  DataCell(
                    Text('50000'),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text('3'),
                  ),
                  DataCell(
                    Text('Apr 2022'),
                  ),
                  DataCell(
                    Text('40000'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
