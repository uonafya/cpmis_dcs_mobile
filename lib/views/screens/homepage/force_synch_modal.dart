// ignore_for_file: use_build_context_synchronously

import 'package:cpims_dcs_mobile/controller/sync_provider.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/views/screens/homepage/home_page.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';

class LockPage extends StatefulWidget {
  const LockPage({super.key});

  @override
  State<LockPage> createState() => _LockPageState();
}

class _LockPageState extends State<LockPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              SizedBox(
                height: 60,
                width: 60,
                child: Image.asset('assets/images/logo_gok.png'),
              ),
              const Spacer(),
              SizedBox(
                height: 160,
                width: 160,
                child: Lottie.asset('assets/lock.json'),
              ),
              const Spacer(),
              const Text(
                "Please sync data to continue using the app",
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                text: "Sync Data",
                isLoading: isLoading,
                onTap: () async {
                  try {
                    setState(() {
                      isLoading = true;
                    });
                    await syncData(context);
                    setState(() {
                      isLoading = false;
                    });
                    Get.to(() => const Homepage());
                    showSuccessSnackBar(context, "Data synced successfully");
                  } catch (e) {
                    setState(() {
                      isLoading = false;
                    });
                    showErrorSnackBar(context,
                        "Failed to sync data, please try again later.");
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
