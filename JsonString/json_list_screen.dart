import 'package:flutter/material.dart';
import 'dart:convert'; // for json.decode()

class JsonListScreen extends StatefulWidget {
  const JsonListScreen({super.key});

  @override
  State<JsonListScreen> createState() => _JsonListScreenState();
}

class _JsonListScreenState extends State<JsonListScreen> {
  // Step 1: Define a local JSON string
  final String jsonString = '''
  [
    {"name": "Apple", "color": "Red", "emoji": "🍎"},
    {"name": "Banana", "color": "Yellow", "emoji": "🍌"},
    {"name": "Cherry", "color": "Red", "emoji": "🍒"},
    {"name": "Mango", "color": "Orange", "emoji": "🥭"},
    {"name": "Grapes", "color": "Purple", "emoji": "🍇"},
    {"name": "Strawberry", "color": "Red", "emoji": "🍓"},
    {"name": "Pineapple", "color": "Yellow", "emoji": "🍍"},
    {"name": "Watermelon", "color": "Green", "emoji": "🍉"},
    {"name": "Kiwi", "color": "Brown", "emoji": "🥝"},
    {"name": "Orange", "color": "Orange", "emoji": "🍊"}
  ]
  ''';

  // Step 2: Parse JSON string into a list
  late List<dynamic> fruits;

  @override
  void initState() {
    super.initState();
    fruits = json.decode(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        title: const Text("Fruits from JSON 🍎"),
        backgroundColor: Colors.deepOrange,
      ),
      // Step 3: Display using ListView.builder
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          final fruit = fruits[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Text(
                fruit["emoji"],
                style: const TextStyle(fontSize: 28),
              ),
              title: Text(
                fruit["name"],
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Color: ${fruit["color"]}"),
              onTap: () {
                print("Tapped on ${fruit["name"]}");
              },
            ),
          );
        },
      ),
    );
  }
}
