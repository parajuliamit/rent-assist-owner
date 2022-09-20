import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:owner_app/app/modules/home/views/widgets/icon_container.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../../../../utils/constants.dart';

class ScanBattiContainer extends StatefulWidget {
  const ScanBattiContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<ScanBattiContainer> createState() => _ScanBattiContainerState();
}

class _ScanBattiContainerState extends State<ScanBattiContainer> {
  File? _image;
  final imageCropper = ImageCropper();

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

      setState(() {
        _image = imagePermanent;
      });
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ScanMeterContainer(
                title: const Text(
                  'Tap to Scan Meter',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                subtitle: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(color: kWhiteColor, boxShadow: [
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
                onPress: () async {
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
                                      await getImage(ImageSource.camera);
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
                                      await getImage(ImageSource.gallery);
                                      Navigator.pop(context);
                                    }),
                              ),
                            ],
                          ),
                        );
                      });
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'The scanned meter is:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _image != null
              ? Image.file(
                  _image!,
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                )
              : Image.asset('assets/images/haribahadur.jpeg')
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
