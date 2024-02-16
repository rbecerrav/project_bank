

import 'package:books_store/domain/models/gateway/book_gateway.dart';

import '../models/book.dart';
import 'cache_use_case.dart';

class BookUseCase {
  final BookGateway _bookGateway;
  late CacheUseCase cacheUseCase = CacheUseCase();

  BookUseCase(this._bookGateway);
  Future<List<Book>> getBooks(String search){
    List<Book>? found =cacheUseCase.findCache(search);
    if (found!=null){
      print(' no inrgese al else');
      return Future(() => found);
    }else {
      print('ingrese al else');
      Future<List<Book>> result =_bookGateway.getBooks(search);
      saveData(result, search);
      return result;
    }
  }
  void saveData (Future<List<Book>> books, String key) async {
    List<Book> value = await books;
    cacheUseCase.saveCache(key, value);
  }
}