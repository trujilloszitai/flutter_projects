import 'package:flutter/material.dart';

Future<void> displayDialog(BuildContext context, Widget dialog) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return dialog;
      });
}
