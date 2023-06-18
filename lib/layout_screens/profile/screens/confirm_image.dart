import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../bloc/cubit.dart';
import '../../../bloc/states.dart';
import '../../../constants/colors.dart';

class ConfirmImageScreen extends StatelessWidget {
  final dynamic image;

  const ConfirmImageScreen({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<GradCubit, GradStates>(
      listener: (context,state){
        if(state is AddProfileImageSuccessState){
          GradCubit.get(context).getUserData();
          Navigator.pop(context);
        }
      },
      builder: (context,state){
        var cubit = GradCubit.get(context);

        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_forward,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 450,
                        width: double.infinity,
                        child: image == null
                            ? Lottie.asset('assets/lotties/image.json')
                            : Image(
                          fit: BoxFit.fill,
                          image: FileImage(image),
                        ),
                      ),
                      const SizedBox(height: 50),
                      BuildCondition(
                        condition: state is ! AddProfileImageLoadingState,
                        //condition: true,
                        builder: (context) =>  ElevatedButton(
                            onPressed: () {
                              cubit.addProfileImageHTTP(image);
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
                                'done',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                            )),
                        fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
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
