import 'package:flutter/material.dart';
import 'repository.dart';
import 'bookmark_screen.dart';
import 'groceries_screen.dart';

class HomeScreen extends StatelessWidget {
  final Repository repository;

  const HomeScreen({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text('Bookmarks'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookmarksScreen(repository: repository),
                ),
              );
            },
          ),
          ElevatedButton(
            child: const Text('Groceries'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GroceriesScreen(repository: repository),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
