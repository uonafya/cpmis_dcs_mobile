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
  const ServicesFollowUp({super.key});

  @override
  State<ServicesFollowUp> createState() => _ServicesFollowUpState();
}

class _ServicesFollowUpState extends State<ServicesFollowUp> {
  final caseCategories = ["Please select", "Neglect"];
  String caseCategory = "Please select";
  final services = ["Please select", "Service 1", "Service 2"];
  String service = serviceList[0]["title"]!;
  String serviceProvider = serviceProviderList[0]["title"]!;
  final placeOfServiceController = TextEditingController();
  List<dynamic> selectedServices = [];
  String? dateOfService;

  void handleAddService() {
    // Assuming caseId, encounterNotes, and caseCategoryId are to be captured elsewhere/are static
    String? caseId = "SomeCaseId";
    String? encounterNotes = "Some notes here";
    String?
        caseCategoryId; // Determine how to capture this, possibly related to caseCategory

    // Assuming caseCategory maps to caseCategoryId in some way, for simplicity, using caseCategory directly
    caseCategoryId = caseCategory == "Please select" ? null : caseCategory;

    // Create a list of ServiceProvidedList with current form values
    List<ServiceProvidedList> serviceProvidedList = [
      ServiceProvidedList(
        serviceProvided: service == "Please select" ? null : service,
        serviceProvider:
            serviceProvider == "Please select" ? null : serviceProvider,
        placeOfService: placeOfServiceController.text.isEmpty
            ? null
            : placeOfServiceController.text,
        dateOfEncounterEvent:
            dateOfService, // Assuming dateOfService is in the correct format
      ),
    ];

    // ServiceFollowupModel instance with captured values
    final serviceFollowup = ServiceFollowupModel(
      caseId: caseId,
      encounterNotes: encounterNotes,
      caseCategoryId: caseCategoryId,
      serviceProvidedList: serviceProvidedList,
    );

    print(serviceFollowup.toJson());
    Get.back();
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
              items: caseCategories,
              onChanged: (val) {
                setState(() {
                  caseCategory = val;
                });
              }),
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
          CustomButton(
              text: "+ Add service(s)",
              onTap: () {
                handleAddService();
              }),
          const SizedBox(
            height: 10,
          ),
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
