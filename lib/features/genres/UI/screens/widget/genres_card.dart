import 'package:animes_app/features/genres/data/model/genres_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GenresCard extends StatelessWidget {
  final GenresModel genresModel;

  const GenresCard({super.key, required this.genresModel});

  Future<void> _launchURL(BuildContext context) async {
    final Uri url = Uri.parse(genresModel.url);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('لا يمكن فتح الرابط: ${genresModel.url}'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchURL(context),
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          genresModel.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
