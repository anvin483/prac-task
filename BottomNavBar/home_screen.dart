import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.home, color: Colors.teal, size: 80),
          SizedBox(height: 10),
          Text(
            "Welcome Home 🏠",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6),
          Text("Explore your app from here!",
              style: TextStyle(color: Colors.black54))
        ],
      ),
    );
  }
}
