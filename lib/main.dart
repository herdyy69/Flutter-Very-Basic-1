import 'package:flutter/material.dart';
import 'widgets/profile_card.dart';
import 'widgets/info_card.dart';
import 'widgets/contact_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile & Contact App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile & Contact App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            // StatefulWidget - ProfileCard dengan counter
            ProfileCard(
              name: 'Herdyansah',
              email: 'herdyansah203@gmail.com',
              imageUrl: '',
              bio:
                  'Flutter Developer passionate about creating beautiful mobile apps. Love coding and coffee! ☕',
            ),
            // StatelessWidget - InfoCard untuk informasi statis
            InfoCard(
              location: 'Bandung, Indonesia',
              joinDate: 'January 2023',
              website: 'herdyansah.dev',
              bio:
                  'Passionate about Flutter development and creating amazing user experiences.',
            ),
            // StatelessWidget - ContactCard untuk kontak statis
            ContactCard(
              phone: '085155338717',
              email: 'herdyansah203@gmail.com',
              instagram: 'herdyy69',
            ),
          ],
        ),
      ),
    );
  }
}
