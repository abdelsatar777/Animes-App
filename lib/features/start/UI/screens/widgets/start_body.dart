import 'package:animes_app/features/start/UI/screens/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class StartBody extends StatelessWidget {
  const StartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/img/start 1.jpeg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.7),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Watch Everything you Want for Free!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),
              SizedBox(height: 50),
              CustomButton(
                onPressed: () => Navigator.pushNamed(context, "home_screen"),
                title: "Enter now",
              ),
            ],
          ),
        )
      ],
    );
  }
}
