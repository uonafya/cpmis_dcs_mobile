// ignore_for_file: deprecated_member_use

import 'package:cpims_dcs_mobile/controller/location_provider.dart';
import 'package:cpims_dcs_mobile/controller/sync_provider.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/mobile_settings.dart';
import 'package:cpims_dcs_mobile/core/network/preferences.dart';
import 'package:cpims_dcs_mobile/core/utils/sync_modal.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/crs_home.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/custom_drawer.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/force_synch_modal.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/widgets/statistics_grid_item.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/widgets/statistics_item.dart';
import 'package:cpims_dcs_mobile/views/widgets/app_bar.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_grid_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> orgUnits = [];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      Provider.of<LocationProvider>(context, listen: false)
          .getCurrentLocation();
      final syncTimeStamp = preferences.getString("sync_timestamp");
      if (syncTimeStamp != null) {
        final syncTime = DateTime.parse(syncTimeStamp);
        final now = DateTime.now();
        final difference = now.difference(syncTime).inDays;
        if (difference > 7) {
          Get.to(() => const LockPage());
        }
      }

      final data = await getOrganizationalUnits(null);
      orgUnits = data.map((e) => e.name ?? "-").toList();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: customAppBar(),
        drawer: const Drawer(
          child: CustomDrawer(),
        ),
        body: RefreshIndicator(
          onRefresh: () async {},
          child: Stack(
            children: [
              Positioned.fill(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      preferences.getString("org_unit") ?? "-",
                      style: const TextStyle(
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
                            child: const Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.sync,
                                  color: kPrimaryColor,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  'Sync',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => const Dialog(
                                  child: SingleChildScrollView(
                                    child: SyncModal(),
                                  ),
                                ),
                              );
                            })
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
                      title: 'ORGANISATIONS',
                      icon: FontAwesomeIcons.arrowsRotate,
                      color: const Color(0xffa10036),
                      secondaryColor: const Color(0xff630122),
                      otherItems: orgUnits,
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
                        StatisticsGridItem(
                          title: 'Org Unit Id',
                          value: preferences.getString("org_unit_id") ?? "0",
                          icon: FontAwesomeIcons.orcid,
                          color: Colors.black54,
                          secondaryColor: Colors.black87,
                        ),
                        StatisticsGridItem(
                          title: 'ACTIVE OVC',
                          value: preferences.getString("children") ?? "0",
                          icon: FontAwesomeIcons.person,
                          color: kPrimaryColor,
                          secondaryColor: const Color(0xff0E6668),
                        ),
                        StatisticsGridItem(
                          title: 'CAREGIVERS/GUARDIANS',
                          value: preferences.getString("caregivers") ?? "0",
                          icon: FontAwesomeIcons.peopleGroup,
                          color: const Color(0xff348FE2),
                          secondaryColor: const Color(0xff1F5788),
                        ),
                        StatisticsGridItem(
                          title: 'WORKFORCE MEMBERS',
                          value:
                              preferences.getString("workforce_members") ?? "0",
                          icon: Icons.people,
                          color: const Color(0xff727DB6),
                          secondaryColor: const Color(0xff454A6D),
                        ),
                        StatisticsGridItem(
                          title: 'ORG UNITS/CBOs',
                          value:
                              preferences.getString("org_units_count") ?? "0",
                          icon: FontAwesomeIcons.landmark,
                          color: const Color(0xff49B6D5),
                          secondaryColor: const Color(0xff2C6E80),
                        ),
                        StatisticsGridItem(
                          title: 'NGO',
                          value: preferences.getString("ngo") ?? "-",
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
                child: CustomButton(
                  onTap: () {
                    Get.to(() => const CRSHome());
                  },
                  text: "CRS Registry",
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ));
  }
}
