import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owner_app/app/routes/app_pages.dart';

import '../../../../utils/constants.dart';

class ComplaintContainer extends StatelessWidget {
  const ComplaintContainer(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.onTap})
      : super(key: key);

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 90,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: kPrimaryColor),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
