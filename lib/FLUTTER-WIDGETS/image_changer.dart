import 'dart:async';

import 'package:flutter/material.dart';

class ImageChanger extends StatefulWidget {
  const ImageChanger({super.key});

  @override
  State<ImageChanger> createState() => _ImageChangerState();
}

class _ImageChangerState extends State<ImageChanger> {
  int currentImageIndex = 0;
  List<String> backgroundImages = [
    'assets/images/200301_v9_bc.jpg',
    'assets/images/219616_v9_bb.jpg',
    'assets/images/276446_v9_bb.jpg',
    'assets/images/729737--baby-wallpaper-lil-baby-iphone-wallpaper-themes.jpg',
    'assets/images/Moby-Grape-Wow.jpg',
  ];

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        currentImageIndex = (currentImageIndex + 1) % backgroundImages.length;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              backgroundImages[currentImageIndex],
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Text(
            'Background Changer', 
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
