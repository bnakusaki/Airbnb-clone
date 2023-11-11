import 'package:airbnb/screens/authentication/widgets/custom_text_form_field.dart';
import 'package:airbnb/screens/authentication/widgets/legal_name_fields.dart';
import 'package:airbnb/screens/terms_and_condition.dart';
import 'package:airbnb/shared/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  bool birthdayFieldFocus = false;
  TextEditingController birthDayFieldController = TextEditingController();
  bool passwordFieldFocus = false;
  TextEditingController passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.only(top: 15.0, bottom: 5.0);
    final colorScheme = Theme.of(context).colorScheme;
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
          leading: const BackButton(),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.profileSetupScreenTitle,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 8.0),
                  child: LegalNamesField(),
                ),
                Text(
                  l10n.nameFieldsCaution,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Container(
                  margin: padding,
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Sizes.borderRaduis),
                    border: Border.all(
                        width: birthdayFieldFocus ? 1.5 : 1.0,
                        color: birthdayFieldFocus ? colorScheme.scrim : colorScheme.secondary),
                  ),
                  child: TextFormField(
                    style: const TextStyle(fontWeight: FontWeight.w300),
                    controller: birthDayFieldController,
                    readOnly: true,
                    onTap: () async {
                      final birthDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime(DateTime.now().year - 18),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(DateTime.now().year - 17),
                      );
                      if (birthDate != null) {
                        birthDayFieldController.text = DateFormat('MM/DD/y').format(birthDate);
                      }
                    },
                    decoration: InputDecoration(
                      label: Text(l10n.birthDayTextFieldLabel),
                    ),
                    cursorColor: colorScheme.secondary,
                    cursorWidth: 0.5,
                  ),
                ),
                Text(
                  l10n.birthDayTextFieldCaution,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Padding(
                  padding: padding,
                  child: CustomTextFormField(label: l10n.emailTextFieldLabel),
                ),
                Text(
                  l10n.emailTextFieldInfo,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Padding(
                  padding: padding,
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.borderRaduis),
                      border: Border.all(
                          width: passwordFieldFocus ? 1.5 : 1.0,
                          color: passwordFieldFocus ? colorScheme.scrim : colorScheme.secondary),
                    ),
                    child: TextFormField(
                      style: const TextStyle(fontWeight: FontWeight.w300),
                      controller: passwordFieldController,
                      onTap: () => setState(() => passwordFieldFocus = true),
                      onTapOutside: (event) => setState(() => passwordFieldFocus = false),
                      onChanged: (value) => setState(() {}),
                      decoration: InputDecoration(
                        label: Text(l10n.passwordTextFieldLabel),
                      ),
                      cursorColor: colorScheme.secondary,
                      cursorWidth: 0.5,
                    ),
                  ),
                ),
                passwordFieldController.text.isNotEmpty && passwordFieldController.text.length < 6
                    ? Text(
                        l10n.passwordValidationMessages,
                        style: TextStyle(color: colorScheme.error),
                      ).animate().fade()
                    : passwordFieldController.text.length >= 6
                        ? Text(l10n.passwordValidationPassedMassege)
                        : const SizedBox.shrink(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0, top: Sizes.borderRaduis),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: l10n.msg1),
                        TextSpan(
                          text: l10n.msg2,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        TextSpan(text: l10n.msg3),
                        TextSpan(
                          text: l10n.msg4,
                          style: const TextStyle(decoration: TextDecoration.underline),
                        ),
                        const TextSpan(
                          text: ' ',
                        ),
                        TextSpan(
                          text: l10n.msg5,
                          style: const TextStyle(decoration: TextDecoration.underline),
                        ),
                        TextSpan(
                          text: l10n.msg6,
                        ),
                        TextSpan(
                          text: l10n.msg7,
                          style: const TextStyle(decoration: TextDecoration.underline),
                        ),
                        TextSpan(
                          text: l10n.msg8,
                        ),
                        TextSpan(
                          text: l10n.msg9,
                          style: const TextStyle(decoration: TextDecoration.underline),
                        ),
                        const TextSpan(
                          text: '.',
                        ),
                      ],
                    ),
                  ),
                ),
                FilledButton(
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return const TermsAndCondition();
                        });
                  },
                  style: FilledButton.styleFrom(backgroundColor: colorScheme.scrim),
                  child: Text(
                    l10n.agreeAndContinueButtonLabel,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
