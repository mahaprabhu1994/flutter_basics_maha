import 'package:flutter/material.dart';

class ScrollableWidget extends StatefulWidget {
  const ScrollableWidget({super.key});

  @override
  State<ScrollableWidget> createState() => _ScrollableWidgetState();
}

class _ScrollableWidgetState extends State<ScrollableWidget> {
  final List<String> entries = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DraggableScrollableActuator(
        child: Center(
          child: Container(
            width: 250,
            height: 400,
            decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${entries[index]}'),
                    )),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: entries.length),
          ),
        ),
      ),
    );
  }
}
