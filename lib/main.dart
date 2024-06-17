// ignore_for_file: use_build_context_synchronously

import 'package:cpims_dcs_mobile/controller/auth_provider.dart';
import 'package:cpims_dcs_mobile/controller/connection_provider.dart';
import 'package:cpims_dcs_mobile/core/constants/theme.dart';
import 'package:cpims_dcs_mobile/core/network/http_client.dart';
import 'package:cpims_dcs_mobile/core/network/preferences.dart';
import 'package:cpims_dcs_mobile/views/screens/auth/login_screen.dart';
import 'package:cpims_dcs_mobile/views/screens/auth/splash_screen.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await httpClient.initialize();
  await preferences.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ConnectivityProvider()),
      ChangeNotifierProvider(create: (_) => AuthProvider()),
    ], child: const CPIMS());
  }
}

class CPIMS extends StatefulWidget {
  const CPIMS({super.key});

  @override
  State<CPIMS> createState() => _CPIMSState();
}

class _CPIMSState extends State<CPIMS> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'CPIMS',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: Builder(
        builder: (context) {
          return FutureBuilder(
            future: intialSetup(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SplashScreen();
              }

              return snapshot.data!['hasConnection'] == false ||
                      snapshot.data!['isAuthenticated']
                  ? const Homepage()
                  : const LoginScreen();
            },
          );
        },
      ),
    );
  }
}

Future<Map<String, dynamic>> intialSetup(BuildContext context) async {
  final hasConnection =
      await Provider.of<ConnectivityProvider>(context, listen: false)
          .checkInternetConnection();
  if (hasConnection == false) {
    return {'hasConnection': hasConnection, 'isAuthenticated': false};
  }
  final isAuthenticated =
      // ignore: use_build_context_synchronously
      await Provider.of<AuthProvider>(context, listen: false)
          .verifyToken(context: context);

  return {'hasConnection': hasConnection, 'isAuthenticated': isAuthenticated};
}
