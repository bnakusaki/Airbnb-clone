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
  int animationImageIndex = 0;
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted && animationImageIndex < 2) {
        setState(() => animationImageIndex++);
        return;
      } else if (mounted) {
        context.go('/phone');
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

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 172, 172, 172),
      body: Center(
        child: Animate(
          effects: const [FadeEffect()],
          child: Image.asset(
            animationImages[animationImageIndex],
            height: 50,
            width: 50,
          ),
        ),
      ),
    );
  }
}
