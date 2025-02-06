import 'package:flutter/material.dart';

void snackBar(BuildContext context, text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
