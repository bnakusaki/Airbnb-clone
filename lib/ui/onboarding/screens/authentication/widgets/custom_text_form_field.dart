// ignore_for_file: public_member_api_docs, sort_constructors_first
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
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: focus ? 1.5 : 1.0, color: focus ? Colors.black : Colors.black26),
      ),
      child: TextFormField(
        onTap: () => setState(() => focus = true),
        onTapOutside: (event) => setState(() => focus = false),
        decoration: InputDecoration(
          label: Text(widget.label),
        ),
        cursorColor: Colors.black12,
        cursorWidth: 0.5,
        keyboardType: TextInputType.phone,
      ),
    );
  }
}
