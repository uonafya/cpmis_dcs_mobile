import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/models/case_load/case_load_model.dart';
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
                  Get.to(() => const CaseRegistrationSheet());
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
                        Icons.edit,
                        size: 16,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        "Edit",
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
                  Get.to(() => const FollowUpScreen());
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
              const SizedBox(
                width: 14,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(4)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: const Row(
                  children: [
                    Icon(
                      Icons.print,
                      size: 16,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Print",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          InkWell(
            onTap: () {
              final crsDetails = CRSForm(
                  childID: "",
                  caseID: "",
                  caseReporting: CaseReportingCRSFormModel(
                    county: "Nairobi",
                    subCounty: "Makadara",
                    city: "Nairobi",
                    location: "Makadara Sub County",
                    obNumber: "N/A",
                    country: "Kenya",
                    originator: "Mother",
                    placeOfOccurence: true,
                    policeStation: "Maka Police Station",
                    reporterFirstName: "Ann",
                    reporterLastName: "Kathambi",
                    reporterOtherName: "Njeru",
                    reporterPhoneNumber: "0713532868",
                    reportingOrganizationalUnit: "Makadara Sub County",
                    reportingSubCounty: "Makadara",
                    courtFileNumber: "NB/47/287/5/29/3004/2024",
                    courtName: "Makadara Law Courts",
                    dateCaseReported: DateTime.now(),
                    subLocation: "Maksadara",
                    village: "Maka Village",
                    ward: "Maka Ward",
                  ),
                  about: AboutChildCRSFormModel(
                      initialDetails: InitialChildDetails(
                        firstName: "Baby",
                        surname: "Kathambi",
                        otherNames: "",
                        sex: "Female",
                        dateOfBirth: DateTime.now(),
                        age: 7,
                      ),
                      siblingDetails: [],
                      houseEconomicStatus: "Good",
                      familyStatus: [],
                      closeFriends: [],
                      hobbies: []),
                  medical: MedicalCRSFormModel(
                      mentalConditionStatus: "Appears Not Okay",
                      mentalCondition: [
                        "Anxiety",
                        "Depression",
                        "Stress",
                        "Trauma"
                      ],
                      physicalConditionStatus: "Appears Normal",
                      physicalCondition: ["Tired"],
                      otherConditionStatus: "Appears not well",
                      otherCondition: ["Sick", "Weak", "Tired"]),
                  caseData: CaseDataCRSFormModel(
                      serialNumber: "A1931",
                      offenderKnown: "Yes",
                      caseNarration: "",
                      crsCategories: [],
                      perpetrators: [
                        const Perpetrators(firstName: "Karl", lastName: "")
                      ],
                      riskLevel: 'Medium',
                      referralsPresent: true,
                      summonsIssued: true,
                      dateOfSummon: DateTime.now(),
                      immediateNeeds: ["Clothing", "Food", "Shelter"],
                      futureNeeds: ["Clothing", "Food", "Shelter"]));
              Get.to(() => SocialInquiry(
                    crsDetails: crsDetails,
                  ));
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
                  "Reporter Phone Number",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  caseLoad.caseReporter ?? "-",
                  style: const TextStyle(fontSize: 12),
                ),
                const Divider()
              ],
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Place of Occurence",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "",
                  style: TextStyle(fontSize: 12),
                ),
                Divider()
              ],
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sub County",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "Makadara",
                  style: TextStyle(fontSize: 12),
                ),
                Divider()
              ],
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Village/Estate",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "N/A",
                  style: TextStyle(fontSize: 12),
                ),
                Divider()
              ],
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Place of Reporting",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "",
                  style: TextStyle(fontSize: 12),
                ),
                Divider()
              ],
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sub County",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "Makadara",
                  style: TextStyle(fontSize: 12),
                ),
                Divider()
              ],
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Place of Reporting",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "MAKADARA SUB COUNTY",
                  style: TextStyle(fontSize: 12),
                ),
                Divider()
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
                      ? ""
                      : caseLoad.siblings!.map((e) => e.id ?? "-").join("\n>"),
                  style: const TextStyle(fontSize: 12),
                ),
                const Divider()
              ],
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "No Siblings",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "",
                  style: TextStyle(fontSize: 12),
                ),
                Divider()
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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Close Friends",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "",
                  style: TextStyle(fontSize: 12),
                ),
                Divider()
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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mental Condition",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "Appears Normal",
                  style: TextStyle(fontSize: 12),
                ),
                Divider()
              ],
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Physical Condition",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "Appears Normal",
                  style: TextStyle(fontSize: 12),
                ),
                Divider()
              ],
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Other Conditions",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "Appears Normal",
                  style: TextStyle(fontSize: 12),
                ),
                Divider()
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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Immediate Needs",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "> Clothing\n> Food\n> Shelter",
                  style: TextStyle(fontSize: 12),
                ),
                Divider()
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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Summons",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "Summon Date",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "Oct 11, 2018",
                  style: TextStyle(fontSize: 12),
                ),
                Divider()
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
