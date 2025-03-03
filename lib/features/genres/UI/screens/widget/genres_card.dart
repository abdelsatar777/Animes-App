import 'package:flutter/material.dart';

class GenresCard extends StatelessWidget {
  final String title;
  final double fontSize;

  const GenresCard({
    super.key,
    required this.title,
    this.fontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.white,
          letterSpacing: 3,
        ),
      ),
    );
  }
}
