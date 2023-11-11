import 'package:airbnb/screens/authentication/entities/auth_provider.dart';
import 'package:airbnb/screens/authentication/widgets/authentication_options.dart';
import 'package:airbnb/shared/navigation/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  int? focus;
  FocusNode emailFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        FocusNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Ionicons.close),
          ),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.authenticationScreenTitle,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        width: emailFocusNode.hasFocus ? 1.5 : 1.0,
                        color: emailFocusNode.hasFocus ? colorScheme.scrim : colorScheme.secondary,
                      ),
                    ),
                    child: TextFormField(
                      style: const TextStyle(fontWeight: FontWeight.w300),
                      focusNode: emailFocusNode,
                      onTap: () => setState(() {}),
                      decoration: InputDecoration(
                        label: Text(l10n.emailTextFieldLabel),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: colorScheme.secondary,
                      cursorWidth: 0.5,
                    ),
                  ),
                ),
                FilledButton(
                  onPressed: () => context.goNamed(RouteNames.profileSetupScreen),
                  child: Text(
                    l10n.phoneAuthenticationScreenContinueButtonLabel,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: colorScheme.onPrimary),
                  ),
                ),
                const SizedBox(height: 10.0),
                const AuthProviders(
                  authProvider: AuthProvider.email,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
