import 'package:animes_app/features/details/UI/screens/widget/detail_body.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String id;

  const DetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DetailBody(id: id));
  }
}
