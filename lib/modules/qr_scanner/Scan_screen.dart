import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garduation/constants/components.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../../bloc/cubit.dart';
import '../../bloc/states.dart';
import '../../constants/colors.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final qr = GlobalKey(debugLabel: 'QR');
  Barcode? barcode;
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  List<int> ans = [0, 1];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GradCubit, GradStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                buildQrView(context),
                Positioned(bottom: 10, child: buildResult()),
                Positioned(top: 10, child: buildControlButtons()),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildControlButtons() => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blueGrey.withOpacity(.5),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                await controller!.toggleFlash();
                setState(() {});
              },
              icon: FutureBuilder<bool?>(
                future: controller?.getFlashStatus(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return Icon(
                      snapshot.data! ? Icons.flash_off : Icons.flash_on,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            IconButton(
              onPressed: () async {
                await controller!.flipCamera();
                setState(() {});
              },
              icon: FutureBuilder(
                future: controller?.getCameraInfo(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return const Icon(Icons.switch_camera);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      );

  Widget buildResult() => Center(
        child: InkWell(
          onTap: () {
            barcode != null
                ? GradCubit.get(context).createChat(
                    '${barcode!.code}'.toString(),
                    'Your car is standing in front of mine',
                    context,
                  )
                : buildSnackBar('the qr-code don\'t hold any data', context, 2);
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            width: 400,
            decoration: BoxDecoration(
              color:
                  barcode != null ? defaultColor : Colors.grey.withOpacity(.6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                'send notification',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ),
      );

  Widget buildQrView(BuildContext context) => QRView(
        key: qr,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: defaultColor,
          borderRadius: 10,
          borderLength: 20,
          borderWidth: 10,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((barcode) {
      setState(() {
        this.barcode = barcode;
      });
    });
  }
}
