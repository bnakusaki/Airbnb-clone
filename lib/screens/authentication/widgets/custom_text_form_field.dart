// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:airbnb/shared/sizes.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({super.key, required this.label});
  final String label;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool focus = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.borderRaduis),
        border: Border.all(
          width: focus ? 1.5 : 1.0,
          color: focus ? colorScheme.scrim : colorScheme.secondary,
        ),
      ),
      child: TextFormField(
        style: const TextStyle(fontWeight: FontWeight.w300),
        onTap: () => setState(() => focus = true),
        onTapOutside: (event) => setState(() => focus = false),
        decoration: InputDecoration(
          label: Text(widget.label),
        ),
        cursorColor: colorScheme.secondary,
        cursorWidth: 0.5,
      ),
    );
  }
}
