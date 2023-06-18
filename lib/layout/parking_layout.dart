import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garduation/feature1/one/screen_one.dart';
import 'package:garduation/feature1/two/screen_two.dart';
import 'package:garduation/modules/qr_scanner/create_qr.dart';
import 'package:lottie/lottie.dart';
import '../bloc/cubit.dart';
import '../bloc/states.dart';
import '../constants/colors.dart';
import '../constants/components.dart';
import '../constants/transitions.dart';
import '../map/search_screen.dart';

class Layout extends StatelessWidget {
  static const String routeName = "Layout-screen";
  final _advancedDrawerController = AdvancedDrawerController();

  Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GradCubit, GradStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = GradCubit.get(context);
        final Size size = MediaQuery.of(context).size;
        return AdvancedDrawer(
          backdropColor: const Color.fromRGBO(82, 91, 244, 1).withOpacity(.2),
          controller: _advancedDrawerController,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          animateChildDecoration: true,
          rtlOpening: false,
          // openScale: 1.0,
          disabledGestures: false,
          childDecoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black12,
                blurRadius: 0.0,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          drawer: SafeArea(
            child: ListTileTheme(
              textColor: Colors.white,
              iconColor: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: screenHeight(context, .1)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10000),
                    child: Image(
                      height: screenHeight(context, .2),
                      image: AssetImage('assets/images/app_icon.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: screenHeight(context, .02)),
                    child: shadeMask('Rakna - ركنه', TextStyle(fontSize: screenHeight(context, .02),),),
                  ),
                  buildListTile(context, const DiscoverWidget(),
                      Icons.people_alt_rounded, 'Do u want a car !'),
                  buildListTile(context, const CustomWidget(),
                      Icons.sports_volleyball, 'Special Cars'),
                  buildListTile(context, const CreateQrCodeScreen(),
                      Icons.qr_code_2_outlined, 'Create your Qr-Code'),
                  ListTile(
                    onTap: () {
                      cubit.logout(context);
                    },
                    leading: ShaderMask(
                      blendMode: BlendMode.srcATop,
                      shaderCallback: (Rect bounds) => const LinearGradient(
                        colors: <Color>[
                          Color.fromRGBO(27, 200, 234, 1),
                          Color.fromRGBO(194, 37, 104, 1),
                        ],
                      ).createShader(bounds),
                      child: const Icon(Icons.logout),
                    ),
                    title: const Text('LogOut'),
                  ),
                  const Spacer(),
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'All rights reserved to ',
                          ),
                          Text(
                            'Rakna - ركنه',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: defaultColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white24,
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: _handleMenuButtonPressed,
                  icon: ValueListenableBuilder<AdvancedDrawerValue>(
                    valueListenable: _advancedDrawerController,
                    builder: (_, value, __) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: Icon(
                          value.visible ? Icons.clear : Icons.menu,
                          color: defaultColor,
                          key: ValueKey<bool>(value.visible),
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CustomPageRoute(
                        child: const SearchScreen(
                          isCreate: false,
                        ),
                      ),
                    );
                  },
                  child: Lottie.asset('assets/lotties/search_map.json',
                      height: screenHeight(context, .1)),
                )
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: AnimatedBottomNavigationBar(
              icons: cubit.iconList,
              onTap: (index) => cubit.change(index),
              activeIndex: cubit.currentIndex,
              iconSize: size.width * .07,
              gapWidth: 1,
              height: size.height * .08,
              inactiveColor: Colors.grey,
              activeColor: Colors.black,
            ),
          ),
        );
      },
    );
  }

  ListTile buildListTile(BuildContext context, screen, icon, text) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          CustomPageRoute(child: screen, direction: AxisDirection.left),
        );
      },
      leading: ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (Rect bounds) => const LinearGradient(
          colors: <Color>[
            Color.fromRGBO(27, 200, 234, 1),
            Color.fromRGBO(194, 37, 104, 1),
          ],
        ).createShader(bounds),
        child: Icon(icon),
      ),
      title: Text(text),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
