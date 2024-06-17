import 'package:cpims_dcs_mobile/views/screens/follow_up/forms/court_followup.dart';
import 'package:cpims_dcs_mobile/views/screens/follow_up/forms/referrals_followup.dart';
import 'package:cpims_dcs_mobile/views/screens/follow_up/forms/services_followup.dart';
import 'package:cpims_dcs_mobile/views/screens/follow_up/forms/summons_followup.dart';
import 'package:cpims_dcs_mobile/views/screens/follow_up/forms/close_followup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class FollowupActions extends StatefulWidget {
  const FollowupActions({super.key});

  @override
  State<FollowupActions> createState() => _FollowupActionsState();
}

class _FollowupActionsState extends State<FollowupActions> {
  List<Map<String, dynamic>> actions = [
    {
      "title": "Manage Services",
      "onTap": () {
        Get.to(() => const ServicesFollowUp());
      }
    },
    {
      "title": "Manage Court Session",
      "onTap": () {
        Get.to(() => const CourtFollowUp());
      }
    },
    {
      "title": "Manage Summons",
      "onTap": () {
        Get.to(() => const SummonsFollowUp());
      }
    },
    {
      "title": "Manage Referrals",
      "onTap": () {
        Get.to(() => const ReferralsFollowUp());
      }
    },
    {
      "title": "Close",
      "onTap": () {
        Get.to(() => const CloseFollowup());
      }
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
            children: List.generate(
          actions.length,
          (index) => ListTile(
            title: Text(actions[index]['title']),
            onTap: actions[index]['onTap'],
          ),
        )),
      ),
    );
  }
}