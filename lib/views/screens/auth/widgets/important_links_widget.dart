import 'package:flutter/material.dart';

class ImportantLinksWidget extends StatelessWidget {
  const ImportantLinksWidget(
      {super.key, required this.title, required this.assetLink});
  final String title;
  final String assetLink;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          assetLink,
          height: 50,
          width: 50,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
