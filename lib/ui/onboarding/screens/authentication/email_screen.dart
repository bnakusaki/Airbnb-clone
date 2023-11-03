import 'package:airbnb/ui/onboarding/screens/authentication/entities/auth_provider.dart';
import 'package:airbnb/ui/onboarding/screens/authentication/profile_setup_screen.dart';
import 'package:airbnb/ui/onboarding/screens/authentication/widgets/authentication_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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

    return GestureDetector(
      onTap: () {
        FocusNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const IconButton(
            onPressed: null,
            icon: Icon(Ionicons.close),
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        width: emailFocusNode.hasFocus ? 1.5 : 1.0,
                        color: emailFocusNode.hasFocus ? Colors.black : Colors.black26,
                      ),
                    ),
                    child: TextFormField(
                      focusNode: emailFocusNode,
                      onTap: () => setState(() {}),
                      decoration: InputDecoration(
                        label: Text(l10n.emailTextFieldLabel),
                      ),
                      cursorColor: Colors.black12,
                      cursorWidth: 0.5,
                    ),
                  ),
                ),
                FilledButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ProfileSetupScreen(),
                    ),
                  ),
                  child: Text(
                    l10n.phoneAuthenticationScreenContinueButtonLabel,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10.0),
                const AuthenticationOptions(
                  authProvider: AuthProvider.email,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
