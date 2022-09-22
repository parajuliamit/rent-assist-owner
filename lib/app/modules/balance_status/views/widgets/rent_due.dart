import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:owner_app/app/modules/balance_status/views/widgets/pie_chart.dart';
import 'package:owner_app/app/routes/app_pages.dart';

import '../../../../utils/constants.dart';
import '../../controllers/balance_status_controller.dart';
import 'balancepage_button.dart';

class RentDueContainer extends StatelessWidget {
  const RentDueContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Due Rent',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: kPrimaryColor.withOpacity(0.25),
                      spreadRadius: 5,
                      offset: const Offset(0, 3),
                      blurRadius: 10)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Rs',
                  style: TextStyle(
                      // color: kWhiteColor,
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  Get.find<BalanceStatusController>().rent.toString(),
                  style: const TextStyle(
                      // color: kWhiteColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
