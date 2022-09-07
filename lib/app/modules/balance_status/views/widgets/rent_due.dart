import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:owner_app/app/modules/balance_status/views/widgets/pie_chart.dart';
import 'package:owner_app/app/routes/app_pages.dart';

import '../../../../utils/constants.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Rent Due',
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
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                PieChartView(),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Rs',
                      style: TextStyle(
                          // color: kWhiteColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '50000',
                      style: TextStyle(
                          // color: kWhiteColor,
                          fontSize: 26,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                BalancePageButton(
                    text: 'View Rent',
                    textColor: kWhiteColor,
                    fillColor: kPrimaryColor,
                    onpress: () {
                      Get.toNamed(Routes.RENT_VIEWPAGE);
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
