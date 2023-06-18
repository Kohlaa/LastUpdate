import 'dart:io';
import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garduation/layout_screens/profile/screens/update_profile_data_screen.dart';
import 'package:garduation/map/search_screen.dart';
import 'package:garduation/modules/qr_scanner/create_qr.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import '../../../bloc/cubit.dart';
import '../../../bloc/states.dart';
import '../../../constants/colors.dart';
import '../../../constants/components.dart';
import '../../../constants/transitions.dart';
import '../../../feature1/one/screen_one.dart';
import 'add_garage_screen.dart';
import 'confirm_image.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;
  var formProfileKey = GlobalKey<FormState>();

  Future<File> saveImage(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  Future pickImage(ImageSource source, context) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      //final imageTemporary = File(image.path);
      final imageTemporary = await saveImage(image.path);
      setState(
        () async {
          this.image = imageTemporary;
          File myFile = File(image.path);
          Navigator.push(
            context,
            CustomPageRoute(
                child: ConfirmImageScreen(
                  image: myFile,
                ),
                direction: AxisDirection.right),
          );
          print('lol lol =>: ${myFile}');
        },
      );
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<GradCubit, GradStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          //GradCubit.get(context).getUserData();
        }
      },
      builder: (context, state) {
        var cubit = GradCubit.get(context);
        return BuildCondition(
          // condition: cubit.userModel != null,
          condition: state is! UserDataLoadingState,
          builder: (context) => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SafeArea(
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: size.height * .4,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                          gradient: gradient,
                          color: Colors.blueGrey.withOpacity(.3),
                        ),
                        child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    cubit.userModel!.lastImg !=
                                            'there is no last image'
                                        ? Container(
                                            width: size.width * 0.46,
                                            height: size.width * 0.46,
                                            margin: const EdgeInsets.only(
                                              top: 24.0,
                                              bottom: 20.0,
                                            ),
                                            decoration: BoxDecoration(
                                              gradient: gradient,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.5),
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: ClipOval(
                                                  child: Image(
                                                    image: NetworkImage(
                                                        '${cubit.userModel!.lastImg}'),
                                                    // image:NetworkImage('${getProfileImageModel!.lastImg!}'.replaceAll('[', '').replaceAll(']', '')),
                                                    //image:NetworkImage('http://res.cloudinary.com/dgn4qwa6m/image/upload/v1674477825/yhmse8u1ujvjoomkj4em.jpg'),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            width: size.width * 0.46,
                                            height: size.width * 0.46,
                                            margin: const EdgeInsets.only(
                                              top: 24.0,
                                              bottom: 20.0,
                                            ),
                                            decoration: BoxDecoration(
                                              gradient: gradient,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(2.2),
                                              child: Container(
                                                height: 80,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(
                                                      "https://cdn.icon-icons.com/icons2/3150/PNG/512/user_profile_male_icon_192702.png",
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                    Positioned(
                                      bottom: 25,
                                      right: 4,
                                      child: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: const Color.fromRGBO(
                                            30, 10, 100, 1),
                                        //backgroundColor: Colors.white,
                                        child: IconButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (_) => AlertDialog(
                                                content: Lottie.asset(
                                                    'assets/lotties/image.json'),
                                                actions: [
                                                  Center(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        TextButton(
                                                          onPressed: () {
                                                            pickImage(
                                                              ImageSource
                                                                  .camera,
                                                              context,
                                                            );
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: shadeMask(
                                                            'Camera',
                                                            const TextStyle(
                                                                fontSize: 20),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 120),
                                                        TextButton(
                                                          onPressed: () {
                                                            pickImage(
                                                              ImageSource
                                                                  .gallery,
                                                              context,
                                                            );
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: shadeMask(
                                                            'Gallery',
                                                            const TextStyle(
                                                                fontSize: 20),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                          icon: iconSh(Icons.camera, size: 30),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Text(
                                    cubit.userModel!.name!,
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: defaultColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                //const SizedBox(height: 5),
                                Expanded(
                                  child: Text(
                                    cubit.userModel!.email!,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: defaultColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(height: 10),
                              ]),
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    CustomPageRoute(
                                        child: UpdateProfileDataScreen()));
                              },
                              child: Text(
                                "Edit Profile",
                                style: TextStyle(
                                    color:
                                        const Color.fromRGBO(25, 111, 213, 1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: size.height * .02),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    CustomPageRoute1(
                                        child: const SearchScreen(
                                      isCreate: true,
                                    )));
                              },
                              style: ButtonStyle(
                                //backgroundColor: MaterialStateProperty.all(co2),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.local_parking_outlined),
                                    Spacer(),
                                    Text(
                                      'Add Your Parking now',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(Icons.local_parking_outlined)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight(context, .01)),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CustomPageRoute(
                                    child: const CreateQrCodeScreen(),
                                  ),
                                );
                              },
                              style: ButtonStyle(
                                //backgroundColor: MaterialStateProperty.all(co2),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.qr_code),
                                    Spacer(),
                                    Text(
                                      "Create Qr",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(Icons.qr_code)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * .07),
                            BuildCondition(
                              condition: state is! LogoutLoadingState,
                              builder: (context) => TextButton(
                                onPressed: () {
                                  cubit.logout(context);
                                },
                                child: Text(
                                  "Logout",
                                  style: TextStyle(
                                    color:
                                        const Color.fromRGBO(25, 111, 213, 1),
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.height * .03,
                                    // decoration: TextDecoration.underline,
                                    decorationThickness: 2,
                                  ),
                                ),
                              ),
                              fallback: (context) => const Center(
                                  child: CircularProgressIndicator()),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
