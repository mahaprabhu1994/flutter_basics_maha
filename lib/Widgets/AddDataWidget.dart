import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class AddDataWidget extends StatefulWidget {
  const AddDataWidget({super.key});

  @override
  State<AddDataWidget> createState() => _AddDataWidgetState();
}

class _AddDataWidgetState extends State<AddDataWidget> {
  TextEditingController typeController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add New Record"),
        ),
        body: Container(
            child: Form(
                child: Column(
          children: [
            TextFormField(
              controller: typeController,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Type of Expense'),
            ),
            TextFormField(
              controller: amountController,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Amount'),
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    final response = await http.post(
                        Uri.parse('http://localhost:8080/saveexp'),
                        headers: {'Content-type': 'application/json'},
                        body: jsonEncode({
                          'expenceType': typeController.text,
                          'amount': amountController.text,
                        }));

                    if (response.statusCode == 200) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text("Message"),
                                contentPadding: EdgeInsets.all(20.0),
                                content:
                                    Text("New Expense is Successfully added "),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        //Navigator.of(context).pop();
                                        context.go('/data');
                                      },
                                      child: Text("OK"))
                                ],
                              ));
                    }
                  } catch (e) {
                    print('issue while saving the data in http operation');
                  }
                },
                child: Text("Add Expence"))
          ],
        ))));
  }
}
