import 'package:cpims_dcs_mobile/controller/connection_provider.dart';
import 'package:cpims_dcs_mobile/core/network/api_service.dart';
import 'package:cpims_dcs_mobile/models/case_load/case_load_model.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

class InitialLoaderScreen extends StatefulWidget {
  const InitialLoaderScreen({super.key});

  @override
  State<InitialLoaderScreen> createState() => _InitialLoaderScreenState();
}

class _InitialLoaderScreenState extends State<InitialLoaderScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 0),
      () async {
        try {
          final hasConnection =
              await Provider.of<ConnectivityProvider>(context, listen: false)
                  .checkInternetConnection();
          if (hasConnection) {
            // final prefs = await SharedPreferences.getInstance();
            // final accessToken = prefs.getString('access');

            final String deviceID = await getDeviceID();
            if (kDebugMode) {
              print('Device ID: $deviceID');
            }
            // check if user is authenticated
            // if authenticated, navigate to homepage
            // else navigate to login screen

            // fetch caseload data
            final List<CaseLoadModel> caseloadData =
                await ApiService().fetchCaseLoad(deviceID);

            if (kDebugMode) {
              print('OVCID: ${caseloadData.first.ovcCpimsId}');
            }
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
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Future<String> getDeviceID() async {
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
