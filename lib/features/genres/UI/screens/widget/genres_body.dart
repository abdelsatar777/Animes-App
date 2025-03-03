import 'package:flutter/material.dart';

import 'genres_card.dart';

class GenresBody extends StatefulWidget {
  const GenresBody({super.key});

  @override
  State<GenresBody> createState() => _GenresBodyState();
}

class _GenresBodyState extends State<GenresBody> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      // مهم حتى لا يأخذ مساحة غير محدودة داخل Column
      physics: const NeverScrollableScrollPhysics(),
      // منع التمرير المستقل داخل الشبكة
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // عدد الأعمدة في الشبكة
        childAspectRatio: 3, // نسبة العرض إلى الارتفاع
        crossAxisSpacing: 10, // التباعد الأفقي
        mainAxisSpacing: 10, // التباعد الرأسي
      ),
      itemCount: 5,
      itemBuilder: (context, index) {
        return GenresCard(title: "Test", fontSize: 30);
      },
    );
  }
}
