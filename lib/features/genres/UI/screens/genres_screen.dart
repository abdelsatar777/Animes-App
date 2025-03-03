import 'package:animes_app/features/genres/UI/screens/widget/genres_body.dart';
import 'package:flutter/material.dart';

class GenresScreen extends StatelessWidget {
  const GenresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Genres"),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: GenresBody(),
    );
  }
}
