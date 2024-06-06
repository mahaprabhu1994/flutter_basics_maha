import 'package:flutter/material.dart';

// This is the type used by the menu below.
enum SampleItem { Update, Delete }

class PopupMenuBtnWidget extends StatefulWidget {
  const PopupMenuBtnWidget({super.key});

  @override
  State<PopupMenuBtnWidget> createState() => _PopupMenuBtnWidgetState();
}

class _PopupMenuBtnWidgetState extends State<PopupMenuBtnWidget> {
  SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PopupMenuButton<SampleItem>(
        // step1
        initialValue: selectedItem,
        //step2
        itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
          const PopupMenuItem<SampleItem>(
            value: SampleItem.Update,
            child: Row(
              children: [Icon(Icons.update_sharp), Text('Update')],
            ),
          ),
          const PopupMenuItem<SampleItem>(
            value: SampleItem.Delete,
            child: Row(children: [Icon(Icons.delete_sharp), Text('Delete')]),
          )
        ],
        //step3
        onSelected: (SampleItem item) {
          setState(() {
            selectedItem = item;
            if (item.name == "Update") {
              var id = "Hi";
              var expType = "expence type";
              var amt = 'amount';
              print('update');
            } else if (item.name == "Delete") {
              print("delete");
            }
          });
        },
      ),
    );
  }
}
