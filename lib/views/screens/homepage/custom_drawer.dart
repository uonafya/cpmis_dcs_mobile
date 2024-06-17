import 'package:cpims_dcs_mobile/controller/auth_provider.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/crs_home.dart';
import 'package:cpims_dcs_mobile/views/screens/follow_up/follow_up_home.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  List<Map<String, dynamic>> drawerItems = [
    {
      "title": "Home",
      "onTap": () => Get.offAll(() => const Homepage()),
    },
    {
      "title": "Case Record Sheet",
      "onTap": () {
        Get.back();

        Get.to(() => const CRSHome());
      },
    },
    {
      "title": "Follow-ups",
      "onTap": () {
        Get.back();

        Get.to(() => const FollowUpHome());
      },
    },
    {
      "title": "ESR",
      "onTap": () {
        Get.back();

        Get.to(() => const FollowUpHome());
      },
    },
    {
      "title": "CCI Transfer",
      "onTap": () {
        Get.back();

        Get.to(() => const FollowUpHome());
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    const SizedBox(
                      width: 14,
                    ),
                    Image.asset(
                      'assets/images/logo_gok.png',
                      height: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("CPIMS-DCS",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                const Divider(),
                ...drawerItems.map(
                  (item) => InkWell(
                    onTap: item['onTap'],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 9),
                          child: Text(
                            item['title'],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        const Divider()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
          ),
          ListTile(
            title: const Text(
              "Log out",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Provider.of<AuthProvider>(context, listen: false).logOut(context);
            },
          ),
          const SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }
}
