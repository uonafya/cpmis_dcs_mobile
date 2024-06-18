// ignore_for_file: use_build_context_synchronously

import 'package:cpims_dcs_mobile/controller/auth_provider.dart';
import 'package:cpims_dcs_mobile/controller/connection_provider.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/auth/connectivity_screen.dart';
import 'package:cpims_dcs_mobile/views/screens/auth/request_access_screen.dart';
import 'package:cpims_dcs_mobile/views/screens/auth/reset_password_screen.dart';
import 'package:cpims_dcs_mobile/views/screens/auth/widgets/important_links_widget.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/footer.dart';
import 'package:cpims_dcs_mobile/views/widgets/initial_loader.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/route_manager.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  bool _isloading = false;

  final auth = LocalAuthentication();
  String authorized = " not authorized";
  List<BiometricType> availableBiometric = [];

  Future<void> _authenticate() async {
    bool authenticated = false;

    try {
      authenticated = await auth.authenticate(
        localizedReason: "Scan your finger to authenticate",
      );
    } on PlatformException catch (e) {
      if (mounted) errorSnackBar(context, e.message.toString());
    }

    setState(() {
      authorized =
          authenticated ? "Authorized success" : "Failed to authenticate";
    });
    if (!authenticated) return;
    final prefs = await SharedPreferences.getInstance();

    final username = prefs.getString('username');
    final password = prefs.getString('password');

    if (username != null && password != null) {
      _login(username: username, password: password);
    } else {
      if (context.mounted) {
        errorSnackBar(context, 'Please login with your credentials first');
      }
    }
  }

  Future<void> _checkBiometric() async {
    bool canCheckBiometric = false;

    try {
      canCheckBiometric = await auth.canCheckBiometrics;
      if (kReleaseMode && !canCheckBiometric && mounted) {
        errorSnackBar(context, 'Biometrics not available');
        return;
      }
    } on PlatformException catch (_) {
      if (context.mounted) {
        errorSnackBar(context, 'Unable to check biometrics');
      }
    }

    if (!mounted) return;

    setState(() {});
  }

  Future _getAvailableBiometric() async {
    try {
      availableBiometric = await auth.getAvailableBiometrics();
      if (availableBiometric.isEmpty && mounted) {
        errorSnackBar(context, 'Biometrics not available');
        return;
      }
    } on PlatformException catch (_) {
      if (context.mounted) {
        errorSnackBar(context, 'Unable to get available biometrics');
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await _checkBiometric();
      await _getAvailableBiometric();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: kSystemPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: kToolbarHeight),
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    'Directorate of Children Services (DCS)',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 10),
                  const Text(
                    'Provide the required details to log in',
                    style: TextStyle(color: kTextGrey),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Username',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: userNameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                        ),
                        labelText: "Enter Username here..."),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.deny(
                        RegExp(
                          r'\s',
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Password',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: _isObscure,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                      ),
                      labelText: "Enter password here...",
                      suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                    onChanged: (value) {
                      passwordController.text = value;
                    },
                  ),
                  const SizedBox(height: 15),
                  _isloading
                      ? SpinKitFadingCircle(
                          itemBuilder: (BuildContext context, int index) {
                            return DecoratedBox(
                              decoration: BoxDecoration(
                                color: index.isEven ? Colors.red : Colors.green,
                              ),
                            );
                          },
                        )
                      : CustomButton(
                          text: 'Sign In',
                          onTap: () {
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                            _login(
                              username: userNameController.text,
                              password: passwordController.text,
                            );
                          },
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final hasConnection =
                          await Provider.of<ConnectivityProvider>(context,
                                  listen: false)
                              .checkInternetConnection();
                      if (!hasConnection) {
                        Get.to(() => const ConnectivityScreen(
                              redirectScreen: RequestAccessScreen(),
                            ));
                      } else {
                        Get.to(() => const RequestAccessScreen());
                      }
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Not registered yet? Click ',
                        style: TextStyle(fontSize: 13, color: kTextGrey),
                        children: [
                          TextSpan(
                            text: 'here',
                            style: TextStyle(
                              color: kPrimaryColor,
                            ),
                          ),
                          TextSpan(
                            text: ' to request for access',
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final hasConnection =
                          await Provider.of<ConnectivityProvider>(context,
                                  listen: false)
                              .checkInternetConnection();
                      if (!hasConnection) {
                        Get.to(() => const ConnectivityScreen(
                              redirectScreen: ResetPasswordScreen(),
                            ));
                      } else {
                        Get.to(() => const ResetPasswordScreen());
                      }
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Forgot password? Click ',
                        style: TextStyle(fontSize: 13, color: kTextGrey),
                        children: [
                          TextSpan(
                            text: 'here',
                            style: TextStyle(
                              color: kPrimaryColor,
                            ),
                          ),
                          TextSpan(
                            text: ' to change password',
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: _authenticate,
                    child: const SizedBox(
                      height: 80,
                      width: 80,
                      child: Card(
                        child: Icon(
                          Icons.fingerprint,
                          size: 50,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Text(
                  'Important Links',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ImportantLinksWidget(
                    title: 'Status Page',
                    assetLink: 'assets/images/statuspage.jpg',
                  ),
                  ImportantLinksWidget(
                    title: 'CPIMS Docs',
                    assetLink: 'assets/images/cpimsdocs.png',
                  ),
                  ImportantLinksWidget(
                    title: 'DCS Instance',
                    assetLink: 'assets/images/reports.png',
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Center(
                child: Text(
                  'Partners',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Image.asset(
                'assets/images/logo_private.png',
                height: 60,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(
                height: 15,
              ),
              // Center(
              //   child: Image.asset(
              //     'assets/images/healthit.jpg',
              //     height: 60,
              //   ),
              // ),
              const SizedBox(
                height: 15,
              ),
              const Footer(
                hasPartners: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login({
    required String username,
    required String password,
  }) async {
    setState(() {
      _isloading = true;
    });
    if (username.isEmpty || password.isEmpty) {
      if (mounted) {
        errorSnackBar(context, 'Please enter your username and password',
            duration: const Duration(seconds: 3));
      }
      setState(() {
        _isloading = false;
      });
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final hasUserSetup = prefs.getBool("hasUserSetup");
    final hasConnection =
        await Provider.of<ConnectivityProvider>(context, listen: false)
            .checkInternetConnection();
    if (!hasConnection) {
      if (hasUserSetup == null) {
        Get.off(() => const ConnectivityScreen(redirectScreen: LoginScreen()));
        return;
      }

      final savedUsername = prefs.getString('username');
      final savedPassword = prefs.getString('password');
      if (savedUsername == null || savedPassword == null) {
        if (mounted) {
          errorSnackBar(context, 'Please login with your credentials first');
        }
        setState(() {
          _isloading = false;
        });
        return;
      }

      if (username != savedUsername || password != savedPassword) {
        if (mounted) {
          errorSnackBar(context, 'Please login with your credentials first');
        }
        setState(() {
          _isloading = false;
        });
        return;
      }

      Get.off(() => const InitialLoaderScreen(),
          transition: Transition.fadeIn,
          duration: const Duration(microseconds: 300));
      return;
    }
    try {
      if (mounted) {
        await Provider.of<AuthProvider>(context, listen: false).login(
          context: context,
          password: password,
          username: username,
        );
      }
      setState(() {
        _isloading = false;
      });
    } catch (e) {
      setState(() {
        _isloading = false;
      });
    }
  }
}
