// ignore_for_file: use_build_context_synchronously

import 'package:cpims_dcs_mobile/controller/sync_provider.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';

class SyncModal extends StatefulWidget {
  const SyncModal({super.key});

  @override
  State<SyncModal> createState() => _SyncModalState();
}

class _SyncModalState extends State<SyncModal> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      try {
        await syncData(context);
        Get.back();
        showSuccessSnackBar(context, "Sync complete");
      } catch (e) {
        Get.back();
        showErrorSnackBar(context, "Sync failed");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Column(
        children: [
          Lottie.asset('assets/lock.json', width: 120, height: 120),
          const SizedBox(
            height: 10,
          ),
          const Text("Synching data..."),
        ],
      ),
    );
  }
}
