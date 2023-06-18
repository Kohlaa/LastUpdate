import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/cubit.dart';
import '../../../bloc/states.dart';
import '../../../constants/colors.dart';
import '../../../constants/components.dart';
import '../../../layout/parking_layout.dart';

class UpdateProfileDataScreen extends StatelessWidget {
  UpdateProfileDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GradCubit, GradStates>(
      listener: (context, state) {
        if (state is UpdateUserDataSuccessState) {
          GradCubit.get(context).getUserData();
          navigateTo(Layout(), context);
        }
        // if (state is CreateSellerLoadingState) {
        //   //buildSnackBar('please wait -_-', context, 5);
        //   buildSnackBar('استنا شويه -_-', context, 5);
        // }
        // if (state is CreateSellerSuccessState) {
        //   GradCubit.get(context).getSellers();
        //   Navigator.pop(context);
        //   buildSnackBar('"_- تم اضافة البائع بنجاح ^_^ عشان انت جامد', context, 3);
        // }
      },
      builder: (context, state) {
        var cubit = GradCubit.get(context);
        final namePController = TextEditingController();
        final emailPController = TextEditingController();
        namePController.text = cubit.userModel!.name!;
        emailPController.text = cubit.userModel!.email!;
        return Scaffold(
          body: BuildCondition(
            condition: state is! UserDataLoadingState,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: SafeArea(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_forward, size: 30,),
                      ),
                    ),
                    const Text(
                      'update the data u want',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TFF(
                      controller: namePController,
                      action: TextInputAction.next,
                      type: TextInputType.name,
                      label: 'Name',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter the name';
                        } else {
                          return null;
                        }
                      },
                      prefix: Icons.edit,
                    ),
                    const SizedBox(height: 20),
                    TFF(
                      controller: emailPController,
                      action: TextInputAction.done,
                      type: TextInputType.emailAddress,
                      label: 'Email',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'enter the email';
                        } else {
                          return null;
                        }
                      },
                      prefix: Icons.edit,
                    ),
                    const SizedBox(height: 20),
                    BuildCondition(
                      condition: state is! UpdateUserDataLoadingState,
                      builder: (context) => ElevatedButton(
                        onPressed: () {
                          cubit.updateUser(
                            name: namePController.text,
                            email: emailPController.text,
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(defaultColor),
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Text(
                            'update',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1
                            ),
                          ),
                        ),
                      ),
                      fallback: (context) => const Center(
                          child: CircularProgressIndicator()),
                    ),
                  ],
                ),
              ),
            ),
            fallback: (context) => const Center(
                child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
