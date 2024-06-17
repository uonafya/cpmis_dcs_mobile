import 'package:flutter/material.dart';

class CompulsaryQuestion extends StatelessWidget {
  final String question;

  const CompulsaryQuestion({required this.question, super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: question,
            style: const TextStyle(fontSize: 14, color: Colors.black),
            children: const [
          TextSpan(text: " *", style: TextStyle(color: Colors.red))
        ]));
  }
}
