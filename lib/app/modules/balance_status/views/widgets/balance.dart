import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owner_app/app/modules/balance_status/controllers/balance_status_controller.dart';
import 'package:owner_app/app/routes/app_pages.dart';
import 'package:owner_app/app/utils/app_utils.dart';

import '../../../../utils/constants.dart';
import 'balancepage_button.dart';

class BalanceContainer extends StatelessWidget {
  const BalanceContainer({
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
            'Balance',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
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
                      Get.find<BalanceStatusController>().balance.toString(),
                      style: const TextStyle(
                          // color: kWhiteColor,
                          fontSize: 26,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                if (Get.find<BalanceStatusController>().balance > 0)
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      BalancePageButton(
                          text: 'Withdraw',
                          textColor: kWhiteColor,
                          fillColor: kPrimaryColor,
                          onpress: () {
                            overlayLoading(
                                Get.find<BalanceStatusController>().withdraw);
                          }),
                      const SizedBox(
                        height: 10,
                      ),
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
