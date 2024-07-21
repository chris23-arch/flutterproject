import 'package:flutter/material.dart';
import 'package:flutter_tutorial/FLUTTER-WIDGETS/carousel_class.dart';
import 'package:flutter_tutorial/FLUTTER-WIDGETS/graph_widget.dart';
import 'package:flutter_tutorial/FLUTTER-WIDGETS/image_changer.dart';

class TabbedView extends StatefulWidget {
  const TabbedView({super.key});

  @override
  State<TabbedView> createState() => _TabViewState();
}

class _TabViewState extends State<TabbedView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          elevation: 0,
          title: const Text("WHATSAPP"),
          bottom: const TabBar(
            indicatorColor: Colors.red,
            indicatorWeight: 4,
            labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            tabs: [
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "STATUS",
              ),
              Tab(
                text: "CALLS",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ImageChanger(),
            GraphWidget(),
            CarouselClass(),
          ],
        ),
      ),
    );
  }
}
