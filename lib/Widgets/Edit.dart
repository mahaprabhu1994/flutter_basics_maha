// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class Edit extends StatefulWidget {
  String id;
  String expenceType;
  String amount;
  //const Edit({super.key});
  Edit(this.id, this.expenceType, this.amount, {super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController typeController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  String id = "";
  @override
  void initState() {
    super.initState();

    setState(() {
      id = widget.id;
      typeController.text = widget.expenceType;
      amountController.text = widget.amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Expence")),
      body: Center(
        child: Form(
            child: Container(
          width: 200,
          child: Column(children: [
            TextFormField(
                controller: typeController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'type',
                )),
            TextFormField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: 'amount',
                border: UnderlineInputBorder(),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 30)),
            MaterialButton(
              color: Colors.purple,
              onPressed: () async {
                //form validation
                editUser();
              },
              child: const Text("update"),
            )
          ]),
        )),
      ),
    );
  }

  editUser() async {
    var Expid = id;
    var ExpType = typeController.text;
    var ExpAmt = amountController.text;

    if (ExpType.isNotEmpty && ExpAmt.isNotEmpty) {
      var url = "http://localhost:8080/updateexp/$Expid";
      var bodyData =
          json.encode({"id": Expid, "expenceType": ExpType, "amount": ExpAmt});
      var response = await http.put(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json"
          },
          body: bodyData);
      if (response.statusCode == 200) {
        //var msgSuccess = json.decode(response.body)['message'];
        //print(msgSuccess);
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("Message"),
                  contentPadding: const EdgeInsets.all(20.0),
                  content: const Text("Updated Successfully."),
                  actions: [
                    TextButton(
                        onPressed: () {
                          //Navigator.of(context).pop();
                          context.go('/data');
                        },
                        child: const Text("OK"))
                  ],
                ));
      } else {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("Message"),
                  contentPadding: const EdgeInsets.all(20.0),
                  content: const Text("Updated Failed."),
                  actions: [
                    TextButton(
                        onPressed: () {
                          //Navigator.of(context).pop();
                          context.go('/data');
                          ;
                        },
                        child: const Text("OK"))
                  ],
                ));
      }
    }
  }
}
