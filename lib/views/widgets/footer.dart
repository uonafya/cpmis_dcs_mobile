import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key, this.hasPartners = true});
  final bool hasPartners;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'All Rights Reserved',
          style: TextStyle(color: kTextGrey, fontSize: 12),
        ),
        if (hasPartners)
          const SizedBox(
            height: 10,
          ),
        if (hasPartners)
          Image.asset(
            'assets/images/logo_private.png',
            height: 50,
          ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
