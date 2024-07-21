import 'package:flutter/material.dart';

class Helloworld extends StatelessWidget {
  const Helloworld({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: const Icon(Icons.home),
        title: const Text(
          "App Bar",
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.segment,
            color: Colors.red,
          ),
        ],
        elevation: 10,
        shadowColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Hello World"),

              Container(
                height: 50,
                width: 50,
                color: Colors.red,
                child: const Center(
                  child: Text("1"),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.blue,
                child: const Center(
                  child: Text("2"),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: 50,
                color: Colors.amber,
                child: const Center(
                  child: Text("3"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 