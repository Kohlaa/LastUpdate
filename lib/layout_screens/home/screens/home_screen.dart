import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garduation/constants/components.dart';
import 'package:garduation/constants/transitions.dart';
import 'package:garduation/layout_screens/home/screens/model/scan_widget.dart';
import '../../../ParkingDetails/ParkingDetails/parking_details.dart';
import '../../../bloc/cubit.dart';
import '../../../bloc/states.dart';
import '../../../constants/widgets.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({Key? key}) : super(key: key);

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  bool isNearest = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GradCubit, GradStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = GradCubit.get(context);
          return BuildCondition(
            condition: state is! GetParkingLoadingState,
            builder: (context) => Container(
              color: Colors.white,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: screenWidth(context, .42),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isNearest = true;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 15.0,
                                      ),
                                      decoration: BoxDecoration(
                                          color: isNearest
                                              ? Colors.blue
                                              : Colors.grey[200],
                                          borderRadius:
                                              const BorderRadiusDirectional
                                                  .only(
                                            topStart: Radius.circular(15.0),
                                            bottomStart: Radius.circular(15.0),
                                          )),
                                      child: Center(
                                        child: Text(
                                          'Nearest',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18.0,
                                            color: isNearest
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: screenWidth(context, .05),
                                ),
                                SizedBox(
                                  width: screenWidth(context, .42),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isNearest = false;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                        horizontal: 15.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: !isNearest
                                            ? Colors.blue
                                            : Colors.grey[200],
                                        borderRadius:
                                            const BorderRadiusDirectional.only(
                                          topEnd: Radius.circular(15.0),
                                          bottomEnd: Radius.circular(15.0),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Scan',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18.0,
                                            color: !isNearest
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenHeight(context, .01),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(
                                  children: [
                                    isNearest
                                        ? ListView.separated(
                                            itemBuilder: (context, index) =>
                                                buildParkingContainer(
                                              name: cubit.getParkingModel!
                                                  .parkings[index].name,
                                              disc: cubit.getParkingModel!.parkings[index].desc,
                                              availableCapacity: cubit.getParkingModel!.parkings[index].availableCapacity,
                                              rate: cubit.getParkingModel!.parkings[index].ratings.avgRating,
                                              img:
                                                  'https://wallpaperaccess.com/full/1978931.jpg',
                                              onTap: () {
                                                // cubit.createParking(
                                                //   cubit.userModel!.id!,
                                                //   // '647a04c5fbc50ec9cf117dd7',
                                                //   'kohlass parking',
                                                //   'description',
                                                //   200,
                                                //   55,
                                                //   ["hospital", "js"],
                                                //   29,
                                                //   1,
                                                //   32.782,
                                                //   31.2726,
                                                // );
                                                Navigator.push(
                                                  context,
                                                  CustomPageRoute(
                                                    child: ParkingDetailsScreen(
                                                      id: cubit.getParkingModel!
                                                          .parkings[index].id,
                                                      name: cubit
                                                          .getParkingModel!
                                                          .parkings[index]
                                                          .name,
                                                      desc: cubit
                                                          .getParkingModel!
                                                          .parkings[index]
                                                          .desc,
                                                      img: 'img',
                                                      rate: cubit
                                                          .getParkingModel!
                                                          .parkings[index]
                                                          .ratings
                                                          .avgRating,
                                                      fullCapacity: cubit
                                                          .getParkingModel!
                                                          .parkings[index]
                                                          .fullCapacity,
                                                      nearest: cubit
                                                          .getParkingModel!
                                                          .parkings[index]
                                                          .nearest[0]
                                                          .place,
                                                      availableCapacity: cubit
                                                          .getParkingModel!
                                                          .parkings[index]
                                                          .availableCapacity,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            separatorBuilder:
                                                (context, index) =>
                                                    const SizedBox(
                                              height: 12.0,
                                            ),
                                            itemCount: cubit.getParkingModel!
                                                .parkings.length,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                          )
                                        : const ScanWidget(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        });
  }
}
