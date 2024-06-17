import 'package:flutter/material.dart';

class CustomInfoBox extends StatelessWidget {
  final Widget child;

  const CustomInfoBox({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber[200]!,
        border: Border(left: BorderSide(color: Colors.brown[500]!, width: 3.0)),
      ),
      padding: const EdgeInsets.all(10.0),
      child: child,
    );
  }
}
