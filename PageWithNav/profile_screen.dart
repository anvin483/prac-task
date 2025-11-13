import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 🧍 Profile Avatar
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://cdn.rafled.com/anime-icons/images/56d75695c855e857e22fcfff5e3ea327261f1f2581f45f75e897b2aca3106b05.jpg'),
            ),
            const SizedBox(height: 15),

            // 👤 Name
            const Text(
              'Anvin Jose',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),

            // 📧 Email
            const Text(
              'anvinjose333@gmail.com',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // 📝 Bio
            const Text(
              'Software Developer | Cyber Enthusiast | Tech Explorer ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
            const SizedBox(height: 30),

            // 🌟 Info cards
            _buildInfoCard(Icons.phone, 'Phone', '+91 9619608652'),
            _buildInfoCard(Icons.location_on, 'Location', 'Kerala, India'),
            _buildInfoCard(Icons.cake, 'Birthday', 'May 16, 2005'),
            const SizedBox(height: 25),

            // ⚙️ Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  icon: Icons.edit,
                  label: 'Edit Profile',
                  color: Colors.blue,
                  onTap: () => print('Edit Profile pressed'),
                ),
                _buildActionButton(
                  icon: Icons.logout,
                  label: 'Logout',
                  color: Colors.red,
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Helper widget for info rows
  static Widget _buildInfoCard(IconData icon, String title, String value) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.indigo),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(value),
      ),
    );
  }

  // ✅ Helper widget for bottom action buttons
  static Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: onTap,
          child: Ink(
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(16),
            child: Icon(icon, color: color, size: 28),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(color: color, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
