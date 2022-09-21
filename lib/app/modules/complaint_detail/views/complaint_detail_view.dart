import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:owner_app/app/modules/complaint_detail/views/widgets/remarks_input.dart';
import 'package:owner_app/app/widgets/custom_buttom.dart';
import 'package:owner_app/app/widgets/input_field.dart';

import '../../../utils/constants.dart';
import '../controllers/complaint_detail_controller.dart';

class ComplaintDetailView extends GetView<ComplaintDetailController> {
  Color getColor(String urgencyLevel) {
    if (urgencyLevel == "H") return Colors.red;
    if (urgencyLevel == "I") return Colors.deepOrange;
    if (urgencyLevel == "L") return Colors.deepPurple;
    return Colors.blueGrey;
  }

  String getText(String urgencyLevel) {
    if (urgencyLevel == "H") return 'High';
    if (urgencyLevel == "I") return 'Intermediate';
    if (urgencyLevel == "L") return 'Low';
    return urgencyLevel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Complaint Detail"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Status:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      'Pending',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Urgency Level:',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      getText(
                          controller.complaint?.urgencyLevel ?? ''.toString()),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: getColor(controller.complaint?.urgencyLevel ??
                            ''.toString()),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kGreyColor.withOpacity(0.3),
                      border: Border.all(color: kGreyColor)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.complaint?.title ?? '',
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        controller.complaint?.description ?? '',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Image.network(
                    baseUrl + (controller.complaint?.image ?? ''),
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        'Add Remarks',
                        () async {
                          await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Write your remarks'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      RemarksInput(
                                        'Remarks',
                                        maxlines: 4,
                                        textInputAction: TextInputAction.done,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Send',
                                              style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                  color: kPrimaryColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: CustomButton(
                      'Mark as solved',
                      () async {
                        await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Write your remarks'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    RemarksInput(
                                      'Remarks',
                                      maxlines: 4,
                                      textInputAction: TextInputAction.done,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Send',
                                            style: TextStyle(
                                                color: kPrimaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Cancel',
                                            style: TextStyle(
                                                color: kPrimaryColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                    ))
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kGreyColor.withOpacity(0.3),
                      border: Border.all(color: kGreyColor)),
                  child: Text(
                    'Remarks: ',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
