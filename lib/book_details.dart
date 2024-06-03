import 'package:flutter/material.dart';
import 'package:project/books.dart';

class BookDetailsView extends StatelessWidget {
  final BookModel model ;
  const BookDetailsView({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(model.title),),
    );
  }
}
