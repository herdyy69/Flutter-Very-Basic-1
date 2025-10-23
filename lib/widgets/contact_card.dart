import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final String phone;
  final String email;
  final String instagram;

  const ContactCard({
    super.key,
    required this.phone,
    required this.email,
    required this.instagram,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Information',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildContactRow(Icons.phone, 'Phone', phone),
            const SizedBox(height: 12),
            _buildContactRow(Icons.email, 'Email', email),
            const SizedBox(height: 12),
            _buildContactRow(Icons.camera_alt, 'Instagram', instagram),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSocialButton('Call', Icons.phone, Colors.green),
                _buildSocialButton('Message', Icons.message, Colors.blue),
                _buildSocialButton('Share', Icons.share, Colors.orange),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton(String label, IconData icon, Color color) {
    return Builder(
      builder: (context) => ElevatedButton.icon(
        onPressed: () {
          // Static action - no state change needed
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$label button pressed'),
              duration: const Duration(seconds: 1),
            ),
          );
        },
        icon: Icon(icon, size: 16),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),
    );
  }
}
