import 'package:airbnb/ui/onboarding/screens/authentication/entities/auth_provider.dart';

class AuthenticationOptionModel {
  AuthenticationOptionModel(
    this.authProvider,
    this.logo, {
    this.onPressed,
  });
  final AuthProvider authProvider;
  final String logo;
  final Function()? onPressed;
}
