import 'package:flutter/material.dart';
import 'package:flutter_tutorial/ASSIG/text_area.dart';
import 'package:flutter_tutorial/FLUTTER-WIDGETS/bouncing.dart';
import 'package:flutter_tutorial/FLUTTER-WIDGETS/graph_widget.dart';
import 'package:flutter_tutorial/FLUTTER-WIDGETS/graphs_widget.dart';
import 'package:flutter_tutorial/SCREENS/borderscreen.dart';
import 'package:flutter_tutorial/SCREENS/graphscreen.dart';
import 'package:flutter_tutorial/FLUTTER-WIDGETS/practice.dart';
import 'package:flutter_tutorial/FLUTTER-WIDGETS/tabbedview.dart';
import 'package:flutter_tutorial/SCREENS/soundplayerscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Function table',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Practice(),
    );
  }
}
