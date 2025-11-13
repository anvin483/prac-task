import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: AnimatedColorToggler(),
    debugShowCheckedModeBanner: false,
  ));
}

class AnimatedColorToggler extends StatefulWidget {
  const AnimatedColorToggler({super.key});

  @override
  State<AnimatedColorToggler> createState() => _AnimatedColorTogglerState();
}

class _AnimatedColorTogglerState extends State<AnimatedColorToggler> {
  final List<Color> colors = [
    Colors.white,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.pink,
  ];

  final List<String> colorNames = [
    "White",
    "Blue",
    "Green",
    "Yellow",
    "Pink",
  ];

  int currentIndex = 0;

  void _toggleColor() {
    setState(() {
      currentIndex = (currentIndex + 1) % colors.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[currentIndex],
      appBar: AppBar(
        title: const Text("Animated Color Toggler"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 600),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: Text(
            "Current Color: ${colorNames[currentIndex]}",
            key: ValueKey<String>(colorNames[currentIndex]),
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleColor,
        backgroundColor: Colors.teal,
        child: const Icon(Icons.color_lens),
      ),
    );
  }
}
