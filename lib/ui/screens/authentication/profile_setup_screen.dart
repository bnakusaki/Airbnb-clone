import 'package:airbnb/screens/authentication/widgets/custom_text_form_field.dart';
import 'package:airbnb/screens/authentication/widgets/legal_name_fields.dart';
import 'package:airbnb/screens/terms_and_condition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
    return GestureDetector(
      onTap: () {
        FocusNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(leading: const BackButton()),
        body: SafeArea(
          minimum: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add your info',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 8.0),
                  child: LegalNamesField(),
                ),
                Text(
                  'Make sure it matches the name on your governmanet ID.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Padding(
                  padding: padding,
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          width: birthdayFieldFocus ? 1.5 : 1.0,
                          color: birthdayFieldFocus ? Colors.black : Colors.black26),
                    ),
                    child: TextFormField(
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
                      decoration: const InputDecoration(
                        label: Text('Birthday'),
                      ),
                      cursorColor: Colors.black12,
                      cursorWidth: 0.5,
                    ),
                  ),
                ),
                Text(
                  'To sign up, you need to be at least 18. Other people who use Airbnb won\'t see your birthday.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Padding(
                  padding: padding,
                  child: CustomTextFormField(label: 'Email'),
                ),
                Text(
                  'We\'ll email you a reservation confirmation.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Padding(
                  padding: padding,
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          width: passwordFieldFocus ? 1.5 : 1.0,
                          color: passwordFieldFocus ? Colors.black : Colors.black26),
                    ),
                    child: TextFormField(
                      controller: passwordFieldController,
                      onTap: () => setState(() => passwordFieldFocus = true),
                      onTapOutside: (event) => setState(() => passwordFieldFocus = false),
                      onChanged: (value) => setState(() {}),
                      decoration: const InputDecoration(
                        label: Text('Password'),
                      ),
                      cursorColor: Colors.black12,
                      cursorWidth: 0.5,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ),
                passwordFieldController.text.isNotEmpty && passwordFieldController.text.length < 6
                    ? const Text.rich(
                        TextSpan(
                          style: TextStyle(color: Colors.red),
                          children: [
                            TextSpan(text: 'Password strength is weak\n'),
                            TextSpan(text: 'Can\'t include your name or email address'),
                          ],
                        ),
                      ).animate().fade()
                    : passwordFieldController.text.length >= 6
                        ? const Text('Password is strong')
                        : const SizedBox.shrink(),
                const Padding(
                  padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: 'By selecting '),
                        TextSpan(
                          text: 'Agree and continue ',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        TextSpan(text: ', I agree to Airbnb\'s '),
                        TextSpan(
                          text: 'Terms of Service,',
                          style: TextStyle(decoration: TextDecoration.underline),
                        ),
                        TextSpan(
                          text: ' ',
                        ),
                        TextSpan(
                          text: 'Payment Terms of Service',
                          style: TextStyle(decoration: TextDecoration.underline),
                        ),
                        TextSpan(
                          text: ' and ',
                        ),
                        TextSpan(
                          text: 'Nondiscrimination Policy',
                          style: TextStyle(decoration: TextDecoration.underline),
                        ),
                        TextSpan(
                          text: ', and acknowledge the ',
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(decoration: TextDecoration.underline),
                        ),
                        TextSpan(
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
                  child: Text(
                    'Agree and continue',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),
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
