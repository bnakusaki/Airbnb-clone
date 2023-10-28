import 'package:airbnb/ui/onboarding/screens/loading_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Airbnb());
}

class Airbnb extends StatelessWidget {
  const Airbnb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Airbnb',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoadingScreen(),
    );
  }
}
