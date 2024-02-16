import 'package:books_store/config/provider/book_provider.dart';
import 'package:books_store/domain/use_case/book_use_case.dart';
import 'package:books_store/infrastructure/rest_consumer/rest_consumer.dart';
import 'package:books_store/ui/widgets/book_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => BookProvider(BookUseCase(RestConsumer())))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Project Bank',
        home: BookHeader(),
      ),
    );
  }
}
