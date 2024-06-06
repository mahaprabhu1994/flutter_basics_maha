import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Title",
        ),
        backgroundColor: Colors.cyan,
      ),
      drawer: Drawer(
        width: 200,
        elevation: 10,
        child: Column(children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.cyan),
              accountName: Text("USerName"),
              accountEmail: Text("user@email.com")),
          ListTile(
            leading: Icon(Icons.pages),
            title: Text("Pages"),
          ),
          ListTile(
            leading: Icon(Icons.business),
            title: Text("business"),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text("search"),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Exit"),
          ),
        ]),
      ),
      body: Center(
        child: Column(children: [
          // Text(
          //   "Widgets List",
          //   style:
          //       TextStyle(decoration: TextDecoration.underline, fontSize: 24),
          // ),
          TextButton(
              onPressed: () {
                context.push("/text");
              },
              child: Text('Text Widget')),
          TextButton(
              onPressed: () {
                context.push("/row");
              },
              child: Text('Row Widget')),
          TextButton(
              onPressed: () {
                context.push("/column");
              },
              child: Text('Column Widget')),
          TextButton(
              onPressed: () {
                context.push("/textbtn");
              },
              child: Text('Text Button Widget')),
          TextButton(
              onPressed: () {
                context.push("/iconbtn");
              },
              child: Text('Icon Button Widget')),
          TextButton(
              onPressed: () {
                context.push("/stack");
              },
              child: Text('Stack Widget')),
          TextButton(
              onPressed: () {
                context.push("/scrollable");
              },
              child: Text('Scrollable Widget')),
          TextButton(
              onPressed: () {
                context.push("/popup");
              },
              child: Text('PopUp Dialog Widget')),
          TextButton(
              onPressed: () {
                context.push("/popupmenu");
              },
              child: Text('PopUp Menu Widget')),
          TextButton(
              onPressed: () {
                context.push("/carousel");
              },
              child: Text('Carousel Widget')),
          SafeArea(child: Divider()),
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Center(
              child: Container(
                width: 120,
                height: 20,
                // color: Colors.grey,
                child: ElevatedButton(
                    onPressed: () {
                      context.push('/data');
                    },
                    child: Text("View Data")),
              ),
            ),
          )
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(currentIndex: 0, items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.view_array), label: "View")
      ]),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.cyan,
          elevation: 1,
          onPressed: () {
            context.push('/add');
          },
          child: Icon(Icons.add)),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.turn_left_outlined),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.turn_right_outlined),
        ),
      ],
    );
  }
}
