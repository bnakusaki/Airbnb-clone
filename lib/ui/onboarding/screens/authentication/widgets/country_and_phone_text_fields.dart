import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CountryAndPhoneTextFields extends StatefulWidget {
  const CountryAndPhoneTextFields({super.key});

  @override
  State<CountryAndPhoneTextFields> createState() => _CountryAndPhoneTextFieldsState();
}

class _CountryAndPhoneTextFieldsState extends State<CountryAndPhoneTextFields> {
  bool focus = false;
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.black12),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: DropDownTextField(
              dropDownList: const [
                DropDownValueModel(name: 'United States (+1)', value: 0),
                DropDownValueModel(name: 'Ghana (+233)', value: 0),
              ],
              dropDownIconProperty: IconProperty(size: 40.0),
              textFieldDecoration: InputDecoration(
                label: Text(l10n.phoneAuthenticationScreenCountryDropDownFieldLabel),
                suffixIcon: const Icon(CupertinoIcons.chevron_down),
              ),
            ),
          ),
          if (!focus) const Divider(height: 0.0),
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: focus
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width: 1.5),
                  )
                : null,
            child: TextFormField(
              onTap: () => setState(() => focus = true),
              onTapOutside: (event) => setState(() => focus = false),
              decoration: InputDecoration(
                label: Text(l10n.phoneAuthenticationScreenPhoneNumberFieldLabel),
                suffixIcon: const Icon(Icons.check),
              ),
              cursorColor: Colors.black12,
              cursorWidth: 0.5,
              keyboardType: TextInputType.phone,
            ),
          ),
        ],
      ),
    );
  }
}
