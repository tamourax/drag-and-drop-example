import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DragAndDropExample(),
    );
  }
}

class DragAndDropExample extends StatefulWidget {
  @override
  _DragAndDropExampleState createState() => _DragAndDropExampleState();
}

class _DragAndDropExampleState extends State<DragAndDropExample> {
  Color dropColor1 = Colors.green;
  Color dropColor2 = Colors.brown;
  String dropText1 = "Drop here";
  String dropText2 = "Drop here";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Drag and Drop'),
      ),
      body: Column(
        children: [
          Draggable<Color>(
            data: Colors.red,
            feedback: Opacity(
              opacity: 0.5,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
                child: const Center(
                  child: Text('Dragging...',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ),
              ),
            ),
            childWhenDragging: Opacity(
              opacity: 0.5,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: const Center(
                  child: Text('Dragging...',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ),
              ),
            ),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red,
              child: const Center(
                child: Text('Drag here', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          SizedBox(height: 100),
          DragTarget<Color>(
            onMove: (details) => print(details.data),
            onWillAcceptWithDetails: (details) {
              setState(() {
                dropColor1 = Colors.blue; // Change color while hovering
              });
              return true;
            },
            onAccept: (color) {
              setState(() {
                dropColor1 = Colors.cyan; // Set final color on accept
                dropText1 = "The Drop is Done"; // Change text after drop
              });
            },
            onLeave: (data) {
              setState(() {
                dropColor1 = Colors.green; // Reset color when dragging leaves
              });
            },
            builder: (context, candidateData, rejectedData) => Container(
              height: 100,
              width: 100,
              color: dropColor1,
              child: Center(
                child: Text(dropText1,
                    style: const TextStyle(color: Colors.white)),
              ),
            ),
          ),
          SizedBox(height: 100),
          DragTarget<Color>(
            onMove: (details) => print(details.data),
            onWillAcceptWithDetails: (details) {
              setState(() {
                dropColor2 = Colors.purple; // Change color while hovering
              });
              return true;
            },
            onAccept: (color) {
              setState(() {
                dropColor2 = Colors.pink; // Set final color on accept
                dropText2 = "The Drop is Done"; // Change text after drop
              });
            },
            onLeave: (data) {
              setState(() {
                dropColor2 = Colors.brown; // Reset color when dragging leaves
              });
            },
            builder: (context, candidateData, rejectedData) => Container(
              height: 100,
              width: 100,
              color: dropColor2,
              child: Center(
                child: Text(dropText2,
                    style: const TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
