import 'package:flutter/material.dart';

import 'colors.dart';

double width = double.infinity;

Container defaultButton({
  required text,
  required void Function() onPressed,
  size = 18.0,
  isBold = true,
  buttonWidth = 150.0,
  backgroungColor = const Color(0xFF196FD5),
  textColor = Colors.white,
}) {
  return Container(
    width: buttonWidth,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      color: backgroungColor,
    ),
    child: TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontSize: size,
          color: textColor,
        ),
      ),
    ),
  );
}

Icon buildIcon({
  required icon,
  required size,
  color = Colors.white,
}) {
  return Icon(
    icon,
    size: size,
    color: color,
  );
}

IconButton buildArrowBackButton({
  required void Function() onPressed,
}) {
  return IconButton(
    icon: const Icon(
      Icons.arrow_back_ios,
      color: Colors.black,
    ),
    onPressed: onPressed,
  );
}

Widget buildText({
  required text,
  size = 18.0,
  isBold = true,
  textAlign = TextAlign.start,
  color = Colors.black,
}) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontSize: size,
      color: color,
    ),
    textAlign: textAlign,
  );
}

Column buildSemiRightCircle(radius) {
  return Column(
    children: [
      Container(
        height: radius,
        width: radius,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(200.0),
          ),
          color: defaultColor,
        ),
      ),
      Container(
        height: radius,
        width: radius,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(200.0),
          ),
          color: defaultColor,
        ),
      ),
    ],
  );
}

Column buildSemiLeftCircle(radius) {
  return Column(
    children: [
      Container(
        height: radius,
        width: radius,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(200.0),
          ),
          color: defaultColor,
        ),
      ),
      Container(
        height: radius,
        width: radius,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(200.0),
          ),
          color: defaultColor,
        ),
      ),
    ],
  );
}

void NavFunc({required context}) {}

buildIconButton(
    {required void Function() onPressed,
    required IconData icon,
    color = Colors.black,
    size = 13.0}) {
  IconButton(
    onPressed: onPressed,
    icon: Icon(
      icon,
      color: color,
      size: size,
    ),
  );
}

Container buildParkingContainer(
    {name,
    disc,
    img,
    required void Function() onTap,
    availableCapacity,
    rate}) {
  return Container(
    padding: const EdgeInsets.all(10.0),
    height: 130.0,
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.black54.withOpacity(.2),
        borderRadius: BorderRadius.circular(10.0)),
    child: InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 110.0,
            width: 110.0,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image(
              image: NetworkImage(
                '$img',
              ),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: black,
                      ),
                    ),
                    Spacer(),
                    availableCapacity != 0
                        ? Text(
                            'available',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.green,
                            ),
                          )
                        : Text('')
                  ],
                ),
                const SizedBox(
                  height: 3.0,
                ),
                Text(
                  disc,
                  style: TextStyle(
                    color: black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'See More',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      child: Text(
                        rate.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
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
  );
}

Padding buildTextFormField({required title}) => Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: const Padding(
            padding: EdgeInsets.all(0.0),
            child: Icon(
              Icons.alternate_email,
              color: Color(0xFF196FD5),
            ),
          ),
          hintStyle: const TextStyle(
            color: Color(0xFF196FD5),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
// labelText: 'User Name',
          hintText: '$title',
        ),
      ),
    );
