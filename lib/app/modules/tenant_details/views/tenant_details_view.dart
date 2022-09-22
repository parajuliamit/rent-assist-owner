import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:owner_app/app/utils/constants.dart';

import '../controllers/tenant_details_controller.dart';

class TenantDetailsView extends GetView<TenantDetailsController> {
  Widget getRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              flex: 6,
              child: Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              )),
          Expanded(
              flex: 2,
              child: Text(
                'Rs ${value}',
                style: const TextStyle(fontSize: 16),
              )),
        ],
      ),
    );
  }

  Widget infoRow(String title, String data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              data,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(controller.name),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: [
                  const Text("Basic Info",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: kPrimaryColor)),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kPrimaryColor)),
                    child: Column(
                      children: [
                        infoRow('Name :', 'Rabin KC'),
                        infoRow('Email :', 'rabin@gmail.com'),
                        infoRow('Phone :', '98738383838'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Agreement Details",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: kPrimaryColor)),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.1),
                        border: Border.all(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        getRow("Monthly Rent :", "1000"),
                        getRow("Electricy Charges (per unit) :", "78"),
                        getRow("Water Charge (per month) :", "600"),
                        getRow("Internet Charge :", "500"),
                        getRow("Others(eg. Waste) :", "0"),
                      ],
                    ),
                  ),
                ]))));
  }
}
