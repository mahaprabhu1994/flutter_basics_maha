import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TextBtnWidget extends StatelessWidget {
  const TextBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: TextButton(
          child: Text("Submit"),
          onPressed: () {
            context.go('/');
          },
        ),
      ),
    );
  }
}
