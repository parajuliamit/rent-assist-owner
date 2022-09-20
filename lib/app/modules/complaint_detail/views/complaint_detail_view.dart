import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/complaint_detail_controller.dart';

class ComplaintDetailView extends GetView<ComplaintDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ComplaintDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ComplaintDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
