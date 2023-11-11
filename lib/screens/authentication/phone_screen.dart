import 'package:airbnb/screens/authentication/entities/auth_provider.dart';
import 'package:airbnb/screens/authentication/widgets/authentication_options.dart';
import 'package:airbnb/screens/authentication/widgets/country_and_phone_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Ionicons.close),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.authenticationScreenTitle,
                style: textTheme.headlineSmall,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: CountryAndPhoneTextFields(),
              ),
              Text(
                l10n.phoneAuthenticationScreenConfirmationNotice,
                style: textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.scrim),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                child: FilledButton(
                  onPressed: null,
                  child: Text(
                    l10n.phoneAuthenticationScreenContinueButtonLabel,
                    style: textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              const AuthProviders(
                authProvider: AuthProvider.phone,
              )
            ],
          ),
        ),
      ),
    );
  }
}
