import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
  const TextArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: const Icon(Icons.home),
        title: const Text(
          "App Bar",
          style: TextStyle(
            fontSize: 50,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.segment,
            color: Colors.brown,
          ),
        ],
        elevation: 20,
        shadowColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.yellow,
          padding: const EdgeInsets.all(50),
          child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("textarea")]),
        ),
      ),
    );
  }
}
