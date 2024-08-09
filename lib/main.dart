import 'package:flutter/material.dart';
import 'draggable_item.dart';
import 'drop_target.dart';

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

class DragAndDropExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text('Drag and Drop'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DraggableItem.draggableItem(color: Colors.red, text: 'Drag here'),
            SizedBox(height: 50),
            DropTarget(
              initialColor: Colors.lightBlueAccent,
              hoverColor: Colors.lightBlue,
              acceptColor: Colors.teal,
              initialText: "Drop here",
            ),
            SizedBox(height: 20),
            DropTarget(
              initialColor: Colors.orangeAccent,
              hoverColor: Colors.deepOrange,
              acceptColor: Colors.orange,
              initialText: "Drop here",
            ),
          ],
        ),
      ),
    );
  }
}
