import 'package:flutter/material.dart';

class InfoIcon extends StatelessWidget {
  final String tooltipString;

  const InfoIcon({required this.tooltipString, super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltipString,
      child: const Icon(Icons.info),
    );
  }
}
