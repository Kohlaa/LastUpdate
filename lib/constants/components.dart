// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import 'colors.dart';

double screenWidth(BuildContext context, double value) {
  return MediaQuery.of(context).size.width * value;
}

double screenHeight(BuildContext context, double value) {
  return MediaQuery.of(context).size.height * value;
}

double padding(BuildContext context) {
  return MediaQuery.of(context).size.width * 0.033;
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}

ShaderMask iconSh(icon, {double? size}) => ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (Rect bounds) => const LinearGradient(
        colors: <Color>[
          Color.fromRGBO(27, 200, 234, 1),
          Color.fromRGBO(0, 80, 255, 1.0),
        ],
      ).createShader(bounds),
      child: Icon(
        icon,
        size: size,
      ),
    );

buildSnackBar(String? message, context, duration) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message!,
      ),
      duration: Duration(seconds: duration),
    ),
  );
}

Widget buildText(String text) {
  return ReadMoreText(
    text,
    trimLines: 2,
    trimMode: TrimMode.Line,
    trimCollapsedText: 'Read More',
    trimExpandedText: 'Read Less',
    style: const TextStyle(fontSize: 16),
  );
}

void navigateTo(Widget, context) => Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, _) {
          return FadeTransition(
            opacity: animation,
            child: Widget,
          );
        },
      ),
    );

void navigateAndFinish(Widget, context) => Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, _) {
          return FadeTransition(
            opacity: animation,
            child: Widget,
          );
        },
      ),
      (route) => false,
    );

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String token = '';

LinearGradient gradient = LinearGradient(
  // begin: Alignment.topLeft,
  // end: Alignment.bottomRight,
  colors: <Color>[
    Colors.blue.shade200,
    Colors.blue.shade300,
    Colors.blue.shade400,
    Colors.blue.shade500,
    Colors.blue.shade600,
    Colors.blue.shade700,
    Colors.blue.shade800,
  ],
);

ShaderMask shadeMask(text, style) => ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (rect) => LinearGradient(
        // begin: Alignment.topLeft,
        // end: Alignment.bottomRight,
        colors: <Color>[
          Color.fromRGBO(27, 200, 234, 1),
          Color.fromRGBO(194, 37, 104, 1),
        ],
      ).createShader(rect),
      child: Text(
        text,
        style: style,
      ),
    );

Widget catchImage(image, {bool? details}) => CachedNetworkImage(
      width: double.infinity,
      height: details! ? 400 : 200,
      imageUrl: image,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );

Widget TFF({
  validator,
  required action,
  required TextInputType? type,
  required String label,
  dynamic controller,
  Color? bcColor,
  IconData? prefix,
  IconData? suffix,
  bool secure = false,
  suffixPressed,
  Function? onSubmit,
  String? hint,
  bool readOnly = false,
  VoidCallback? fun,
  Color? bc,
}) =>
    TextFormField(
      onTap: fun,
      controller: controller,
      readOnly: readOnly,
      validator: validator,
      textInputAction: action,
      keyboardType: type,
      obscureText: secure,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: defaultColor),
          borderRadius: BorderRadius.circular(40),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(40),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: defaultColor),
        ),
        prefixIcon: ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bounds) => const LinearGradient(
            colors: <Color>[
              Color.fromRGBO(27, 200, 234, 1),
              Color.fromRGBO(194, 37, 104, 1),
            ],
          ).createShader(bounds),
          child: Icon(prefix),
        ),
        hintText: hint,
        filled: true,
        //fillColor: bc ?? Colors.blueGrey.withOpacity(.3),
        labelText: label,
        alignLabelWithHint: false,
        floatingLabelStyle: TextStyle(
            fontSize: 20, color: defaultColor, fontWeight: FontWeight.bold),
        suffixIcon: IconButton(
          icon: ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (Rect bounds) => const LinearGradient(
              colors: <Color>[
                Color.fromRGBO(27, 200, 234, 1),
                Color.fromRGBO(194, 37, 104, 1),
              ],
            ).createShader(bounds),
            child: Icon(
              suffix,
              size: 30,
            ),
          ),
          onPressed: () {
            suffixPressed();
          },
        ),
      ),
    );
