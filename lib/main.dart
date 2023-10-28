import 'package:airbnb/routes.dart';
import 'package:airbnb/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Airbnb());
}

class Airbnb extends StatelessWidget {
  const Airbnb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Airbnb',
      theme: themeData,
      routerConfig: routes,
    );
  }
}
