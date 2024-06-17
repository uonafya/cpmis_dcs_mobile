import 'package:cpims_dcs_mobile/views/screens/crs/widgets/compulsary_question.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/widgets/info_icon.dart';
import 'package:flutter/material.dart';

class CompulsaryQuestionWithTooltip extends StatelessWidget {
  final String question;
  final String tooltip;

  const CompulsaryQuestionWithTooltip(
      {required this.question, required this.tooltip, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CompulsaryQuestion(question: question),
        InfoIcon(tooltipString: tooltip)
      ],
    );
  }
}
