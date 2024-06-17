import 'package:flutter/material.dart';

class FormPageHeading extends StatelessWidget {
  final String heading;

  const FormPageHeading({required this.heading, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            heading,
            style: const TextStyle(fontSize: 21),
          ),
        ),
        const Divider()
      ],
    );
  }
}
