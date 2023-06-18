import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import '../../bloc/cubit.dart';
import '../../bloc/states.dart';
import '../../constants/colors.dart';
import '../../constants/components.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CreateQrCodeScreen extends StatefulWidget {
  const CreateQrCodeScreen({Key? key}) : super(key: key);

  @override
  State<CreateQrCodeScreen> createState() => _CreateQrCodeScreenState();
}

class _CreateQrCodeScreenState extends State<CreateQrCodeScreen> {
  Uint8List? bytes;

  void initState() {
    super.initState();
    loadImage();
  }

  @override
  Widget build(BuildContext context) {
    final qrController = TextEditingController();
    var cubit = GradCubit.get(context);
    return BlocConsumer<GradCubit, GradStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: BackButton(color: defaultColor),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //if (bytes != null) Image.memory(bytes!),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TFF(
                      controller: qrController,
                      action: TextInputAction.go,
                      type: TextInputType.emailAddress,
                      label: 'email',
                      hint: 'Please add your email',
                      suffix: Icons.email,
                      suffixPressed: () => cubit.setState(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Make sure that this email is open',
                      style: TextStyle(fontSize: 23, color: defaultColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'on ur device to receive notifications',
                      style: TextStyle(fontSize: 23, color: defaultColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: QrImageView(
                      data: qrController.text,
                      size: 200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: GestureDetector(
                      onTap: () {
                        cubit.setState();
                        debugPrint('ppppppppppppppppp: ${qrController.text}');
                      },
                      child: shadeMask(
                        'Create',
                        const TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                  qrController.text != ''
                      ? ElevatedButton(
                          onPressed: () async {
                            final controller = ScreenshotController();
                            final bytes = await controller.captureFromWidget(
                              Material(
                                child: buildQrImage(qrController, true),
                              ),
                            );
                            setState(() => this.bytes = bytes);
                            saveImage(bytes);
                            if (bytes.isEmpty) return;
                            await saveImageInGallery(bytes);
                          },
                          child: const Text(
                            'Save QR-Code',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        )
                      : const Text(''),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildQrImage(TextEditingController controller, bool save) {
    return Container(
      width: 500,
      height: 500,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: defaultColor,
            width: 10,
          )),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left:padding(context),bottom: padding(context)),
              child: Align(
                alignment: Alignment.topLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10000),
                  child: Image(
                    height: screenHeight(context, .1),
                    image: AssetImage('assets/images/app_icon.png'),
                  ),
                ),
              ),
            ),
            QrImageView(
              data: controller.text,
              size: 200,
            ),
            const SizedBox(height: 50),
            save
                ? shadeMask(
                    'Scan to reach me!',
                    const TextStyle(fontSize: 40),
                  )
                : const Text(''),
          ],
        ),
      ),
    );
  }

  Future loadImage() async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/image.png');
    if (file.existsSync()) {
      final bytes = await file.readAsBytes();
      setState(() => this.bytes = bytes);
    }
  }

  Future saveImage(Uint8List bytes) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/image.png');
    file.writeAsBytes(bytes);
    buildSnackBar('your qr saved successfully in your gallery', context, 3);
    debugPrint('savveeeesavveeeesavveeeesavveeee${appStorage.path}/image.png');
  }

  Future<String> saveImageInGallery(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'your QR-Code_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    return result['filePath'];
  }
}
