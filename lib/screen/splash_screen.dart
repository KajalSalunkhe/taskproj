import 'package:flutter/material.dart';
import 'package:taskproj/screen/main_sreen.dart';
import 'package:taskproj/widgets/top_titles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    });
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TopTitles(
                title: "Welcome",
                subTitle: "Add items from using the App",
              ),
              SizedBox(height: 12),
              Image.asset(
                'assets/images/splash.png',
                height: 150,
                width: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
