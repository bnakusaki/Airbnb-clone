import 'dart:async';

import 'package:airbnb/ui/onboarding/assets/onboarding_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  int animateImageIndex = 0;
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (mounted) {
        if (animateImageIndex < 2) {
          setState(() {
            animateImageIndex++;
          });
        } else {
          context.go('/authentication');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> animationImages = [
      OnBoardingAssets.onboardingImage1,
      OnBoardingAssets.onboardingImage2,
      OnBoardingAssets.onboardingImage3,
    ];
    debugPrint('snap');
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 172, 172, 172),
      body: Builder(
        builder: (context) {
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
