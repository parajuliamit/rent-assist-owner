import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owner_app/app/routes/app_pages.dart';

import '../../../../utils/constants.dart';

class ScanMeterContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.CHOOSE_TENANT);
      },
      child: Container(
        height: 75,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 20),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Tap to Scan Meter',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(color: kWhiteColor, boxShadow: [
                BoxShadow(
                    color: kPrimaryColor.withOpacity(0.4),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(1, 2))
              ]),
              child: const Icon(
                Icons.document_scanner_outlined,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
