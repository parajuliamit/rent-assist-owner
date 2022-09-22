import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:owner_app/app/app_repository.dart';
import 'package:owner_app/app/data/exception/server_exception.dart';
import 'package:owner_app/app/data/models/user/tenant.dart';
import 'package:owner_app/app/modules/tenant_list/controllers/tenant_list_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../../../data/models/ocr/set_reading_request.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/constants.dart';
import '../../home/controllers/home_controller.dart';

class ChooseTenantController extends GetxController {
  List<Tenant> tenants = [];
  bool isConfig = false;

  late final TextEditingController readingController;
  final ocrRepo = Get.find<AppRepository>().getOcrRepository();

  int selectedTenant = 0;

  @override
  void onInit() {
    super.onInit();
    tenants = Get.find<TenantListController>().tenants;
    isConfig = Get.parameters['config'] == 'true';
    readingController = TextEditingController();
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

      await overlayLoading(
        () async {
          _scanData = await Get.find<HomeController>().scanOcr(imagePermanent);
        },
      );

      if (_scanData == null) {
        showSnackbar('Error scanning reading', isError: true);
        // return;
      }
      readingController.text = _scanData ?? '';
      Get.dialog(
        AlertDialog(
          title: const Text('Reading'),
          content: TextField(
            controller: readingController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Enter reading',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Get.back();
                configMeter();
              },
              child: const Text('Confirm'),
            ),
          ],
        ),
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

  Future<void> configMeter() async {
    await overlayLoading(
      () async {
        try {
          await ocrRepo.configMeter(
            SetElectricityRequest(
              tenant: tenants[selectedTenant].tenant ?? 3,
              currentReading: double.tryParse(readingController.text) ?? 0,
            ),
          );
          showSnackbar('Meter configured successfully');
        } catch (e) {
          if (e is DioError) {
            showSnackbar(ServerError.withError(error: e).getErrorMessage(),
                isError: true);
          } else {
            showSnackbar(e.toString(), isError: true);
          }
        }
      },
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    readingController.dispose();
  }
}
