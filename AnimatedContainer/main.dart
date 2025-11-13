import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    home: AnimatedShapeContainer(),
    debugShowCheckedModeBanner: false,
  ));
}

class AnimatedShapeContainer extends StatefulWidget {
  const AnimatedShapeContainer({super.key});

  @override
  State<AnimatedShapeContainer> createState() => _AnimatedShapeContainerState();
}

class _AnimatedShapeContainerState extends State<AnimatedShapeContainer> {
  double _width = 120;
  double _height = 120;
  Color _color = Colors.teal;
  double _borderRadius = 20;
  final Random _random = Random();

  void _changeShape() {
    setState(() {
      // Randomize width, height, color, and border radius
      _width = _random.nextDouble() * 200 + 100; // between 100–300
      _height = _random.nextDouble() * 200 + 100;
      _borderRadius = _random.nextBool() ? 100 : 20; // circle or square corners
      _color = Color.fromRGBO(
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Shape Container"),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutBack,
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(_borderRadius),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(3, 3),
              ),
            ],
          ),
          child: const Center(
            child: Text(
              "Tap Me!",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changeShape,
        backgroundColor: Colors.teal,
        child: const Icon(Icons.transform),
      ),
    );
  }
}
