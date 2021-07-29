import 'dart:math';

import 'package:baby_list/xds/molecule/xds_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:baby_list/feature/signup/domain/usecase/email_validator.dart';

typedef void OnSignUpSubmit(String username, String email, String password);

class SignUpForm extends StatefulWidget {
  final OnSignUpSubmit onSubmit;
  final String? passwordErrorMessage;
  final bool isSending;

  const SignUpForm({
    Key? key,
    required this.onSubmit,
    this.passwordErrorMessage,
    this.isSending = false,
  }) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: max(MediaQuery.of(context).size.height, 600),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _key,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Text(
                  'signup_title'.tr(),
                  style: Theme.of(context).textTheme.headline1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                XdsFormField(
                  key: Key('username'),
                  icon: Icons.person,
                  hint: 'signup_username'.tr(),
                  controller: _usernameController,
                  validator: (value) => value != null && value.isNotEmpty
                      ? null
                      : 'signup_no_username_error'.tr(),
                  readOnly: widget.isSending,
                ),
                Container(height: 16.0),
                XdsFormField(
                  key: Key('email'),
                  icon: Icons.email,
                  hint: 'signup_email'.tr(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'signup_no_email_error'.tr();
                    } else if (!value.isEmail()) {
                      return 'signup_invalid_email_error'.tr();
                    } else {
                      return null;
                    }
                  },
                  controller: _emailController,
                  readOnly: widget.isSending,
                ),
                Container(height: 16.0),
                XdsFormField(
                  key: Key('password'),
                  icon: Icons.password,
                  hint: 'signup_password'.tr(),
                  isPassword: true,
                  controller: _passwordController,
                  autovalidateMode: widget.passwordErrorMessage != null &&
                          widget.passwordErrorMessage!.isNotEmpty
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  validator: (value) {
                    if (widget.passwordErrorMessage != null &&
                        widget.passwordErrorMessage!.isNotEmpty) {
                      return widget.passwordErrorMessage;
                    } else if (value == null || value.isEmpty) {
                      return 'signup_no_password_error'.tr();
                    } else {
                      return null;
                    }
                  },
                  readOnly: widget.isSending,
                ),
                Container(height: 8.0),
                XdsFormField(
                  key: Key('confirmPassword'),
                  icon: Icons.password,
                  hint: 'signup_confirm_password'.tr(),
                  isPassword: true,
                  validator: (value) => value == _passwordController.text
                      ? null
                      : 'signup_not_matching_passwords'.tr(),
                  readOnly: widget.isSending,
                ),
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
                SizedBox(
                  key: Key('send'),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: widget.isSending
                        ? null
                        : () {
                            if (_key.currentState!.validate()) {
                              String username = _usernameController.text;
                              String email = _emailController.text;
                              String password = _passwordController.text;

                              widget.onSubmit(username, email, password);
                            }
                          },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: widget.isSending
                          ? CircularProgressIndicator()
                          : Text('signup_send'.tr()),
                    ),
                    style: ButtonStyle(elevation: MaterialStateProperty.all(0)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
