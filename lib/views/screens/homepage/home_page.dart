import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/crs_home.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/widgets/statistics_grid_item.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/widgets/statistics_item.dart';
import 'package:cpims_dcs_mobile/views/widgets/app_bar.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_grid_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Map<String, String>> formsList = [
    {'formType': 'form1a', 'endpoint': 'F1A'},
    {'formType': 'form1b', 'endpoint': 'F1B'},
  ];

  late int formOneACount = 0;
  late int formOneBCount = 0;
  late int cparaCount = 0;
  late int ovcSubpopulatoiCount = 0;
  late int cptCount = 0;

  // late int
  int? updatedCountA = 0;
  int? updatedCountB = 0;
  int? updatedCountCpara = 0;
  int? updatedCountOvcSubpopulation = 0;
  int? updatedCptCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: customAppBar(),
        body: RefreshIndicator(
          onRefresh: () async {},
          child: Stack(
            children: [
              Positioned.fill(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Mathare - Dashboard',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Application data and usage summary',
                          style: TextStyle(color: kTextGrey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            child: const Text(
                              'Sync',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {})
                      ],
                    ),
                    const SizedBox(height: 20),
                    if (kDebugMode)
                      const InfoCard(
                        title: 'THIS IS A TEST APPLICATION',
                        icon: FontAwesomeIcons.warning,
                        color: Color(0xffff0010),
                        secondaryColor: Color(0xff630122),
                      ),
                    StatisticsItem(
                      title: 'UNSYNCED RECORDS',
                      icon: FontAwesomeIcons.arrowsRotate,
                      color: const Color(0xffa10036),
                      secondaryColor: const Color(0xff630122),
                      form1ACount: 1,
                      form1BCount: 1,
                      cpaCount: 1,
                      cparaCount: 1,
                      onClick: () {},
                    ),
                    // StatisticsItem(
                    //   title: 'UNAPPROVED RECORDS',
                    //   icon: FontAwesomeIcons.fileCircleXmark,
                    //   color: const Color(0xff947901),
                    //   secondaryColor: const Color(0xff524300),
                    //   form1ACount: 4,
                    //   form1BCount: 3,
                    //   cpaCount: 2,
                    //   cparaCount: 1,
                    //   onClick: () {
                    //     Get.to(() => const UnapprovedRecordsScreens());
                    //   },
                    // ),
                    CustomGridView(
                      crossAxisCount: 2,
                      childrenHeight: 180,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        // const StatisticsGridItem(
                        //   title: 'FORM 1A',
                        //   value: "10/20",
                        //   icon: FontAwesomeIcons.fileLines,
                        //   color: kPrimaryColor,
                        //   secondaryColor: Color(0xff0E6668),
                        // ),
                        // const StatisticsGridItem(
                        //   title: 'FORM 1B',
                        //   value: "10/20",
                        //   icon: FontAwesomeIcons.fileLines,
                        //   color: Color(0xff348FE2),
                        //   secondaryColor: Color(0xff1F5788),
                        // ),
                        // const StatisticsGridItem(
                        //   title: 'CPARA',
                        //   value: "10/20",
                        //   icon: FontAwesomeIcons.fileLines,
                        //   color: Color(0xff727DB6),
                        //   secondaryColor: Color(0xff454A6D),
                        // ),
                        // const StatisticsGridItem(
                        //   title: 'CPT',
                        //   value: "10/20",
                        //   icon: FontAwesomeIcons.fileLines,
                        //   color: Color(0xff49B6D5),
                        //   secondaryColor: Color(0xff2C6E80),
                        // ),
                        // const StatisticsGridItem(
                        //   title: 'CLHIV',
                        //   value: "10/20",
                        //   icon: FontAwesomeIcons.heart,
                        //   color: Color(0xff49B6D5),
                        //   secondaryColor: Color(0xff2C6E80),
                        // ),
                        const StatisticsGridItem(
                          title: 'Org Unit Id',
                          value: "11010",
                          icon: FontAwesomeIcons.orcid,
                          color: Colors.black54,
                          secondaryColor: Colors.black87,
                        ),
                        const StatisticsGridItem(
                          title: 'ACTIVE OVC',
                          value: '5116',
                          icon: FontAwesomeIcons.person,
                          color: kPrimaryColor,
                          secondaryColor: Color(0xff0E6668),
                        ),
                        const StatisticsGridItem(
                          title: 'CAREGIVERS/GUARDIANS',
                          value: "10",
                          icon: FontAwesomeIcons.peopleGroup,
                          color: Color(0xff348FE2),
                          secondaryColor: Color(0xff1F5788),
                        ),
                        const StatisticsGridItem(
                          title: 'WORKFORCE MEMBERS',
                          value: "100",
                          icon: Icons.people,
                          color: Color(0xff727DB6),
                          secondaryColor: Color(0xff454A6D),
                        ),
                        const StatisticsGridItem(
                          title: 'ORG UNITS/CBOs',
                          value: "10",
                          icon: FontAwesomeIcons.landmark,
                          color: Color(0xff49B6D5),
                          secondaryColor: Color(0xff2C6E80),
                        ),
                        StatisticsGridItem(
                          title: 'HOUSEHOLDS',
                          value: "10",
                          icon: FontAwesomeIcons.house,
                          color: const Color(0xffFE5C57),
                          secondaryColor: const Color(0xff9A3734),
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 90,
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 30,
                right: 30,
                left: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 140,
                      child: CustomButton(
                        onTap: () {
                          Get.to(() => const CRSHome());
                        },
                        text: "Registry",
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
