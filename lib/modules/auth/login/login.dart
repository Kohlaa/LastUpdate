import 'package:flutter/material.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garduation/constants/transitions.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import '../../../bloc/cubit.dart';
import '../../../bloc/states.dart';
import '../../../constants/components.dart';
import '../../../layout/parking_layout.dart';
import '../../../network/local/cache_helper.dart';
import '../signup/signUp.dart';
import '../../forgetPassword/forget_password.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GradCubit, GradStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (state.loginModel.status == true) {
            CacheHelper.saveData(
              key: 'token',
              value: state.loginModel.token,
            ).then((value) {
              //GradCubit.get(context).getFavoritesData();
              token = state.loginModel.token;
              debugPrint('check : ${CacheHelper.getData(key: "token")}');
              navigateAndFinish(
                Layout(),
                context,
              );
              GradCubit.get(context).getUserData();
            }).catchError((error) {
              debugPrint(
                  'error from login screen cacheHelper${error.toString()}');
            });
            debugPrint('token from loginError : ${state.loginModel.token}');
            debugPrint(
                'token from login2Error : ${CacheHelper.getData(key: 'token')}');
          }
        } else if (state is LoginErrorState) {
          MotionToast.error(
            description: const Text(
              'please check your inputs',
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
        final emailController = TextEditingController();
        final passwordController = TextEditingController();
        var formLoginKey = GlobalKey<FormState>();
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formLoginKey,
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(18),
                        height: 160.0,
                        width: 190.0,
                        padding: const EdgeInsets.only(top: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                        ),
                        child:
                            Stack(alignment: Alignment.bottomCenter, children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Center(
                              child: Image.asset('assets/images/log_ic.png'),
                            ),
                          ),
                          const Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: Color(0xFF242424)),
                            textAlign: TextAlign.center,
                          ),
                        ]),
                      ),
                      const Text(
                        "Being ready to park 😀 ",
                        style: TextStyle(
                            color: Color(0xFF242424),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
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
                      const SizedBox(height: 10),
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
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InkWell(
                            child: const Text(
                              '?Forgot Password',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                //Poppins    //fontFamily: 'assets/googleFonts/Poppins-Bold.ttf',
                                color: Color(0xFFD73131),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgetPass(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      BuildCondition(
                        condition: state is! LoginLoadingState,
                        builder: (context) => ElevatedButton(
                          onPressed: () {
                            if (formLoginKey.currentState!.validate()) {
                              debugPrint('email : ${emailController.text}');
                              debugPrint('pass : ${passwordController.text}');

                              cubit.login(
                                email: emailController.text,
                                password: passwordController.text,
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
                              'Login',
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
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have account?',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF242424),
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.push(
                              context,
                              CustomPageRoute(child: const RegisterScreen()),
                            ),
                            child: const Text(
                              'Sign up',
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
          ),
        );
      },
    );
  }
}
