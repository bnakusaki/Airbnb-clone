import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LegalNamesField extends StatefulWidget {
  const LegalNamesField({super.key});

  @override
  State<LegalNamesField> createState() => _LegalNameFieldState();
}

class _LegalNameFieldState extends State<LegalNamesField> {
  int? focus;
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
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: focus == 0
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width: 1.5),
                  )
                : null,
            child: TextFormField(
              onTap: () => setState(() => focus = 0),
              onTapOutside: (event) => setState(() => focus = null),
              decoration: InputDecoration(
                label: Text(l10n.firstNameTextFieldLabel),
              ),
              cursorColor: Colors.black12,
              cursorWidth: 0.5,
            ),
          ),
          if (focus == null) const Divider(height: 0.0),
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: focus == 1
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width: 1.5),
                  )
                : null,
            child: TextFormField(
              onTap: () => setState(() => focus = 1),
              decoration: InputDecoration(
                label: Text(l10n.lastNameTextFieldLabel),
              ),
              cursorColor: Colors.black12,
              cursorWidth: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
