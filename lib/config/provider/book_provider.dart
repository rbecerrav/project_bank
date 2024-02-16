import 'package:books_store/domain/use_case/book_use_case.dart';
import 'package:flutter/material.dart';

class BookProvider extends ChangeNotifier{
  final BookUseCase bookUseCase;

  BookProvider(this.bookUseCase);
}