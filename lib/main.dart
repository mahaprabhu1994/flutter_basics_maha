import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maha1/HomeScreen.dart';
import 'package:maha1/Widgets/AddDataWidget.dart';
import 'package:maha1/Widgets/ColumnWidget.dart';
import 'package:maha1/Widgets/CustomCarouselWidget.dart';
import 'package:maha1/Widgets/DataWidget.dart';
import 'package:maha1/Widgets/IconBtnWidget.dart';
import 'package:maha1/Widgets/PopUpDialogWidget.dart';
import 'package:maha1/Widgets/PopupMenuBtnWidget.dart';
import 'package:maha1/Widgets/RowWidget.dart';
import 'package:maha1/Widgets/ScrollableWidget.dart';
import 'package:maha1/Widgets/StackWidget.dart';
import 'package:maha1/Widgets/TextBtnWidget.dart';
import 'package:maha1/Widgets/TextWidget.dart';

final _router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => HomeScreen()),
  GoRoute(path: '/text', builder: (context, state) => TextWidget()),
  GoRoute(path: '/row', builder: (context, state) => RowWidget()),
  GoRoute(path: '/column', builder: (context, state) => ColumnWidget()),
  GoRoute(path: '/textbtn', builder: (context, state) => TextBtnWidget()),
  GoRoute(path: '/iconbtn', builder: (context, state) => IconBtnWidget()),
  GoRoute(path: '/stack', builder: (context, state) => StackWidget()),
  GoRoute(path: '/scrollable', builder: (context, state) => ScrollableWidget()),
  GoRoute(path: '/data', builder: (context, state) => DataWidget()),
  GoRoute(path: '/add', builder: (context, state) => AddDataWidget()),
  GoRoute(path: '/popup', builder: (context, state) => PopUpDialogWidget()),
  GoRoute(
      path: '/popupmenu', builder: (context, state) => PopupMenuBtnWidget()),
  GoRoute(
      path: '/carousel', builder: (context, state) => CustomCarouselWidget()),
]);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
