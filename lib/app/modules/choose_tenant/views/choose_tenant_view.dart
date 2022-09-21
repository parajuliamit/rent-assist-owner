import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/constants.dart';
import '../../home/views/widgets/icon_container.dart';
import '../controllers/choose_tenant_controller.dart';

class ChooseTenantView extends GetView<ChooseTenantController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a tenant'),
      ),
      body: controller.tenants.isEmpty
          ? const Center(
              child: Text('You have no tenants.'),
            )
          : ListView.builder(
              itemCount: controller.tenants.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    await showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Select Image Source'),
                            content: Row(
                              children: [
                                Expanded(
                                  child: IconContainer(
                                      icon: Icons.camera_alt_outlined,
                                      title: 'Camera',
                                      onTap: () async {
                                        await controller
                                            .getImage(ImageSource.camera);
                                        Navigator.pop(context);
                                      }),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: IconContainer(
                                      icon: Icons.image_outlined,
                                      title: 'Gallery',
                                      onTap: () async {
                                        await controller
                                            .getImage(ImageSource.gallery);
                                        Navigator.pop(context);
                                      }),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(20),
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
                      children: [
                        Expanded(
                          child: Text(
                              "${controller.tenants[index].firstName} ${controller.tenants[index].lastName}",
                              maxLines: 1,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              )),
                        ),
                        const Icon(Icons.chevron_right)
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
