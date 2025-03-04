import 'package:animes_app/features/genres/UI/manager/genres_cubit.dart';
import 'package:animes_app/features/genres/UI/manager/genres_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'genres_card.dart';

class GenresBody extends StatefulWidget {
  const GenresBody({super.key});

  @override
  State<GenresBody> createState() => _GenresBodyState();
}

class _GenresBodyState extends State<GenresBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenresCubit, GenresState>(
      builder: (context, state) {
        if (state is SuccessState) {
          return GridView.builder(
            shrinkWrap: true,
            // حتى لا يأخذ مساحة غير محدودة داخل Column
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200, // أقصى عرض للعنصر، يتكيف مع النص
              childAspectRatio: 2, // تقليل نسبة العرض للارتفاع حتى لا يتمدد
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: state.genres.length,
            itemBuilder: (context, index) {
              return GenresCard(genresModel: state.genres[index]);
            },
          );
        } else if (state is ErrorState) {
          return Center(child: Text("Error ${state.errorMsg}"));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
