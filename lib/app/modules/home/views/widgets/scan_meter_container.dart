import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

class ScanBattiContainer extends StatelessWidget {
  const ScanBattiContainer({
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
            'Scan Meter',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ScanMeterContainer(
                title: const Text(
                  'Tap to Scan Meter',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                subtitle: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: kWhiteColor,
                      boxShadow: [
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
                onPress: () {
                  // Get.toNamed(Routes.TENANT_LIST);
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}

class ScanMeterContainer extends StatelessWidget {
  const ScanMeterContainer(
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
          height: 75,
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              title,
              const SizedBox(
                width: 5,
              ),
              subtitle
            ],
          ),
        ),
      ),
    );
  }
}
