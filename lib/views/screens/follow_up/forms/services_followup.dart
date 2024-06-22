// ignore_for_file: use_build_context_synchronously

import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/followup_services.dart';
import 'package:cpims_dcs_mobile/models/case_load/case_load_model.dart';
import 'package:cpims_dcs_mobile/models/services_followup_model.dart';
import 'package:cpims_dcs_mobile/views/screens/follow_up/forms/lists.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_forms_date_picker.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';

class ServicesFollowUp extends StatefulWidget {
  const ServicesFollowUp({super.key, required this.caseLoad});
  final CaseLoadModel caseLoad;

  @override
  State<ServicesFollowUp> createState() => _ServicesFollowUpState();
}

class _ServicesFollowUpState extends State<ServicesFollowUp> {
  final caseCategories = ["Please select", "Abandoned"];
  String caseCategory = "Please select";
  final services = ["Please select", "Service 1", "Service 2"];
  String service = serviceList[0]["title"]!;
  String serviceProvider = serviceProviderList[0]["title"]!;
  final placeOfServiceController = TextEditingController();
  List<dynamic> selectedServices = [];
  String? dateOfService;
  final TextEditingController encounterNotesController =
      TextEditingController();

  final ServiceDatabaseHelper serviceDatabaseHelper = ServiceDatabaseHelper();

  void handleAddService() async {
    String? caseId = widget.caseLoad.caseID;
    String? formId = "services_followup";

    if (caseCategory == "Please select") {
      showErrorSnackBar(context, "Please select case category.");
      return;
    }

    if (service == "Please select") {
      showErrorSnackBar(context, "Please select a service.");
      return;
    }

    if (serviceProvider == "Please select") {
      showErrorSnackBar(context, "Please select a service provider.");
      return;
    }

    if (dateOfService == null) {
      showErrorSnackBar(context, "Please select a date of service.");
      return;
    }

    // Create a list of ServiceProvidedList with current form values
    List<ServiceProvidedList> serviceProvidedList = [
      ServiceProvidedList(
        serviceProvided: service,
        serviceProvider: serviceProvider,
        placeOfService: placeOfServiceController.text,
        dateOfEncounterEvent: dateOfService,
      ),
    ];

    // ServiceFollowupModel instance with captured values
    final serviceFollowupModel = ServiceFollowupModel(
      caseId: caseId,
      formId: formId,
      encounterNotes: encounterNotesController.text,
      caseCategoryId: caseCategory,
      serviceProvidedList: serviceProvidedList,
    );

    try {
      await serviceDatabaseHelper.insertServiceFollowup(serviceFollowupModel);

      Get.back();
    } catch (e) {
      showErrorSnackBar(context, "Failed to save service followup.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Encounters/Services"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        children: [
          const SizedBox(
            height: 14,
          ),
          const Text("Case category *"),
          const SizedBox(
            height: 6,
          ),
          CustomDropdown(
            initialValue: caseCategory,
            items: widget.caseLoad.caseCategories == null
                ? ["-"]
                : widget.caseLoad.caseCategories!
                    .map((e) => e.caseCategory.toString())
                    .toList(),
            onChanged: (val) {
              setState(() {
                caseCategory = val;
              });
            },
          ),
          const SizedBox(
            height: 14,
          ),
          const Text(
            "Add Service",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const Divider(),
          const Text("Service(s)"),
          const SizedBox(
            height: 6,
          ),
          CustomDropdown(
              initialValue: service,
              items: serviceList.map((e) => e["title"]!).toList(),
              onChanged: (val) {
                setState(() {
                  service = val;
                });
              }),
          const SizedBox(
            height: 14,
          ),
          const Text("Date of Service"),
          const SizedBox(
            height: 6,
          ),
          CustomFormsDatePicker(
            onDateSelected: (val) {
              dateOfService = DateFormat("dd/MM/yyyy").format(val);
              setState(() {});
            },
          ),
          const SizedBox(
            height: 14,
          ),
          const Text("Service(s) Provider"),
          const SizedBox(
            height: 6,
          ),
          CustomDropdown(
              initialValue: serviceProvider,
              items: serviceProviderList.map((e) => e["title"]!).toList(),
              onChanged: (val) {
                setState(() {
                  serviceProvider = val;
                });
              }),
          const SizedBox(
            height: 14,
          ),
          const Text("Place of Service"),
          const SizedBox(
            height: 6,
          ),
          CustomTextField(
            hintText: "Place of Service",
            controller: placeOfServiceController,
            validator: (val) {
              if (val!.isEmpty) {
                return "Place of service is required";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 14,
          ),
          const Text("Encounter/Service Notes:"),
          const SizedBox(
            height: 6,
          ),
          CustomTextField(
            controller: encounterNotesController,
            maxLines: 5,
          ),
          const SizedBox(
            height: 14,
          ),
          CustomButton(
              text: "+ Add service(s)",
              onTap: () {
                handleAddService();
              }),
          const SizedBox(
            height: 20,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     const Text(
          //       'Upstream Test Syncing...',
          //       style: TextStyle(color: Colors.grey),
          //     ),
          //     const SizedBox(
          //       width: 10,
          //     ),
          //     GestureDetector(
          //       child: const Text(
          //         'Sync',
          //         style: TextStyle(
          //           color: kPrimaryColor,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       onTap: () async {
          //         final ServiceFollowupModel? serviceFollowupModel =
          //             await serviceDatabaseHelper.getServiceFollowup(
          //                 "1231"); // Replace with actual case ID

          //         if (serviceFollowupModel != null) {
          //           print(serviceFollowupModel.toJson());
          //           Get.snackbar(
          //               "Success", "Service followup synced successfully.");
          //         } else {
          //           Get.snackbar(
          //               "Error", "No service followup found for this case ID.");
          //         }
          //       },
          //     )
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     const Text(
          //       'Deletion Test...',
          //       style: TextStyle(color: Colors.grey),
          //     ),
          //     const SizedBox(
          //       width: 10,
          //     ),
          //     GestureDetector(
          //       child: const Text(
          //         'Delete',
          //         style: TextStyle(
          //           color: Colors.red,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       onTap: () async {
          //         try {
          //           await serviceDatabaseHelper.deleteServiceFollowup("1231");
          //           Get.snackbar(
          //               "Success", "Service followup deleted successfully.");
          //         } catch (e) {
          //           showErrorSnackBar(context,  "Failed to delete service followup.");
          //         }
          //       },
          //     )
          //   ],
          // ),
          const Divider(),
          if (selectedServices.isNotEmpty)
            const Text(
              "Service List",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          const SizedBox(
            height: 14,
          ),
          ...List.generate(
            selectedServices.length,
            (index) => ServicesFollowUpItem(
              service: selectedServices[index]["service"],
              dateOfService: selectedServices[index]["dateOfService"],
              placeOfService: selectedServices[index]["placeOfService"],
              serviceProvider: selectedServices[index]["serviceProvider"],
              onRemove: () {
                selectedServices.removeAt(index);
                setState(() {});
              },
            ),
          )
        ],
      ),
    );
  }
}

class ServicesFollowUpItem extends StatelessWidget {
  const ServicesFollowUpItem(
      {super.key,
      required this.service,
      required this.dateOfService,
      required this.placeOfService,
      required this.onRemove,
      required this.serviceProvider});
  final String service;
  final String dateOfService;
  final String placeOfService;
  final String serviceProvider;
  final Function onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey[300]!),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Services",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      service,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              InkWell(
                onTap: () {
                  onRemove();
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Date of Service",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                dateOfService,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Service(s) provider",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                serviceProvider,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Place of service",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                placeOfService,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
