import 'package:airbnb/screens/authentication/entities/auth_provider.dart';

class AuthProvidersModel {
  AuthProvidersModel(
    this.authProvider,
    this.logo, {
    this.onPressed,
  });
  final AuthProvider authProvider;
  final String logo;
  final Function()? onPressed;
}
