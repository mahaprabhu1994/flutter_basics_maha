// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(
        "Text ",
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
