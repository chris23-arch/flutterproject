import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GraphScreen(), // Set the home to GraphScreen
    );
  }
}

class GraphScreen extends StatefulWidget {
  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  ui.Image? pointImage;
  AudioPlayer _audioPlayer = AudioPlayer();
  bool _isSoundPlaying = false;

  @override
  void initState() {
    super.initState();
    _loadImage('assets/images/jesus.jpg').then((image) {
      setState(() {
        pointImage = image;
      });
    });
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )
      ..addListener(() {
        final animatedX = _getAnimatedX();
        final animatedY = animatedX * animatedX - animatedX - 6;
        if (animatedY.truncate() <= -6) {
          _playSound();
          //   if (!_isSoundPlaying) {
          //     _playSound();
          //   }
          // } else {
          //   if (_isSoundPlaying) {
          //     _stopSound();
          //   }
        }
        setState(() {});
      })
      ..repeat(reverse: true);
  }

  Future<ui.Image> _loadImage(String asset) async {
    final ByteData data = await rootBundle.load(asset);
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(data.buffer.asUint8List(), (ui.Image img) {
      completer.complete(img);
    });
    return completer.future;
  }

  Future<void> _playSound() async {
    // if (_isSoundPlaying) return;
    // setState(() {
    //   _isSoundPlaying = true;
    // });
    await _audioPlayer.play(AssetSource('sound/player.mp3'));
  }

  Future<void> _stopSound() async {
    if (!_isSoundPlaying) return;
    setState(() {
      _isSoundPlaying = false;
    });
    await _audioPlayer.stop();
  }

  double _getAnimatedX() {
    final double startX = -10;
    final double endX = 10;
    return startX + (endX - startX) * _animationController.value;
  }

  @override
  void dispose() {
    _animationController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Graph Plotter'),
      ),
      body: CustomPaint(
        size: Size(double.infinity, double.infinity),
        painter: GraphPainter(_animationController.value, pointImage),
      ),
    );
  }
}

class GraphPainter extends CustomPainter {
  final double animationValue;
  final ui.Image? pointImage;

  GraphPainter(this.animationValue, this.pointImage);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.transparent
      ..strokeWidth = 2;

    final axisPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    final textPaint = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    canvas.drawLine(Offset(size.width / 2, 0),
        Offset(size.width / 2, size.height), axisPaint);
    canvas.drawLine(Offset(0, size.height / 2),
        Offset(size.width, size.height / 2), axisPaint);

    final double xMin = -10;
    final double xMax = 10;
    final double step = 0.1;

    final points = <Offset>[];
    for (double x = xMin; x <= xMax; x += step) {
      final double y = x * x - x - 6;
      final double screenX = (x - xMin) * (size.width / (xMax - xMin));
      final double screenY = size.height / 2 - y * 20;
      points.add(Offset(screenX, screenY));
    }

    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }

    for (int i = -10; i <= 10; i++) {
      final double x = (i - xMin) * (size.width / (xMax - xMin));
      textPaint.text = TextSpan(
        text: i.toString(),
        style: TextStyle(color: Colors.black, fontSize: 12),
      );
      textPaint.layout();
      textPaint.paint(
          canvas, Offset(x - textPaint.width / 2, size.height / 2 + 5));
    }

    for (int i = -10; i <= 10; i++) {
      final double y = size.height / 2 - i * 20;
      textPaint.text = TextSpan(
        text: i.toString(),
        style: TextStyle(color: Colors.black, fontSize: 12),
      );
      textPaint.layout();
      textPaint.paint(
          canvas, Offset(size.width / 2 + 5, y - textPaint.height / 2));
    }

    final double startX = -10;
    final double endX = 10;
    final animatedX = startX + (endX - startX) * animationValue;
    final animatedY = animatedX * animatedX - animatedX - 6;
    final screenX = (animatedX - xMin) * (size.width / (xMax - xMin));
    final screenY = size.height / 2 - animatedY * 20;

    if (pointImage != null) {
      final imageSize = 40.0;
      final imageRect = Rect.fromLTWH(
          0, 0, pointImage!.width.toDouble(), pointImage!.height.toDouble());
      final destRect = Rect.fromCenter(
          center: Offset(screenX, screenY),
          width: imageSize,
          height: imageSize);
      canvas.drawImageRect(pointImage!, imageRect, destRect, Paint());
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}






// import 'dart:async';
// import 'dart:typed_data';
// import 'dart:ui' as ui;

// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() => runApp(MyApp());



// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: GraphScreen(), // Set the home to GraphScreen
//     );
//   }
// }





