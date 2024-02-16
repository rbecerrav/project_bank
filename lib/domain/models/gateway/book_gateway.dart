
import 'package:books_store/domain/models/book.dart';

abstract class BookGateway {
  Future<List<Book>> getBooks(String search);
}