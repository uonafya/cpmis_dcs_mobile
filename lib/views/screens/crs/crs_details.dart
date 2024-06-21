import 'package:cpims_dcs_mobile/controller/crs_form_provider.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/models/case_load/case_load_model.dart';
import 'package:cpims_dcs_mobile/models/case_load/siblings_model.dart';
import 'package:cpims_dcs_mobile/models/crs_forms.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/pages/crs_page.dart';
import 'package:cpims_dcs_mobile/views/screens/follow_up/follow_up_home.dart';
import 'package:cpims_dcs_mobile/views/screens/follow_up/follow_up_screen.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/custom_drawer.dart';
import 'package:cpims_dcs_mobile/views/screens/social_inquiry/social_inquiry.dart';
import 'package:cpims_dcs_mobile/views/widgets/app_bar.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CRSDetails extends StatelessWidget {
  const CRSDetails({super.key, required this.caseLoad});
  final CaseLoadModel caseLoad;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      drawer: const Drawer(
        child: CustomDrawer(),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        children: [
          const SizedBox(
            height: 14,
          ),
          Row(
            children: [
              const Text(
                "View Case Record Sheet",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              const SizedBox(
                width: 14,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const FollowUpHome());
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: const Text(
                    "INACTIVE",
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            "${caseLoad.ovcFirstName} ${caseLoad.ovcSurname} | ${caseLoad.ovcSex}",
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  final List<SiblingsModel>? caseLoadSiblings =
                      caseLoad.siblings;

                  List<SiblingDetails> siblings = [];

                  if (caseLoadSiblings != null) {
                    for (var caseLoadSibling in caseLoadSiblings) {
                      siblings.add(SiblingDetails(
                        firstName: "Wakili",
                        surName: "Mkuu",
                        sex: "Male",
                        dateOfBirth: DateFormat("yyyy-MM-dd")
                            .parse(caseLoadSibling.dateLinked ?? ""),
                        dateLinked: DateFormat("yyyy-MM-dd")
                            .parse(caseLoadSibling.dateDelinked ?? ""),
                        dateUnlinked: DateFormat("yyyy-MM-dd")
                            .parse(caseLoadSibling.dateDelinked ?? ""),
                      ));
                    }
                  }

                  AboutChildCRSFormModel? crsAbout = AboutChildCRSFormModel(
                    initialDetails: InitialChildDetails(
                      sex: caseLoad.ovcSex ?? "",
                      dateOfBirth: DateTime.now(),
                      surName: caseLoad.ovcSurname ?? "",
                      firstName: caseLoad.ovcFirstName ?? "",
                      otherNames: caseLoad.ovcOtherNames ?? "",
                    ),
                    familyStatus: [],
                    houseEconomicStatus: "",
                    siblingDetails: siblings,
                  );
                  Provider.of<CRSFormProvider>(context, listen: false).about =
                      crsAbout;

                  Get.to(
                    () => const CaseRegistrationSheet(),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(4)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 16,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Register New Case",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => FollowUpScreen(
                        caseLoadModel: caseLoad,
                      ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(4)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.watch,
                        size: 16,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Follow up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          InkWell(
            onTap: () {
              Get.to(() => SocialInquiry(crsDetails: caseLoad));
            },
            child: Text(
              "Social Inquiry Form",
              style: TextStyle(
                  color: Colors.blue[800],
                  decoration: TextDecoration.underline),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          CustomCard(title: "CASE REPORTING", children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Case Reporter/Originator",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  caseLoad.caseReporter ?? "-",
                  style: const TextStyle(fontSize: 12),
                ),
                const Divider()
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Reporter Name(s)",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "${caseLoad.caseReporterfirstName} ${caseLoad.caseReporterSurName} ${caseLoad.caseReporterOtherNames}",
                  style: const TextStyle(fontSize: 12),
                ),
                const Divider()
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Reporter Phone Number",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  caseLoad.caseReporterContacts ?? "-",
                  style: const TextStyle(fontSize: 12),
                ),
                const Divider()
              ],
            ),
            const Text(
              "Place of Occurence",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sub County",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  caseLoad.occurrenceSubCountyName ?? "-",
                  style: const TextStyle(fontSize: 12),
                ),
                const Divider()
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Village/Estate",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  caseLoad.occurrenceVillageName ?? "-",
                  style: const TextStyle(fontSize: 12),
                ),
                const Divider()
              ],
            ),
            const Text(
              "Place of Reporting",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sub County",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  caseLoad.reportSubCountyName ?? "-",
                  style: const TextStyle(fontSize: 12),
                ),
                const Divider()
              ],
            ),
          ]),
          const SizedBox(
            height: 14,
          ),
          CustomCard(title: "ABOUT THE CHILD", children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Child Name(s)",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "${caseLoad.ovcFirstName} ${caseLoad.ovcSurname}",
                  style: const TextStyle(fontSize: 12),
                ),
                const Divider()
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sex",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  caseLoad.ovcSex ?? "-",
                  style: const TextStyle(fontSize: 12),
                ),
                const Divider()
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Siblings",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  caseLoad.siblings == null
                      ? "No siblings"
                      : caseLoad.siblings!.length.toString(),
                  style: const TextStyle(fontSize: 12),
                ),
                const Divider()
              ],
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "House Economic Status",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "Middle Income (apparent)",
                  style: TextStyle(fontSize: 12),
                ),
                Divider()
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Close Friends",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  caseLoad.hobbies == null
                      ? "No friends"
                      : caseLoad.hobbies!.length.toString(),
                  style: const TextStyle(fontSize: 12),
                ),
                const Divider()
              ],
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hobbies",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "",
                  style: TextStyle(fontSize: 12),
                ),
                Divider()
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Mental Condition",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  caseLoad.mentalCondition == null
                      ? "NA"
                      : caseLoad.mentalCondition!
                          .map((e) => e.toString())
                          .join("\n>"),
                  style: const TextStyle(fontSize: 12),
                ),
                const Divider()
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Physical Condition",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  caseLoad.physicalCondition == null
                      ? "NA"
                      : caseLoad.physicalCondition!
                          .map((e) => e.toString())
                          .join("\n>"),
                  style: const TextStyle(fontSize: 12),
                ),
                const Divider()
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Other Conditions",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  caseLoad.otherCondition == null
                      ? "NA"
                      : caseLoad.otherCondition!
                          .map((e) => e.toString())
                          .join("\n>"),
                  style: const TextStyle(fontSize: 12),
                ),
                const Divider()
              ],
            ),
          ]),
          const SizedBox(
            height: 14,
          ),
          CustomCard(title: "CASE DETAILS", children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Case Serial",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  caseLoad.caseSerial ?? "-",
                  style: const TextStyle(fontSize: 12),
                ),
                const Divider()
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Risk Level",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  caseLoad.riskLevel ?? "-",
                  style: const TextStyle(fontSize: 12),
                ),
                const Divider()
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Immediate Needs",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  caseLoad.immediateNeeds == null
                      ? "NA"
                      : caseLoad.mentalCondition!
                          .map((e) => e.toString())
                          .join("\n>"),
                  style: const TextStyle(fontSize: 12),
                ),
                const Divider()
              ],
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Referrals",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "No referrals found",
                  style: TextStyle(fontSize: 12),
                ),
                Divider()
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Summons",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  "Summon Date",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  caseLoad.dateOfSummon ?? "-",
                  style: const TextStyle(fontSize: 12),
                ),
                const Divider()
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Case Remarks",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  caseLoad.caseRemarks ?? "None",
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ]),
          const SizedBox(
            height: 14,
          ),
          const Text(
            "* Case remains pending if no follow up is made after registration. Cases are dropped out after 90 days (but not automatic).",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
