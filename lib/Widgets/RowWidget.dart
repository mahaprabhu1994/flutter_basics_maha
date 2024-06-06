import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            color: Colors.blueAccent,
          ),
          Container(
            width: 50,
            height: 50,
            color: const Color.fromARGB(255, 68, 255, 124),
          ),
          Container(
            width: 50,
            height: 50,
            color: Color.fromARGB(255, 196, 116, 24),
          ),
        ],
      )),
    );
  }
}
