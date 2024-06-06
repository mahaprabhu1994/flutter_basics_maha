import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IconBtnWidget extends StatelessWidget {
  const IconBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: IconButton(
            color: Colors.deepOrange,
            padding: EdgeInsets.all(10),
            onPressed: () {
              context.go('/');
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 50,
              color: Colors.blueAccent,
            )),
      ),
    );
  }
}
