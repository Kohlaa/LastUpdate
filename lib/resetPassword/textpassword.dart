import 'package:flutter/material.dart';

class TextPassword extends StatelessWidget {
  String txt;

  TextPassword(this.txt, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
    );
  }
}
