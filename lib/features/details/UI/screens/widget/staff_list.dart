import 'package:animes_app/features/details/UI/manager/Staff/staff_cubit.dart';
import 'package:animes_app/features/details/UI/manager/Staff/staff_state.dart';
import 'package:animes_app/features/details/UI/screens/widget/staff_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StaffList extends StatelessWidget {
  const StaffList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StaffCubit, StaffState>(
      builder: (context, state) {
        if (state is SuccessState) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            // منع التمرير الداخلي
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 350,
              crossAxisSpacing: 7,
              mainAxisSpacing: 7,
              childAspectRatio: 1.8, // ✅ تحسين نسبة العرض للارتفاع
            ),
            itemCount: state.staff.length,
            itemBuilder: (context, index) {
              return StaffCard(staffModel: state.staff[index]);
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
