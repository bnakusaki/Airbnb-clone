import 'package:airbnb/ui/onboarding/screens/authentication/phone_screen.dart';
import 'package:airbnb/ui/onboarding/screens/loading_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoadingScreen(),
    ),
    GoRoute(
      path: '/authentication',
      builder: (context, state) => const PhoneScreen(),
    )
  ],
);
