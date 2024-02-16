import 'package:books_store/domain/models/book.dart';
import 'package:flutter/material.dart';

class BookInfo extends StatelessWidget {
  Book book;

  BookInfo(this.book);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final title = Text(
      book.title,
      style: const TextStyle(
          color: Colors.black,
          fontFamily: 'Lato',
          fontSize: 20.0,
          fontWeight: FontWeight.bold),
    );

    final subtitle = Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                book.subtitle,
                style: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    fontFamily: 'Lato',
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              ),
            ]));
    final price = Text(
      'Price ${book.price}',
      style: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Colors.green),
    );
    final card = Container(
      width: screenWidth * 0.75,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 10.0,
                offset: Offset(0.0, 5.0))
          ]),
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[title, subtitle, price],
          )),
    );
    return card;
  }
}
