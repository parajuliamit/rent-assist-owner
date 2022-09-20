import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/account_controller.dart';
import '../widgets/item_tile.dart';
import '../widgets/logout_button.dart';

class AccountView extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
            child: Column(
          children: [
            ItemTile(
              icon: Icons.edit,
              label: 'Edit Profile',
              onPress: () {
                Get.toNamed(Routes.EDIT_PROFILE);
              },
            ),
            ItemTile(
              icon: Icons.change_circle_outlined,
              label: 'Change Password',
              onPress: () {
                Get.toNamed(Routes.CHANGE_PASSWORD);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            LogoutButton(),
          ],
        )),
      ),
    );
  }
}
