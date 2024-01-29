import 'package:flutter/material.dart';

class TextData extends StatelessWidget {
  const TextData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: const TextSpan(
      text: 'Login',
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 25, color: Colors.blue),
    ));
  }
}
