import 'package:flutter/material.dart';

class EmptyListMessage extends StatelessWidget {
  const EmptyListMessage({this.message = '¡Nada por aquí!'});
  final String message;

  static TextStyle optionStyle = TextStyle(
      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueGrey[700]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(48.0),
      child: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: optionStyle,
        ),
      ),
    );
  }
}
