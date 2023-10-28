import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Ionicons.close),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        children: [
          Text(
            'Log in or sign up to Airbnb',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30.0, bottom: 15.0),
            child: Placeholder(
              fallbackHeight: 100,
            ),
          ),
          Text(
            'We\'ll call or text you to confirm your number. Standard message and data rates apply',
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
