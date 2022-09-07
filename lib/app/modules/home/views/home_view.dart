import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:owner_app/app/modules/home/views/widgets/scan_meter_container.dart';

import '../controllers/home_controller.dart';
import 'widgets/complaint_row.dart';
import 'widgets/user_info.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(
              height: 10,
            ),
            UserInfo(),
            SizedBox(
              height: 20,
            ),
            ComplainRow(),
            SizedBox(
              height: 10,
            ),
            ScanBattiContainer(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    ));
  }
}
