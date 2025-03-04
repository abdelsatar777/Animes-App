import 'package:animes_app/core/resource/app_assets.dart';
import 'package:animes_app/features/details/data/model/staff_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StaffCard extends StatelessWidget {
  final StaffModel staffModel;

  const StaffCard({super.key, required this.staffModel});

  Future<void> _launchURL(BuildContext context) async {
    final Uri url = Uri.parse(
      "https://myanimelist.net/people/${staffModel.personModel.malId}",
    );
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
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchURL(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة الشخص
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 0.5, color: Colors.transparent),
                gradient: const LinearGradient(
                    colors: [Colors.cyan, Colors.purpleAccent]),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: ClipOval(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    // تأكيد الحواف المستديرة
                    child: Image.network(
                      staffModel.personModel.imageUrlModel.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                          AppAssets.defaultImage,
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),

            // بيانات الشخص
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    staffModel.personModel.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1, // تحديد أقصى عدد من السطور
                    overflow:
                        TextOverflow.ellipsis, // إضافة "..." عند تجاوز النص
                  ),
                  const SizedBox(height: 4),

                  // عرض أول 3 قيم فقط من الـ positions
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: staffModel.positions.take(3).map((position) {
                      return Text(
                        "As $position",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
