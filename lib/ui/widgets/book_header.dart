import 'package:books_store/ui/widgets/text_input.dart';
import 'package:flutter/material.dart';

import 'book_list.dart';
import 'button_purple.dart';

class BookHeader extends StatefulWidget {
  @override
  State createState() {
    return _BookHeader();
  }
}

class _BookHeader extends State<BookHeader> {
  @override
  Widget build(BuildContext context) {
    final controllerDescriptionSearch = TextEditingController();
    return Scaffold(
        body: Stack(children: <Widget>[
      ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: TextInput(
                hintText: "Search",
                inputType: null,
                maxLines: 1,
                controller: controllerDescriptionSearch),
          ),
          ButtonPurple(
              buttonText: "Search",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BookList(controllerDescriptionSearch.text)));
              }),
        ],
      ),
    ]));
  }
}
