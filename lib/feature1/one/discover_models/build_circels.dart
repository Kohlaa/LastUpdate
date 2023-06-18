import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/transitions.dart';
import '../cars_list_view.dart';

List<String> images = [
  'assets/images/audi_logo.png',
  'assets/images/bmw_logo.png',
  'assets/images/gmc_logo.jpg',
  'assets/images/obel_logo.png',
];
List<String> names = [
  'Audi',
  'BMW',
  'GMC',
  'Opel',
];

double height(context) => MediaQuery.of(context).size.height * .1;

double width(context) => MediaQuery.of(context).size.width * .18;

double heightBetweenCircleAndText(context) =>
    MediaQuery.of(context).size.height * .001;

Widget buildCircleImageGrid(
    List<String> images, index, List<String> names, context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      buildItem(images, index, names, context),
      buildItem(images, index + 1, names, context),
      buildItem(images, index + 2, names, context),
      buildItem(images, index + 3, names, context),
    ],
  );
}

InkWell buildItem(List<String> images, index, List<String> names, context) {
  return InkWell(
    onTap: (){
      Navigator.push(
          context,
          CustomPageRoute(
              child: CarsListView(
                type: names[index] == 'BMW'
                    ? 'bmw'
                    : names[index] == 'Audi'
                    ? 'audi'
                    : names[index] == 'Opel'
                    ? 'obel'
                    : names[index] == 'GMC'
                    ? 'gmc'
                    : '',
              )));
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: height(context),
          height: width(context),
          decoration: BoxDecoration(
            border: Border.all(color: defaultColor, width: 0),
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(images[index]),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        SizedBox(height: heightBetweenCircleAndText(context)),
        Text(
          names[index],
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
