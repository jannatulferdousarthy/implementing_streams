import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'repository.dart';

void main() {
  final repository = Repository();

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final Repository repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(repository: repository),
    );
  }
}
