import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/add_tenant_controller.dart';

class AddTenantView extends GetView<AddTenantController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddTenantView'),
        centerTitle: true,
      ),
      body: Center(
          child: QrImage(
        data: 'qr',
        // embeddedImage: AssetImage('assets/images/haribahadur.jpeg'),
        // gapless: false,
      )),
    );
  }
}
