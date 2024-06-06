import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:maha1/Widgets/Edit.dart';

// This is the type used by the menu below.
enum SampleItem { Update, Delete }

class DataWidget extends StatefulWidget {
  const DataWidget({super.key});

  @override
  State<DataWidget> createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {
//fetch data from server;
  List resData = [];

  Future<void> fetchResData() async {
    try {
      final res = await http.get(Uri.parse('http://localhost:8080/getallexp'));

      setState(() {
        resData = jsonDecode(res.body);
        print(resData);
      });
    } catch (e) {
      print("something went wrong while get the data from server");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchResData();
  }

  SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Get Data from Server",
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 400,
              color: Colors.orange,
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Text(resData[index]['expenceType']),
                                    Container(
                                      width: 30,
                                      child: Icon(
                                          Icons.arrow_circle_right_outlined),
                                    ),
                                    Text(resData[index]['amount'].toString()),
                                  ],
                                ),
                                // add update and delete functionality

                                PopupMenuButton<SampleItem>(
                                  // step1
                                  initialValue: selectedItem,
                                  //step2
                                  itemBuilder: (BuildContext context) =>
                                      <PopupMenuEntry<SampleItem>>[
                                    const PopupMenuItem<SampleItem>(
                                      value: SampleItem.Update,
                                      child: Row(
                                        children: [
                                          Icon(Icons.update_sharp),
                                          Text('Update')
                                        ],
                                      ),
                                    ),
                                    const PopupMenuItem<SampleItem>(
                                      value: SampleItem.Delete,
                                      child: Row(children: [
                                        Icon(Icons.delete_sharp),
                                        Text('Delete')
                                      ]),
                                    )
                                  ],
                                  //step3
                                  onSelected: (SampleItem item) {
                                    setState(() {
                                      selectedItem = item;
                                      if (item.name == "Update") {
                                        var id =
                                            resData[index]['id'].toString();
                                        var expType = resData[index]
                                                ['expenceType']
                                            .toString();
                                        var amt =
                                            resData[index]['amount'].toString();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Edit(id, expType, amt)));
                                      } else if (item.name == "Delete") {
                                        var id =
                                            resData[index]['id'].toString();
                                        deleteExp(id);
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: resData.length),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push('/add');
          },
          child: Icon(Icons.add)),
    );
  }

  deleteExp(id) async {
    var uri = "http://localhost:8080/deleteexp/$id";
    print('uri' + uri);
    var res = await http.delete(Uri.parse(uri));
    if (res.statusCode == 200) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Message"),
                contentPadding: const EdgeInsets.all(20.0),
                content: const Text("Expence Successfully Deleted"),
                actions: [
                  TextButton(
                      onPressed: () {
                        context.go('/');
                      },
                      child: const Text("ok"))
                ],
              ));
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Message"),
                contentPadding: const EdgeInsets.all(20.0),
                content: const Text("Failed to Delete."),
                actions: [
                  TextButton(
                      onPressed: () {
                        context.go('/data');
                      },
                      child: const Text("ok"))
                ],
              ));
    }
  }
}
