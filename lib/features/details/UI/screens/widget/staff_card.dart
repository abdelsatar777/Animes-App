import 'package:flutter/material.dart';

class StaffCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String role;

  const StaffCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // صورة الممثل مع الإطار المتدرج
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 0.5,
                color: Colors.transparent,
              ),
              gradient: const LinearGradient(
                colors: [Colors.cyan, Colors.purpleAccent],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              // تباعد داخلي بين الصورة والإطار
              child: ClipOval(
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 7),

          // النصوص
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "As $role",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
