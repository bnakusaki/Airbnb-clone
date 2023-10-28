import 'dart:async';

import 'package:airbnb/ui/onboarding/assets/onboarding_assets.dart';
import 'package:airbnb/ui/onboarding/screens/authentication/authentication_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  int animateImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> animationImages = [
      OnBoardingAssets.onboardingImage1,
      OnBoardingAssets.onboardingImage2,
      OnBoardingAssets.onboardingImage3,
    ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 172, 172, 172),
      body: Builder(
        builder: (context) {
          Timer.periodic(const Duration(seconds: 2), (timer) {
            setState(() {
              if (animateImageIndex < 2) {
                animateImageIndex++;
              } else {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AuthenticationScreen(),
                  ),
                );
              }
            });
          });
          return Center(
            child: Animate(
              effects: const [FadeEffect()],
              child: Image(
                height: 50,
                width: 50,
                image: AssetImage(
                  animationImages[animateImageIndex],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
