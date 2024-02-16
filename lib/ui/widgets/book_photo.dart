import 'package:books_store/domain/models/book.dart';
import 'package:books_store/ui/widgets/book_info.dart';
import 'package:flutter/material.dart';

class BookPhoto extends StatelessWidget {
  Book book;

  BookPhoto(this.book);

  @override
  Widget build(BuildContext context) {
    final photoBook = Container(
      margin: const EdgeInsets.only(top: 20.0, bottom: 70.0),
      height: 350.0,
      width: 300,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(book.image)),
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          color: Colors.grey,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.white, blurRadius: 10.0, offset: Offset(0.0, 5.0))
          ]),
    );
    return Stack(
      alignment: const Alignment(0.0, 1.1),
      children: <Widget>[photoBook, BookInfo(book)],
    );
  }
}