// class GraphScreen extends StatefulWidget {
//   @override
//   _GraphScreenState createState() => _GraphScreenState();
// }
// class _GraphScreenState extends State<GraphScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   ui.Image? pointImage;
//   AudioPlayer _audioPlayer = AudioPlayer();
//   bool _isSoundPlaying = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadImage('assets/images/jesus_christ_ image.jpg').then((image) {
//       setState(() {
//         pointImage = image;
//       });
//     });
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 5),
//     )..addListener(() {
//         final animatedX = _getAnimatedX();
//         final animatedY = animatedX * animatedX - animatedX - 6;
//         if (animatedY <= -6) {
//           if (!_isSoundPlaying) {
//             _playSound();
//             // setState(() {
//             //   _isSoundPlaying = true;
//             // });

//           }
//         } else {
//           //_audioPlayer.stop();
//           // setState(() {
//           //   _isSoundPlaying = false;
//           // });
//         }
//         setState(() {});
//       })
//       ..repeat(reverse: true);
//   }

//   Future<ui.Image> _loadImage(String asset) async {
//     final ByteData data = await rootBundle.load(asset);
//     final Completer<ui.Image> completer = Completer();
//     ui.decodeImageFromList(data.buffer.asUint8List(), (ui.Image img) {
//       completer.complete(img);
//     });
//     return completer.future;
//   }

//   Future<void> _playSound() async {
//     if (_isSoundPlaying) return;
//     await _audioPlayer.play(AssetSource('sound/player.mp3'));
//   }

//   double _getAnimatedX() { 
//     final double startX = -2;
//     final double endX = 3;
//     return startX + (endX - startX) * _animationController.value;
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Graph Plotter'),
//       ),
//       body: CustomPaint(
//         size: Size(double.infinity, double.infinity),
//         painter: GraphPainter(_animationController.value, pointImage),
//       ),
//     );
//   }
// }

// class GraphPainter extends CustomPainter {
//   final double animationValue;
//   final ui.Image? pointImage;

//   GraphPainter(this.animationValue, this.pointImage);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.transparent
//       ..strokeWidth = 2;

//     final axisPaint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 1;

//     final textPaint = TextPainter(
//       textAlign: TextAlign.center,
//       textDirection: TextDirection.ltr,
//     );

//     canvas.drawLine(Offset(size.width / 2, 0), Offset(size.width / 2, size.height), axisPaint);
//     canvas.drawLine(Offset(0, size.height / 2), Offset(size.width, size.height / 2), axisPaint);

//     final double xMin = -10;
//     final double xMax = 10;
//     final double step = 0.1;

//     final points = <Offset>[];
//     for (double x = xMin; x <= xMax; x += step) {
//       final double y = x * x - x - 6;
//       final double screenX = (x - xMin) * (size.width / (xMax - xMin));
//       final double screenY = size.height / 2 - y * 20;
//       points.add(Offset(screenX, screenY));
//     }

//     for (int i = 0; i < points.length - 1; i++) {
//       canvas.drawLine(points[i], points[i + 1], paint);
//     }

//     for (int i = -10; i <= 10; i++) {
//       final double x = (i - xMin) * (size.width / (xMax - xMin));
//       textPaint.text = TextSpan(
//         text: i.toString(),
//         style: TextStyle(color: Colors.black, fontSize: 12),
//       );
//       textPaint.layout();
//       textPaint.paint(canvas, Offset(x - textPaint.width / 2, size.height / 2 + 5));
//     }

//     for (int i = -10; i <= 10; i++) {
//       final double y = size.height / 2 - i * 20;
//       textPaint.text = TextSpan(
//         text: i.toString(),
//         style: TextStyle(color: Colors.black, fontSize: 12),
//       );
//       textPaint.layout();
//       textPaint.paint(canvas, Offset(size.width / 2 + 5, y - textPaint.height / 2));
//     }

//     final double startX = -2;
//     final double endX = 3;
//     final animatedX = startX + (endX - startX) * animationValue;
//     final animatedY = animatedX * animatedX - animatedX - 6;
//     final screenX = (animatedX - xMin) * (size.width / (xMax - xMin));
//     final screenY = size.height / 2 - animatedY * 20;

//     if (pointImage != null) {
//       final imageSize = 20.0;
//       final imageRect = Rect.fromLTWH(0, 0, pointImage!.width.toDouble(), pointImage!.height.toDouble());
//       final destRect = Rect.fromCenter(center: Offset(screenX, screenY), width: imageSize, height: imageSize);
//       canvas.drawImageRect(pointImage!, imageRect, destRect, Paint());
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }