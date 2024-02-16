import 'package:books_store/config/provider/book_provider.dart';
import 'package:books_store/domain/models/book.dart';
import 'package:books_store/ui/widgets/book_photo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookList extends StatefulWidget {
  String search;

  BookList(this.search);

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    final providerBooks = Provider.of<BookProvider>(context);

    return Scaffold(
      body: Stack(children: [
        Container(
            margin: const EdgeInsets.only(top: 30.0, bottom: 10.0),
            child: FutureBuilder<List<Book>>(
              future: providerBooks.bookUseCase.getBooks(widget.search),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: _bookList(snapshot.data),
                  );
                } else if (snapshot.hasError) {
                  return Text('$snapshot.hasError');
                }
                return const Center(
                    child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator()));
              },
            )),
        Column(
          children: [
            Row(children: [
              Container(
                padding: const EdgeInsets.only(top: 15.0, left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.black,
                        size: 45,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ),
            ]),
          ],
        ),
      ]),
    );
  }

  List<Widget> _bookList(List<Book>? data) {
    List<Widget> books = [];
    for (var book in data!) {
      books.add(Column(
        children: [BookPhoto(book)],
      ));
    }
    return books;
  }
}
