import 'package:flutter/material.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({super.key, required TableBorder border, required List<TableRow> children});
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Function Table'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FunctionTable(), // Use a different name for the custom table widget
        ),
      ),
    );
  }
}

class FunctionTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: [
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'x',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'f(x)',
                style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ),
          ],
        ),
        for (int x = -10; x <= 10; x++)
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(x.toString()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text((3 * x + 7).toString()),
              ),
            ],
          ),
      ],
    );
  }
}