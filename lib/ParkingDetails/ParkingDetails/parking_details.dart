import 'package:flutter/material.dart';
import 'package:garduation/constants/colors.dart';
import 'package:garduation/constants/components.dart';
import 'package:garduation/payment/modules/register/register_screen.dart';
import '../../constants/transitions.dart';
import '../../modules/video_screen.dart';
import 'rate_system.dart';

class ParkingDetailsScreen extends StatelessWidget {
  final dynamic id;
  final dynamic name;
  final dynamic desc;
  final dynamic img;
  final dynamic rate;
  final dynamic fullCapacity;
  final dynamic nearest;
  final dynamic availableCapacity;

  const ParkingDetailsScreen({
    super.key,
    required this.id,
    required this.name,
    required this.desc,
    required this.img,
    this.rate,
    this.fullCapacity,
    this.nearest,
    this.availableCapacity,
  });

  // GarageData garadata;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    // borderRadius: BorderRadius.only(
                    //   bottomLeft: Radius.circular(30),
                    //   bottomRight: Radius.circular(30),
                    // ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/images/unsplash_DXg6J5CaEcc.png",
                      ),
                    ),
                  ),
                  width: double.infinity,
                  height: screenHeight(context, .3),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 250, 188, 3),
                                  ),
                                  Text(rate.toString()),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    fullCapacity.toString(),
                                    style: TextStyle(
                                      color: defaultColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(' Full capacity'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight(context, .01),
                      ),
                      buildText(desc),
                      SizedBox(
                        height: screenHeight(context, .01),
                      ),
                      SizedBox(
                        height: screenHeight(context, .01),
                      ),
                      Container(
                        width: screenWidth(context, .8),
                        decoration: BoxDecoration(
                          border: Border.all(color: defaultColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Next To:',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: defaultColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight(context, .01),
                              ),
                              ListView.separated(
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    nearest[index].toString(),
                                    style: TextStyle(
                                      color: black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 12.0,
                                ),
                                itemCount: nearest.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight(context, .03),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: padding(context)),
                        child: Container(
                            width: screenWidth(context, .6),
                            height: screenHeight(context, .1),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(44),
                              color: const Color.fromRGBO(238, 241, 244, 1),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: RatingSystem(
                                  id: id,
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: screenHeight(context, .03),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              availableCapacity != 0
                                  ? Navigator.push(
                                      context,
                                      CustomPageRoute1(
                                          child: const VideoScreen()))
                                  : buildSnackBar(
                                      'the parking is full', context, 2);
                            },
                            child: Container(
                              width: screenWidth(context, .4),
                              height: screenHeight(context, .05),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: const Color.fromRGBO(25, 111, 213, 1)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.5),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.ondemand_video_rounded,
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ),
                                      SizedBox(
                                        width: screenWidth(context, .05),
                                      ),
                                      Text(
                                        "Video",
                                        style: TextStyle(
                                            fontSize: screenWidth(context, .04),
                                            color: const Color.fromRGBO(
                                                255, 255, 255, 1),
                                            fontFamily: 'poppins',
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  CustomPageRoute(
                                      child: PaymentRegisterationScreen()));
                            },
                            child: Container(
                              width: screenWidth(context, .4),
                              height: screenHeight(context, .05),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: const Color.fromRGBO(25, 111, 213, 1)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.5),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.payment,
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                      ),
                                      SizedBox(
                                        width: screenWidth(context, .05),
                                      ),
                                      Text(
                                        "Pay",
                                        style: TextStyle(
                                            fontSize: screenWidth(context, .04),
                                            color: const Color.fromRGBO(
                                                255, 255, 255, 1),
                                            fontFamily: 'poppins',
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
