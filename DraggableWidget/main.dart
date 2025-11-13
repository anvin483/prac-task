import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MultiColorDragDrop(),
    debugShowCheckedModeBanner: false,
  ));
}

class MultiColorDragDrop extends StatefulWidget {
  const MultiColorDragDrop({super.key});

  @override
  State<MultiColorDragDrop> createState() => _MultiColorDragDropState();
}

class _MultiColorDragDropState extends State<MultiColorDragDrop> {
  Color targetColor = Colors.grey.shade300;
  String targetText = "Drop a Color Box";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Draggable & DragTarget (Multi-Color)"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "🎨 Drag any color box to the target below",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),

          // 🟥🟩🟦 Row of draggable color boxes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDraggableBox(Colors.red, "Red"),
              _buildDraggableBox(Colors.green, "Green"),
              _buildDraggableBox(Colors.blue, "Blue"),
            ],
          ),

          // 🎯 Drop Target Box
          DragTarget<Map<String, dynamic>>(
            onAccept: (data) {
              setState(() {
                targetColor = data['color'];
                targetText = "${data['name']} Dropped!";
              });
            },
            builder: (context, candidateData, rejectedData) {
              return _buildTargetBox(
                candidateData.isEmpty ? targetColor : Colors.tealAccent,
                targetText,
              );
            },
          ),
        ],
      ),
    );
  }

  // 🔹 Draggable color box
  Widget _buildDraggableBox(Color color, String name) {
    return Draggable<Map<String, dynamic>>(
      data: {'color': color, 'name': name},
      feedback: Opacity(
        opacity: 0.8,
        child: _buildColorBox(color, "Dragging..."),
      ),
      childWhenDragging: _buildColorBox(Colors.grey.shade400, "Picked up"),
      child: _buildColorBox(color, name),
    );
  }

  // 🔹 Normal colored box
  Widget _buildColorBox(Color color, String text) {
    return Container(
      width: 100,
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: const Offset(3, 3),
          )
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // 🔹 Drop target box
  Widget _buildTargetBox(Color color, String text) {
    return Container(
      width: 200,
      height: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: const Offset(3, 3),
          )
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
