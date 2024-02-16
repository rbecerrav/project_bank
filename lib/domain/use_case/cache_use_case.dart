import 'package:books_store/domain/models/book.dart';

class CacheUseCase {
  Map<String, List<Book>> _memory = {};

  List<Book>? findCache(String key) {
    if (_memory[key] != null) {
      return _memory[key];
    } else {
      return null;
    }
  }

  void saveCache(String key, List<Book> list) {
    Map<String, List<Book>> value = {key: list};
    int lengthList = _memory.length;
    if (lengthList >= 5) {
      List<String> delete = [];
      _memory.forEach((key, value) {
        delete.add(key);
      });
      _memory.remove(delete[0]);
    }
    _memory.addAll(value);
    print('Cache');
    _memory.forEach((key, value) {
      print(key);
    });
  }
}
