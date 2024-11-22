import 'package:flutter/material.dart';
import 'repository.dart';

class BookmarksScreen extends StatelessWidget {
  final Repository repository;

  const BookmarksScreen({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bookmarks')),
      body: StreamBuilder<List<String>>(
        stream: repository.bookmarksStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final bookmarks = snapshot.data!;

          return ListView.builder(
            itemCount: bookmarks.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(bookmarks[index]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    repository.removeBookmark(bookmarks[index]);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          repository.addBookmark('Bookmark ${DateTime.now()}');
        },
      ),
    );
  }
}
