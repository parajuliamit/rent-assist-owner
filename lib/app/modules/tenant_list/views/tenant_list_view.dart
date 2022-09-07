import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../home/views/widgets/hompage_button.dart';
import '../controllers/tenant_list_controller.dart';

class TenantListView extends GetView<TenantListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TenantList'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add_outlined,
              color: kPrimaryColor,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: Container(
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
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: kGreyColor,
                        radius: 25,
                        child: Icon(Icons.person),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Sunil Thapa',
                            style: TextStyle(
                                // color: kWhiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Leknath, Pokhara',
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: HomePageButton(
                            text: 'Call',
                            textColor: kWhiteColor,
                            fillColor: kPrimaryColor,
                            onpress: () {}),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: HomePageButton(
                            text: 'Message',
                            textColor: kWhiteColor,
                            fillColor: kPrimaryColor,
                            onpress: () {}),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
