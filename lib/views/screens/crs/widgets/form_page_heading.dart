import 'package:flutter/material.dart';

class FormPageHeading extends StatelessWidget {
  final String heading;
  final bool hasClosePage;

  const FormPageHeading(
      {required this.heading, this.hasClosePage = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        hasClosePage == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  pageHeading(heading),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.cancel,
                        color: Colors.grey,
                      ))
                ],
              )
            : Align(
                alignment: Alignment.centerLeft, child: pageHeading(heading)),
        const Divider()
      ],
    );
  }
}

Text pageHeading(String title) {
  return Text(
    title,
    style: const TextStyle(fontSize: 21),
  );
}
