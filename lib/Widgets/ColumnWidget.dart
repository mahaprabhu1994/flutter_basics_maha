import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 50,
            height: 50,
            color: Colors.blueAccent,
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.cyanAccent,
          ),
          Container(
            width: 50,
            height: 50,
            color: Colors.green,
          ),
        ]),
      ),
    );
  }
}
