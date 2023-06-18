import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../constants/colors.dart';
import '../custom_screen.dart';

class CustomCarWidget extends StatelessWidget {
  const CustomCarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Divider(thickness: 2),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomScreen(),
                ),
                // CustomPageRoute(child: const CustomScreen(),direction: AxisDirection.up)
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: defaultColor,
                  )),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Column(
                  children: [
                    Text(
                      'now you can customize your personal car',
                      style: TextStyle(
                        fontSize: 18,
                        color: defaultColor,
                      ),
                    ),
                    Text(
                      'and we will recommend the best for u:)',
                      style: TextStyle(
                        fontSize: 18,
                        color: defaultColor,
                      ),
                    ),
                    Hero(
                      tag: 'tag1',
                      child: Lottie.asset(
                        'assets/lotties/car_type.json',
                        height: 200,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
