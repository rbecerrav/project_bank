import 'dart:convert';

import 'package:books_store/domain/models/book.dart';
import 'package:books_store/domain/models/gateway/book_gateway.dart';
import 'package:http/http.dart' as http;

class RestConsumer extends BookGateway {
  late Future<List<Book>> listBooks;

  @override
  Future<List<Book>> getBooks(String search) async {
    List<Book> books = [];

    Uri url = Uri.parse('https://api.itbook.store/1.0/search/$search');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));

      for (var item in jsonResponse["books"]) {
        books.add(Book(item["title"], item["subtitle"], item["isbn13"],
            item["price"], item["image"], item["url"]));
      }

      return books;
    } else {
      throw Exception("Error, try with Other word");
    }
  }
}
