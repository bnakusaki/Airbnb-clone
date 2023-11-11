import 'package:airbnb/screens/authentication/entities/auth_provider.dart';
import 'package:airbnb/screens/authentication/models/authe_providers_model.dart';
import 'package:airbnb/shared/assets.dart';
import 'package:airbnb/shared/navigation/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class AuthProviders extends StatelessWidget {
  const AuthProviders({super.key, required this.authProvider});
  final AuthProvider authProvider;
  @override
  Widget build(BuildContext context) {
    final List<AuthProvidersModel> authProviders = [
      AuthProvidersModel(
        AuthProvider.email,
        Assets.email,
        onPressed: () => context.goNamed(RouteNames.emailScreen),
      ),
      AuthProvidersModel(
        AuthProvider.phone,
        Assets.phone,
        onPressed: () => context.goNamed(RouteNames.phoneScreen),
      ),
      AuthProvidersModel(AuthProvider.facebook, Assets.facebook),
      AuthProvidersModel(AuthProvider.google, Assets.google),
      AuthProvidersModel(AuthProvider.apple, Assets.apple),
    ];

    authProviders.removeWhere((model) => model.authProvider == authProvider);

    return Column(
      children: [
        Row(
          children: [
            const Expanded(child: Divider()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                AppLocalizations.of(context)!.or,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const Expanded(
              child: Divider(
                height: 40.0,
              ),
            ),
          ],
        ),
        ...List.generate(
          authProviders.length,
          (index) {
            final authOption = authProviders[index];
            final providerName = authOption.authProvider.toTitle;
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
                    Text(
                      AppLocalizations.of(context)!
                          .authenticatoinProvidersButtonLable(providerName),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
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

extension on AuthProvider {
  String get toTitle => name[0].toUpperCase() + name.substring(1).toLowerCase();
}
