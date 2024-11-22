import 'dart:async';

class Repository {
  final _bookmarksController = StreamController<List<String>>.broadcast();
  final _groceriesController = StreamController<List<String>>.broadcast();

  final List<String> _bookmarks = [];
  final List<String> _groceries = [];

  Stream<List<String>> get bookmarksStream => _bookmarksController.stream;
  Stream<List<String>> get groceriesStream => _groceriesController.stream;

  void addBookmark(String bookmark) {
    _bookmarks.add(bookmark);
    _bookmarksController.sink.add(_bookmarks);
  }

  void removeBookmark(String bookmark) {
    _bookmarks.remove(bookmark);
    _bookmarksController.sink.add(_bookmarks);
  }

  void addGrocery(String grocery) {
    _groceries.add(grocery);
    _groceriesController.sink.add(_groceries);
  }

  void removeGrocery(String grocery) {
    _groceries.remove(grocery);
    _groceriesController.sink.add(_groceries);
  }

  void dispose() {
    _bookmarksController.close();
    _groceriesController.close();
  }
}
