import 'package:flutter/material.dart';

class Genre extends StatefulWidget {
  const Genre({Key? key}) : super(key: key);

  @override
  State<Genre> createState() => _GenreState();
}

class _GenreState extends State<Genre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('장르 구분'),
      ),
    );
  }
}