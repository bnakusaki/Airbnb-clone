import 'package:airbnb/screens/authentication/email_screen.dart';
import 'package:airbnb/screens/authentication/phone_screen.dart';
import 'package:airbnb/screens/authentication/profile_setup_screen.dart';
import 'package:airbnb/screens/loading_screen.dart';
import 'package:airbnb/shared/navigation/route_names.dart';
import 'package:go_router/go_router.dart';

GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: RouteNames.loadingScreen,
      builder: (context, state) => const LoadingScreen(),
    ),
    GoRoute(
      path: '/phone',
      name: RouteNames.phoneScreen,
      builder: (context, state) => const PhoneScreen(),
    ),
    GoRoute(
        path: '/email',
        name: RouteNames.emailScreen,
        builder: (context, state) => const EmailScreen(),
        routes: [
          GoRoute(
            path: 'info',
            name: RouteNames.profileSetupScreen,
            builder: (context, state) => const ProfileSetupScreen(),
          ),
        ]),
  ],
);
