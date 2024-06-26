// ignore_for_file: use_build_context_synchronously

import 'package:cpims_dcs_mobile/controller/connection_provider.dart';
import 'package:cpims_dcs_mobile/controller/loadLocationFromUpstream.dart';
import 'package:cpims_dcs_mobile/controller/location_provider.dart';
import 'package:cpims_dcs_mobile/core/network/api_service.dart';
import 'package:cpims_dcs_mobile/core/network/countries.dart';
import 'package:cpims_dcs_mobile/core/network/metadata.dart';
import 'package:cpims_dcs_mobile/core/network/mobile_settings.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

import '../../controller/metadata_manager.dart';

class InitialLoaderScreen extends StatefulWidget {
  const InitialLoaderScreen({super.key});

  @override
  State<InitialLoaderScreen> createState() => _InitialLoaderScreenState();
}

class _InitialLoaderScreenState extends State<InitialLoaderScreen> {
  final ApiService apiService = ApiService();
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 0),
      () async {
        try {
          Provider.of<LocationProvider>(context, listen: false)
              .getCurrentLocation();
          final hasConnection =
              await Provider.of<ConnectivityProvider>(context, listen: false)
                  .checkInternetConnection();

          if (hasConnection) {
            // final prefs = await SharedPreferences.getInstance();
            // final accessToken = prefs.getString('access');

            final String deviceID = await getDeviceID(context);
            if (kDebugMode) {
              print('Device ID: $deviceID');
            }
            // check if user is authenticated
            // if authenticated, navigate to homepage
            // else navigate to login screen

            // fetch and insert caseload data to local db
            await apiService.fetchAndInsertCaseload(deviceID: deviceID);
            await loadLocationFromUpstream();
            await saveOrganizationUnits();
            await saveCountries();
            await saveMetadata();
            // Call after all metadata, org units locations etc fetch
            MetadataManager.getInstance();
          } else {
            // show dialog to user
            // to enable internet connection
          }
          Get.off(() => const Homepage());
        } catch (e) {
          if (kDebugMode) {
            print('Error occurred during loading data $e');
          }
        }
      },
    );
  }

  // get device Id

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            const Spacer(),
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset('assets/images/logo_gok.png'),
            ),
            const Spacer(),
            const Text(
              'Loading...',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}

Future<String> getDeviceID(BuildContext context) async {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  // get device id
  String? deviceID = '';
  if (Theme.of(context).platform == TargetPlatform.android) {
    final AndroidDeviceInfo androidDeviceInfo =
        await deviceInfoPlugin.androidInfo;
    deviceID = androidDeviceInfo.id;
    if (kDebugMode) {
      print('Device ID $deviceID');
    }
  } else if (Theme.of(context).platform == TargetPlatform.iOS) {
    final IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    deviceID = iosDeviceInfo.identifierForVendor;
    if (kDebugMode) {
      print(deviceID);
    }
  }
  return deviceID!;
}
