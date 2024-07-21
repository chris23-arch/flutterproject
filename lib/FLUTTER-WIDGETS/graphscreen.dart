import 'package:flutter/material.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GraphScreen(), // Set the home to GraphScreen
    );
  }
}

class GraphScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Graph Plotter'),
        ),
        body: CustomPaint(
          size: Size(double.infinity, double.infinity),
          painter: GraphPainter(),
        ),
      ),
    );
  }
}

class GraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2;

    final axisPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    final textPaint = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    // Draw x and y axis
    canvas.drawLine(Offset(size.width / 2, 0), Offset(size.width / 2, size.height), axisPaint);
    canvas.drawLine(Offset(0, size.height / 2), Offset(size.width, size.height / 2), axisPaint);

    // Define the range of x values
    final double xMin = -10;
    final double xMax = 10;
    final double step = 0.1;

    // Calculate the points for the graph
    final points = <Offset>[];
    for (double x = xMin; x <= xMax; x += step) {
      final double y = x * x - x - 6;
      final double screenX = (x - xMin) * (size.width / (xMax - xMin));
      final double screenY = size.height / 2 - y * 20; // scale the y values for better visualization
      points.add(Offset(screenX, screenY));
    }

    // Draw the graph
    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }

    // Draw x-axis labels
    for (int i = -10; i <= 10; i++) {
      final double x = (i - xMin) * (size.width / (xMax - xMin));
      textPaint.text = TextSpan(
        text: i.toString(),
        style: TextStyle(color: Colors.black, fontSize: 12),
      );
      textPaint.layout();
      textPaint.paint(canvas, Offset(x - textPaint.width / 2, size.height / 2 + 5));
    }

    // Draw y-axis labels
    for (int i = -10; i <= 10; i++) {
      final double y = size.height / 2 - i * 20;
      textPaint.text = TextSpan(
        text: i.toString(),
        style: TextStyle(color: Colors.black, fontSize: 12),
      );
      textPaint.layout();
      textPaint.paint(canvas, Offset(size.width / 2 + 5, y - textPaint.height / 2));
    }

    // Points to indicate
    final pointsToIndicate = <Map<String, double>>[
      {'x': -2, 'y': 0},
      {'x': -1, 'y': -4},
      {'x': 0, 'y': -6},
      {'x': 1, 'y': -6},
      {'x': 2, 'y': -4},
      {'x': 3, 'y': 0},
    ];

    final pointPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;

    for (var pointData in pointsToIndicate) {
      final screenX = (pointData['x']! - xMin) * (size.width / (xMax - xMin));
      final screenY = size.height / 2 - pointData['y']! * 20;
      final point = Offset(screenX, screenY);

      // Draw the points
      canvas.drawCircle(point, 5, pointPaint);

      //  // Adjust the label offset to space it out from the point
      // final labelOffset = Offset(10, -10);

      // Draw labels for the points
      textPaint.text = TextSpan(
        text: '(${pointData['x']}, ${pointData['y']})',
        style: TextStyle(color: Colors.black, fontSize: 12),
      );
      textPaint.layout();
      textPaint.paint(canvas, Offset(point.dx + 10, point.dy - 10));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}