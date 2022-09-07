import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/complaint_controller.dart';

class ComplaintView extends GetView<ComplaintController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ComplaintView'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return const Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.report_problem_outlined),
              title: Text('Problem of water drainage'),
              trailing: Icon(Icons.chevron_right),
              subtitle: Text('2 days ago'),
            ),
          );
        },
      ),
    );
  }
}
