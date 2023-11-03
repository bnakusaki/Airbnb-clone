import 'package:airbnb/ui/onboarding/screens/authentication/email_screen.dart';
import 'package:airbnb/ui/onboarding/screens/authentication/phone_screen.dart';
import 'package:airbnb/ui/onboarding/screens/authentication/profile_setup_screen.dart';
import 'package:airbnb/ui/onboarding/screens/loading_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoadingScreen(),
    ),
    GoRoute(
      path: '/phone',
      builder: (context, state) => const PhoneScreen(),
    ),
    GoRoute(
      path: '/email',
      builder: (context, state) => const EmailScreen(),
    ),
    GoRoute(
      path: '/info',
      builder: (context, state) => const ProfileSetupScreen(),
    ),
  ],
);
