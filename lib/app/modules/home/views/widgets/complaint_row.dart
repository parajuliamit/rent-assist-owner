import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owner_app/app/routes/app_pages.dart';

import '../../../../utils/constants.dart';

class ComplainRow extends StatelessWidget {
  const ComplainRow({
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
            'Complaint',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ComplaintContainer(
                title: const Text(
                  '4',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: kPrimaryColor),
                ),
                subtitle: const Text(
                  'Complaints',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                onPress: () {
                  Get.toNamed(Routes.COMPLAINT);
                },
              ),
              // const SizedBox(
              //   width: 20,
              // ),
              // ComplaintContainer(
              //   title: const Text(
              //     'View',
              //     style: TextStyle(
              //         fontWeight: FontWeight.bold, color: kPrimaryColor),
              //   ),
              //   subtitle: const Text(
              //     'All Complaints',
              //     style: TextStyle(
              //         fontWeight: FontWeight.bold, color: kPrimaryColor),
              //   ),
              //   onPress: () {
              //     Get.toNamed(Routes.COMPLAINT);
              //   },
              // ),
            ],
          )
        ],
      ),
    );
  }
}

class ComplaintContainer extends StatelessWidget {
  const ComplaintContainer(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.onPress})
      : super(key: key);

  final Widget title;
  final Widget subtitle;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          // height: 100,
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
              title,
              const SizedBox(
                height: 5,
              ),
              subtitle
            ],
          ),
        ),
      ),
    );
  }
}
