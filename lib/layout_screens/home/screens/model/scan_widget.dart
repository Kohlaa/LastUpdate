import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import '../../../../bloc/cubit.dart';
import '../../../../bloc/states.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/transitions.dart';
import '../../../../modules/qr_scanner/Scan_screen.dart';

class ScanWidget extends StatelessWidget {
  const ScanWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocConsumer<GradCubit, GradStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            color: Colors.white,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * .3,
                    child: Lottie.asset('assets/lotties/scan.json'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      'Scan QR-Code',
                      style: TextStyle(
                          letterSpacing: 5,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: defaultColor,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      EasyRichText(
                        "Scan QR-Code to connect to",
                        defaultStyle: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                        patternList: [
                          EasyRichTextPattern(
                            targetString: 'QR-Code',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: defaultColor,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'this car',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * .05),
                  Material(
                    color: Colors.transparent,
                    shape: const StadiumBorder(),
                    elevation: 0,
                    child: Container(
                      width: 311,
                      height: 54,
                      decoration: const ShapeDecoration(
                        shape: StadiumBorder(),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            CustomPageRoute1(
                              child: const ScanScreen(),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(0, 118, 203, 1.0)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                        child: BuildCondition(
                          condition: state is! CreateChatLoadingState,
                          builder: (context) => Text(
                            'scan'.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          fallback: (context) => const Center(child: CircularProgressIndicator(color: Colors.white,),),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
