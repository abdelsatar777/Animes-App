import 'package:animes_app/features/details/UI/manager/Details/details_cubit.dart';
import 'package:animes_app/features/details/UI/manager/Staff/staff_cubit.dart';
import 'package:animes_app/features/details/UI/screens/widget/custom_button.dart';
import 'package:animes_app/features/details/UI/screens/widget/staff_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../manager/Details/details_state.dart';
import 'detail_anime_card.dart';

class DetailBody extends StatefulWidget {
  final String id;

  const DetailBody({super.key, required this.id});

  @override
  State<DetailBody> createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {
  Future<void> _launchURL(BuildContext context) async {
    final Uri url = Uri.parse("https://myanimelist.net/anime/${widget.id}");
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('لا يمكن فتح الرابط'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<DetailsCubit>().getDetails(id: widget.id);
    context.read<StaffCubit>().getStaff(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state is SuccessState) {
          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: DetailAnimeCard(
                      imgPath: state.details.imageUrlModel.imageUrl,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.details.title,
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow
                                          .ellipsis, // يقطع النص عند تجاوز الحد
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      state.details.year,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 26,
                                  ),
                                  const SizedBox(width: 7),
                                  Text(
                                    state.details.score,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            state.details.synopsis,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                  // قائمة StaffList
                  const SliverToBoxAdapter(child: StaffList()),
                  const SliverToBoxAdapter(child: SizedBox(height: 100)),
                  // تباعد لضمان عدم تغطية المحتوى
                ],
              ),

              // زرار "Watch Now" ثابت في الأسفل
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: CustomButton(
                  onPressed: () => _launchURL(context),
                  title: "Watch Now",
                ),
              ),
            ],
          );
        } else if (state is ErrorState) {
          return Center(child: Text("Error ${state.errorMsg}"));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
