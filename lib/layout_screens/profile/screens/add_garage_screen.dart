import 'package:flutter/material.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/cubit.dart';
import '../../../bloc/states.dart';
import '../../../constants/colors.dart';
import '../../../constants/components.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class AddGarageScreen extends StatelessWidget {
  final lat;
  final long;
  const AddGarageScreen({super.key, this.lat, this.long});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GradCubit, GradStates>(
      listener: (context, state) {
        if (state is CreateParkingSuccessState) {
          MotionToast.success(
            description: const Text(
              'your parking have been added successfully',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15),
            ),
            animationType: AnimationType.fromLeft,
            //layoutOrientation: ORIENTATION.rtl,
            position: MotionToastPosition.bottom,
            width: 300,
            height: 100,
          ).show(context);
        } if (state is CreateParkingErrorState)  {
          MotionToast.error(
            description: const Text(
              'Please check your inputs and try again',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15),
            ),
            animationType: AnimationType.fromLeft,
            //layoutOrientation: ORIENTATION.rtl,
            position: MotionToastPosition.bottom,
            width: 300,
            height: 100,
          ).show(context);
        }
      },
      builder: (context, state) {
        var cubit = GradCubit.get(context);
        final nameController = TextEditingController();
        final gateController = TextEditingController();
        final distanceController = TextEditingController();
        final discController = TextEditingController();
        final capacityController = TextEditingController();
        final floorController = TextEditingController();
        final nearestController = TextEditingController();
        var dKey = GlobalKey<FormState>();
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: dKey,
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Add the garage data',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(
                        height: 8,
                      ),
                      TFF(
                        controller: nameController,
                        type: TextInputType.name,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter the name';
                          } else {
                            return null;
                          }
                        },
                        label: 'Name',
                        prefix: Icons.drive_file_rename_outline,
                        action: TextInputAction.next,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            flex: 10,
                            child: TFF(
                              controller: gateController,
                              type: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'enter the number of the main gate';
                                } else {
                                  return null;
                                }
                              },
                              label: 'Main gate',
                              hint: 'enter the number of the main gate',
                              prefix: Icons.numbers,
                              action: TextInputAction.next,
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: (){
                                  MotionToast.info(

                                    toastDuration: const Duration(
                                      seconds: 5,
                                    ),
                                    description: const Text(
                                      'in your parking u must have a main gate, so enter the number of this gate',
                                      maxLines: 6,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    animationType: AnimationType.fromLeft,
                                    //layoutOrientation: ORIENTATION.rtl,
                                    position: MotionToastPosition.bottom,
                                    width: 300,
                                    height: 100,
                                  ).show(context);
                                },
                                child: Icon(Icons.question_mark_outlined,color: defaultColor,),
                              )),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            flex: 10,
                            child: TFF(
                              controller: distanceController,
                              type: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'enter the distance from the main gate to the center';
                                } else {
                                  return null;
                                }
                              },
                              label: 'Distance',
                              hint: 'distance from the main gate to the center',
                              prefix: Icons.social_distance_outlined,
                              action: TextInputAction.next,
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: (){
                                  MotionToast.info(

                                    toastDuration: const Duration(
                                      seconds: 5,
                                    ),
                                    description: const Text(
                                      'the distance from the main gate to the center of your parking',
                                      maxLines: 6,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    animationType: AnimationType.fromLeft,
                                    //layoutOrientation: ORIENTATION.rtl,
                                    position: MotionToastPosition.bottom,
                                    width: 300,
                                    height: 100,
                                  ).show(context);
                                },
                                child: Icon(Icons.question_mark_outlined,color: defaultColor,),
                              )),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TFF(
                        controller: capacityController,
                        type: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter the full capacity';
                          } else {
                            return null;
                          }
                        },
                        label: 'Full capacity',
                        hint: 'enter the full capacity of your parking',
                        prefix: Icons.fullscreen,
                        action: TextInputAction.next,
                      ),
                      const SizedBox(height: 20),
                      TFF(
                        controller: floorController,
                        type: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter the floor capacity';
                          } else {
                            return null;
                          }
                        },
                        label: 'Floor capacity',
                        hint: 'enter the Floor capacity of your parking',
                        prefix: Icons.reduce_capacity,
                        action: TextInputAction.next,
                      ),
                      const SizedBox(height: 20),
                      TFF(
                        controller: discController,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'describe your parking';
                          } else {
                            return null;
                          }
                        },
                        label: 'description',
                        hint: 'describe your parking',
                        prefix: Icons.description_outlined,
                        action: TextInputAction.next,
                      ),
                      const SizedBox(height: 20),
                      TFF(
                        controller: nearestController,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'add the nearest places to your parking';
                          } else {
                            return null;
                          }
                        },
                        label: 'Nearest places',
                        hint: 'the nearest places to your parking',
                        prefix: Icons.map,
                        action: TextInputAction.done,
                      ),
                      const SizedBox(height: 20),
                      BuildCondition(
                        condition: state is! CreateParkingLoadingState,
                        builder: (context) => ElevatedButton(
                          onPressed: () {
                            // cubit.createParking(
                            //     "64039f2d75b91484204b4d69",
                            //     "parking_one",
                            //     "hello its parking",
                            //     100,
                            //     25,
                            //     ["hospital","bank"],
                            //     100,
                            //     1,
                            //     -8.4556973,
                            //     114.5110151
                            // );
                            if (dKey.currentState!.validate()) {
                              // print(nameController.text);
                              // print(discController.text);
                              // print(capacityController.text);
                              // print(floorController.text);
                              // print(distanceController.text);
                              // print(gateController.text);
                              cubit.createParking(
                                cubit.userModel!.id!,
                                nameController.text,
                                discController.text,
                                int.parse(capacityController.text),
                                int.parse(floorController.text),
                                [nearestController.text],
                                int.parse(distanceController.text),
                                int.parse(gateController.text),
                                lat,
                                long,
                                // context,
                              );
                              FocusScope.of(context).unfocus();
                            } else {
                              FocusScope.of(context).unfocus();
                            }
                          },
                          style: ButtonStyle(
                            //backgroundColor: MaterialStateProperty.all(co2),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 10),
                            child: Text(
                              'Add',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
