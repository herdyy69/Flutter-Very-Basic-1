import 'package:flutter/material.dart';
import '../widgets/profile/profile_card.dart';
import '../widgets/profile/movie_stats_card.dart';
import '../widgets/profile/settings_card.dart';

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
              const ProfileCard(
                name: 'Herdyansah',
                email: 'herdyansah203@gmail.com',
                imageUrl: '',
                bio:
                    'Movie enthusiast passionate about discovering great films. Love action, sci-fi, and drama! 🎬',
              ),
              const MovieStatsCard(),
              const SettingsCard(),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
