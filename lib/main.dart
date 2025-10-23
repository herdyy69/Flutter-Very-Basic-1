import 'package:flutter/material.dart';
import 'widgets/profile_card.dart';
import 'widgets/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile & Todo App',
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
        title: const Text('Profile & Todo App'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileCard(
              name: 'John Doe',
              email: 'john.doe@example.com',
              imageUrl: '',
              bio:
                  'Flutter Developer passionate about creating beautiful mobile apps. Love coding and coffee! ☕',
            ),
            SizedBox(height: 400, child: const TodoList()),
          ],
        ),
      ),
    );
  }
}
