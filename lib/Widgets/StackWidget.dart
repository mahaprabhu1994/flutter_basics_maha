import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.green,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                color: Colors.amber,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 70,
                  height: 70,
                  color: Colors.blue,
                ),
              ),
              Icon(Icons.computer)
            ],
          ),
        ),
      ),
    );
  }
}
