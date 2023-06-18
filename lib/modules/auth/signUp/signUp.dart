import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garduation/constants/components.dart';
import 'package:garduation/constants/transitions.dart';
import 'package:garduation/modules/auth/signUp/signUp_cubit/signUp_cubit.dart';
import 'package:garduation/modules/auth/signUp/signUp_cubit/signUp_states.dart';
import '../../../constants/colors.dart';
import '../../../constants/widgets.dart';
import '../login/login.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool value = false;

  @override
  Widget build(BuildContext context) {

    var formSignUpKey = GlobalKey<FormState>();
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => SignUpCubit(),
        child: BlocConsumer<SignUpCubit, SignUpStates>(
          listener: (context, state) {
            if (state is SignUpSuccessState) {
              if (state.loginModel.status == true) {
                navigateAndFinish(
                  const LoginScreen(),
                  context,
                );
              }
            } else if (state is SignUpErrorState) {
              MotionToast.error(
                description: const Text(
                  'Please check ur inputs',
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
            var cubit = SignUpCubit.get(context);
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SafeArea(
                child: Form(
                  key: formSignUpKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_outlined,
                              color: Color(0xFF242424),
                            ),
                          ),
                        ),
                        Center(
                          child: Image.asset(
                            'assets/images/signUp_image.png',
                            width: 193.0,
                          ),
                        ),
                        const Text(
                          "Create an account ",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Welcome to our community ☺ 🅿️",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        TFF(
                          controller: fullNameController,
                          type: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'enter your name';
                            } else {
                              return null;
                            }
                          },
                          label: 'Full name',
                          prefix: Icons.edit,
                          action: TextInputAction.next,
                        ),
                        const SizedBox(height: 20),
                        TFF(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'enter your email';
                            } else {
                              return null;
                            }
                          },
                          label: 'Email',
                          prefix: Icons.alternate_email,
                          action: TextInputAction.next,
                        ),
                        const SizedBox(height: 20),
                        TFF(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'enter your password';
                            } else {
                              return null;
                            }
                          },
                          label: 'Password',
                          prefix: Icons.password_outlined,
                          action: TextInputAction.next,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Checkbox(
                                checkColor: Colors.greenAccent,
                                activeColor: defaultColor,
                                value: value,
                                onChanged: (value) {
                                  setState(() {
                                    this.value = value!;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              flex: 10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('I agree to our ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF000000))),
                                  InkWell(
                                    onTap: () {},
                                    child: const Text(
                                      'Terms & Conditions ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF196FD5)),
                                    ),
                                  ),
                                  const Text('and ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF000000))),
                                  InkWell(
                                    onTap: () {},
                                    child: const Text(
                                      'Privacy',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF196FD5),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        BuildCondition(
                          condition: state is! SignUpLoadingState,
                          builder: (context) => defaultButton(
                            text: 'Create an account',
                            buttonWidth: 200.0,
                            onPressed: () {
                              if (value == false) {
                                MotionToast.warning(
                                  description: const Text(
                                    'please check the box',
                                    maxLines: 3,
                                    textDirection: TextDirection.rtl,
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
                              if (value == true) {
                                if (formSignUpKey.currentState!.validate()) {
                                  // Navigator.pushReplacement(
                                  //   context,
                                  //   CustomPageRoute1(child: const VerifyScreen()),);
                                  debugPrint(
                                      'ful : ${fullNameController.text}');
                                  debugPrint('email : ${emailController.text}');
                                  debugPrint(
                                      'pass : ${passwordController.text}');

                                  cubit.userSignUp(
                                    name: fullNameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                  FocusScope.of(context).unfocus();
                                } else {
                                  FocusScope.of(context).unfocus();
                                }
                              }
                            },
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Already have an account?',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF000000))),
                            const SizedBox(width: 3),
                            InkWell(
                              onTap: () => Navigator.push(
                                context,
                                CustomPageRoute1(child: const LoginScreen()),
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF196FD5)),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
