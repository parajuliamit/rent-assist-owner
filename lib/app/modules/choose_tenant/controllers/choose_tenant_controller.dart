import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:owner_app/app/data/models/user/tenant.dart';
import 'package:owner_app/app/modules/tenant_list/controllers/tenant_list_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../../../utils/app_utils.dart';
import '../../../utils/constants.dart';
import '../../home/controllers/home_controller.dart';

class ChooseTenantController extends GetxController {
  List<Tenant> tenants = [];

  @override
  void onInit() {
    super.onInit();
    tenants = Get.find<TenantListController>().tenants;
  }

  final imageCropper = ImageCropper();
  String? _scanData;

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      var cropped = (await imageCropper.cropImage(
        sourcePath: image.path,
        cropStyle: CropStyle.rectangle,
        aspectRatioPresets: [
          CropAspectRatioPreset.ratio16x9,
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Crop Reading',
              toolbarColor: kPrimaryColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.ratio16x9,
              hideBottomControls: true,
              lockAspectRatio: true),
        ],
      ));

      final imagePermanent =
          await savefilePermamently(cropped?.path ?? image.path);

      overlayLoading(
        () async {
          _scanData = await Get.find<HomeController>().scanOcr(imagePermanent);
        },
      );
    } on PlatformException catch (e) {
      print('failed to pick image $e');
    }
  }

  Future<File> savefilePermamently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
