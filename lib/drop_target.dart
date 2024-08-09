import 'package:flutter/material.dart';

class DropTarget extends StatefulWidget {
  final Color initialColor;
  final Color hoverColor;
  final Color acceptColor;
  final String initialText;

  const DropTarget({
    Key? key,
    required this.initialColor,
    required this.hoverColor,
    required this.acceptColor,
    required this.initialText,
  }) : super(key: key);

  @override
  DropTargetState createState() => DropTargetState();
}

class DropTargetState extends State<DropTarget> {
  late Color dropColor;
  late String dropText;

  @override
  void initState() {
    super.initState();
    dropColor = widget.initialColor;
    dropText = widget.initialText;
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<Color>(
      onMove: (details) => print(details.data),
      onWillAcceptWithDetails: (details) {
        setState(() {
          dropColor = widget.hoverColor; // Change color while hovering
        });
        return true;
      },
      onAccept: (color) {
        setState(() {
          dropColor = widget.acceptColor; // Set final color on accept
          dropText = "The Drop is Done"; // Change text after drop
        });
      },
      onLeave: (data) {
        setState(() {
          dropColor = widget.initialColor; // Reset color when dragging leaves
        });
      },
      builder: (context, candidateData, rejectedData) => Container(
        height: 100,
        width: 200,
        decoration: BoxDecoration(
          color: dropColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Text(
            dropText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
