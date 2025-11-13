import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: TabBarEnhancedDemo(),
    debugShowCheckedModeBanner: false,
  ));
}

class TabBarEnhancedDemo extends StatelessWidget {
  const TabBarEnhancedDemo({super.key});

  final List<Map<String, String>> chats = const [
    {"name": "Alice", "message": "Hey! How are you?"},
    {"name": "Bob", "message": "Let's meet tomorrow."},
    {"name": "Charlie", "message": "Check this out!"},
    {"name": "David", "message": "Good morning!"},
    {"name": "Eve", "message": "Call me when free."},
  ];

  final List<Map<String, String>> statuses = const [
    {"name": "Alice", "time": "Today, 8:00 AM"},
    {"name": "Bob", "time": "Yesterday, 5:30 PM"},
    {"name": "Charlie", "time": "Yesterday, 2:15 PM"},
    {"name": "David", "time": "Today, 7:45 AM"},
    {"name": "Eve", "time": "Today, 9:20 AM"},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("TabBar Chat/Status Demo"),
          backgroundColor: Colors.teal,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.chat), text: "Chats"),
              Tab(icon: Icon(Icons.info), text: "Status"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Chats Tab
            ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Text(chats[index]['name']![0]),
                  ),
                  title: Text(chats[index]['name']!),
                  subtitle: Text(chats[index]['message']!),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                );
              },
            ),

            // Status Tab
            ListView.builder(
              itemCount: statuses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Text(statuses[index]['name']![0]),
                  ),
                  title: Text(statuses[index]['name']!),
                  subtitle: Text(statuses[index]['time']!),
                  trailing: const Icon(Icons.circle, color: Colors.green, size: 12),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
