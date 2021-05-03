import 'package:flutter/material.dart';

class ErrorSnackbar extends SnackBar {
  final String message;

  ErrorSnackbar({required this.message}) : super(content: Text(message));
}
