import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:owner_app/app/modules/add_tenant/controllers/add_tenant_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../../../../utils/constants.dart';
import '../../../home/views/widgets/icon_container.dart';

class InsertImageContainer extends StatefulWidget {
  const InsertImageContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<InsertImageContainer> createState() => _InsertImageContainerState();
}

class _InsertImageContainerState extends State<InsertImageContainer> {
  File? _image;

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      // final imageTemporary = File(image.path);
      final imagePermanent = await savefilePermamently(image.path);

      setState(() {
        this._image = imagePermanent;
      });
      // Get.find<AddTenantController>().image = imagePermanent;
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

  Future<void> selectImage(context) async {
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
  }

  @override
  Widget build(BuildContext context) {
    return _image == null
        ? GestureDetector(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kGreyColor.withOpacity(0.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.add,
                    size: 40,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Add Image',
                  )
                ],
              ),
            ),
            onTap: () async {
              await selectImage(context);
            },
          )
        : Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  _image!,
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.5,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  FloatingActionButton(
                    onPressed: () async {
                      await selectImage(context);
                    },
                    child: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _image = null;
                      });
                    },
                    child:
                        const Icon(Icons.delete_outline, color: Colors.white),
                  ),
                ],
              )
            ],
          );
  }
}
