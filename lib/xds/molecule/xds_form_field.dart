import 'package:baby_list/xds/atom/ensure_visible_when_focused.dart';
import 'package:flutter/material.dart';

class XdsFormField extends StatelessWidget {
  final FocusNode _focusNode = FocusNode();

  final IconData icon;
  final String hint;
  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final AutovalidateMode autovalidateMode;
  final bool readOnly;

  XdsFormField({
    Key? key,
    required this.icon,
    required this.hint,
    this.isPassword = false,
    this.validator,
    this.controller,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EnsureVisibleWhenFocused(
      focusNode: _focusNode,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 8.0),
            child: Icon(icon),
          ),
          hintText: hint,
        ),
        obscureText: isPassword,
        validator: validator,
        controller: controller,
        autovalidateMode: autovalidateMode,
        readOnly: readOnly,
        focusNode: _focusNode,
      ),
    );
  }
}
