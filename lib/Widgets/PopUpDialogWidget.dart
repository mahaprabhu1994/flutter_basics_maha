import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PopUpDialogWidget extends StatelessWidget {
  const PopUpDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popup Widget"),
      ),
      body: Container(
        child: Column(children: [
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text("Message"),
                          contentPadding: EdgeInsets.all(20.0),
                          content: Text(
                              "This is the popup Dialog widget for study purpose "),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  //Navigator.of(context).pop();
                                  context.pop();
                                },
                                child: Text("Close"))
                          ],
                        ));
              },
              child: Text("Popup"))
        ]),
      ),
    );
  }
}
