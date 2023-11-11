import 'package:airbnb/screens/authentication/entities/auth_provider.dart';
import 'package:airbnb/shared/assets.dart';
import 'package:airbnb/ui/screens/authentication/email_screen.dart';
import 'package:airbnb/ui/screens/authentication/models/authentication_option_model.dart';
import 'package:airbnb/ui/screens/authentication/phone_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthenticationOptions extends StatelessWidget {
  const AuthenticationOptions({super.key, required this.authProvider});
  final AuthProvider authProvider;
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final List<AuthenticationOptionModel> authOptions = [
      AuthenticationOptionModel(
        AuthProvider.email,
        Assets.email,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const EmailScreen(),
          ),
        ),
      ),
      AuthenticationOptionModel(
        AuthProvider.phone,
        Assets.phone,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const PhoneScreen(),
          ),
        ),
      ),
      AuthenticationOptionModel(AuthProvider.facebook, Assets.facebook),
      AuthenticationOptionModel(AuthProvider.google, Assets.google),
      AuthenticationOptionModel(AuthProvider.apple, Assets.apple),
    ];

    authOptions.removeWhere((model) => model.authProvider == authProvider);

    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                l10n.or,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const Expanded(
                child: Divider(
              height: 40.0,
            )),
          ],
        ),
        ...List.generate(
          authOptions.length,
          (index) {
            final authOption = authOptions[index];
            final providerName = authOption.authProvider.name[0].toUpperCase() +
                authOption.authProvider.name.substring(1);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: OutlinedButton(
                onPressed: authOption.onPressed,
                child: Row(
                  children: [
                    Image.asset(
                      authOption.logo,
                      height: 25.0,
                      width: 25.0,
                    ),
                    const Spacer(),
                    Text(l10n.authenticatoinProvidersButtonLable(providerName)),
                    const Spacer(),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
