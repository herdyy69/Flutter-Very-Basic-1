import 'package:flutter/material.dart';
import '../widgets/profile/profile_card.dart';
import '../widgets/profile/info_card.dart';
import '../widgets/profile/contact_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // StatefulWidget - ProfileCard dengan counter
              const ProfileCard(
                name: 'Herdyansah',
                email: 'herdyansah203@gmail.com',
                imageUrl: '',
                bio:
                    'Flutter Developer passionate about creating beautiful mobile apps. Love coding and coffee! ☕',
              ),
              // StatelessWidget - InfoCard untuk informasi statis
              const InfoCard(
                location: 'Bandung, Indonesia',
                joinDate: 'January 2023',
                website: 'herdyansah.dev',
                bio:
                    'Passionate about Flutter development and creating amazing user experiences.',
              ),
              // StatelessWidget - ContactCard untuk kontak statis
              const ContactCard(
                phone: '085155338717',
                email: 'herdyansah203@gmail.com',
                instagram: 'herdyy69',
              ),
              const SizedBox(height: 80), // Space for bottom navigation
            ],
          ),
        ),
      ),
    );
  }
}
