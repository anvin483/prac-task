import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Action Buttons',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: ActionButtonsScreen(),
    );
  }
}

class ActionButtonsScreen extends StatefulWidget {
  @override
  State<ActionButtonsScreen> createState() => _ActionButtonsScreenState();
}

class _ActionButtonsScreenState extends State<ActionButtonsScreen> {
  double _scale = 1.0; // scale factor for animation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Animated Action Buttons'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildAnimatedButton(
                icon: Icons.call,
                color: Colors.green,
                label: 'Call',
                onPressed: () => print('📞 Call button pressed'),
              ),
              _buildAnimatedButton(
                icon: Icons.message,
                color: Colors.blue,
                label: 'Message',
                onPressed: () => print('💬 Message button pressed'),
              ),
              _buildAnimatedButton(
                icon: Icons.email,
                color: Colors.red,
                label: 'Email',
                onPressed: () => print('📧 Email button pressed'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedButton({
    required IconData icon,
    required Color color,
    required String label,
    required VoidCallback onPressed,
  }) {
    return StatefulBuilder(
      builder: (context, setInnerState) {
        return GestureDetector(
          onTapDown: (_) => setInnerState(() => _scale = 0.9),
          onTapUp: (_) {
            setInnerState(() => _scale = 1.0);
            onPressed();
          },
          onTapCancel: () => setInnerState(() => _scale = 1.0),
          child: AnimatedScale(
            scale: _scale,
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Ink(
                  decoration: ShapeDecoration(
                    color: color.withOpacity(0.1),
                    shape: const CircleBorder(),
                  ),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    splashColor: color.withOpacity(0.3),
                    onTap: onPressed,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(icon, color: color, size: 30),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
