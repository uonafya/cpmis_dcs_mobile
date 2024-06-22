import 'package:cpims_dcs_mobile/controller/metadata_manager.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/core/network/followup_court.dart';
import 'package:cpims_dcs_mobile/models/case_load/case_load_model.dart';
import 'package:cpims_dcs_mobile/models/court_session_model.dart';
import 'package:cpims_dcs_mobile/views/screens/follow_up/forms/lists.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_button.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_dropdown_multiselect.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_forms_date_picker.dart';
import 'package:cpims_dcs_mobile/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class CourtFollowUp extends StatefulWidget {
  const CourtFollowUp({super.key, required this.caseLoad});
  final CaseLoadModel caseLoad;

  @override
  State<CourtFollowUp> createState() => _CourtFollowUpState();
}

class _CourtFollowUpState extends State<CourtFollowUp> {
  MetadataManager metadataManager = MetadataManager.getInstance();
  final caseCategories = ["Please select", "Abandoned"];
  String caseCategory = "Please select";
  final courtSessionTypeList = [
    "Please select",
    "Application",
    "Plea Taking",
    "Hearing",
    "Mention"
  ];
  String courtSessionType = "Please select";
  String serviceProvider = serviceProviderList[0]["title"]!;
  final courtNotes = TextEditingController();
  String applicationOutcome = "Please select";
  final applicationOutcomeList = [
    "Please select",
    "Application granted",
    "Application not granted"
  ];
  String pleaTaken = "Please select";
  final pleaTakenList = [
    "Please select",
    "Pleaded guilty",
    "Pleaded not guilty"
  ];
  String? dateOfMention;
  String courtOutcome = "Please select";
  final courtOutcomeList = [
    "Please select",
    "Adjournment",
    "Judgment",
    "Ruling",
    "Court Order"
  ];
  String? nextHearingDate;
  List<String> courtOrders = [];
  final List<ValueItem<String>> courtOrderOptions = [
    const ValueItem(
        label: "Re-unification and Re-integration",
        value: "Re-unification and Re-integration"),
    const ValueItem(label: "Access order", value: "Access order"),
    const ValueItem(label: "Adoption order", value: "Adoption order"),
    const ValueItem(
        label: "Child assessment order", value: "Child assessment order"),
    const ValueItem(
        label: "Child counselling order", value: "Child counselling order"),
  ];
  List<dynamic> selectedServices = [];
  String? dateOfService;

  final CourtDatabaseHelper courtDatabaseHelper = CourtDatabaseHelper();

  void handleAddService() async {
    String? caseId = widget.caseLoad.caseID;
    String? formId = "sessions_followup";
    print(widget.caseLoad.toJson());

    // if (caseCategory == "Please select") {
    //   showErrorSnackBar(context, "Please select a case category.");
    //   return;
    // }

    if (dateOfService == null) {
      showErrorSnackBar(context, "Please fill in the date of court session.");
      return;
    }

    if (courtSessionType == "Please select") {
      showErrorSnackBar(context, "Please select a court session type.");
      return;
    }

    // Create model instance
    CourtSessionModel courtSessionModel = CourtSessionModel(
      caseId: caseId,
      formId: formId,
      applicationOutcome:
          applicationOutcome == "Please select" ? null : applicationOutcome,
      courtNotes: courtNotes.text,
      courtSessionCase: caseCategory == "Please select" ? null : caseCategory,
      courtOutcome: courtOutcome == "Please select" ? null : courtOutcome,
      nextHearingDate: nextHearingDate,
      nextMentionDate: dateOfMention,
      pleaTaken: pleaTaken == "Please select" ? null : pleaTaken,
      dateOfCourtEvent: dateOfService,
      courtSessionType:
          courtSessionType == "Please select" ? null : courtSessionType,
      courtOrder: courtOrders.isNotEmpty ? courtOrders : null,
    );

    print(courtSessionModel.toJson());

    // Convert model to JSON
    // Map<String, dynamic> dataToSend = courtSessionModel.toJson();

    try {
      print('Db initialization & saving court session...');
      var db = await localdb.database;
      await courtDatabaseHelper.insertCourtSession(courtSessionModel);
      print('Saved court session :)');

      Get.back();
      showSuccessSnackBar(context, "Court session saved successfully.");
    } catch (e) {
      print(e.toString());
      showErrorSnackBar(context, "Failed to save court session.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Court Session"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        children: [
          const SizedBox(height: 14),
          const Text("Case category *"),
          const SizedBox(height: 6),
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
          const SizedBox(height: 14),
          const Text("Date of Court Session *"),
          const SizedBox(height: 6),
          CustomFormsDatePicker(
            onDateSelected: (val) {
              dateOfService = DateFormat("dd/MM/yyyy").format(val);
              setState(() {});
            },
          ),
          const SizedBox(height: 14),
          const Text("Court Session Type *"),
          const SizedBox(height: 6),
          CustomDropdown(
            initialValue: courtSessionType,
            items: courtSessionTypeList,
            onChanged: (val) {
              setState(() {
                courtSessionType = val;
                applicationOutcome = "Please select";
                pleaTaken = "Please select";
                dateOfMention = null;
                courtOutcome = "Please select";
                nextHearingDate = null;
                courtOrders = [];
              });
            },
          ),
          if (courtSessionType == "Application")
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                const Text("Application Outcome"),
                const SizedBox(height: 6),
                CustomDropdown(
                  initialValue: applicationOutcome,
                  items: applicationOutcomeList,
                  onChanged: (val) {
                    setState(() {
                      applicationOutcome = val;
                    });
                  },
                ),
              ],
            ),
          if (courtSessionType == "Plea Taking")
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                const Text("Plea Taken"),
                const SizedBox(height: 6),
                CustomDropdown(
                  initialValue: pleaTaken,
                  items: pleaTakenList,
                  onChanged: (val) {
                    setState(() {
                      pleaTaken = val;
                    });
                  },
                ),
                const SizedBox(height: 14),
                const Text("Date of Mention"),
                const SizedBox(height: 6),
                CustomFormsDatePicker(
                  onDateSelected: (val) {
                    dateOfMention = DateFormat("dd/MM/yyyy").format(val);
                    setState(() {});
                  },
                ),
              ],
            ),
          if (courtSessionType == "Hearing")
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                const Text("Court Outcome *"),
                const SizedBox(height: 6),
                CustomDropdown(
                  initialValue: courtOutcome,
                  items: courtOutcomeList,
                  onChanged: (val) {
                    setState(() {
                      courtOutcome = val;
                      nextHearingDate = null;
                      courtOrders = [];
                    });
                  },
                ),
                if (courtOutcome == "Adjournment")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 14),
                      const Text("Next Hearing Date"),
                      const SizedBox(height: 6),
                      CustomFormsDatePicker(
                        onDateSelected: (val) {
                          nextHearingDate =
                              DateFormat("dd/MM/yyyy").format(val);
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                if (courtOutcome == "Judgment" ||
                    courtOutcome == "Ruling" ||
                    courtOutcome == "Court Order")
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 14),
                      const Text("Court Order(s) *"),
                      const SizedBox(height: 6),
                      CustomDropDownMultiSelect(
                        options: MetadataManager.getInstance()
                            .courtOrder
                            .entries
                            .map((entry) =>
                                ValueItem(label: entry.key, value: entry.value))
                            .toList(),
                        onOptionSelected: (List<String> selectedOptions) {
                          setState(() {
                            courtOrders = selectedOptions;
                          });
                        },
                        selectionType: SelectionType.multi,
                        hint: "Select Court Order(s)",
                      ),
                    ],
                  ),
              ],
            ),
          if (courtSessionType == "Mention")
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                const Text("Next Mention Date"),
                const SizedBox(height: 6),
                CustomFormsDatePicker(
                  onDateSelected: (val) {
                    dateOfMention = DateFormat("dd/MM/yyyy").format(val);
                    setState(() {});
                  },
                ),
              ],
            ),
          const SizedBox(height: 14),
          const Text("Court Session Notes"),
          const SizedBox(height: 6),
          CustomTextField(
            maxLines: 5,
            hintText: "Notes",
            controller: courtNotes,
          ),
          const SizedBox(height: 14),
          CustomButton(text: "Save", onTap: handleAddService),
          const SizedBox(height: 10),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     const Text(
          //       'Upstream Test Syncing...',
          //       style: TextStyle(color: Colors.grey),
          //     ),
          //     const SizedBox(width: 10),
          //     GestureDetector(
          //       child: const Text(
          //         'Sync',
          //         style: TextStyle(
          //           color: kPrimaryColor,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       onTap: () async {
          //         final CourtSessionModel? courtSessionModel =
          //             await courtDatabaseHelper.getCourtSession(
          //                 "1213"); // Replace with actual case ID

          //         if (courtSessionModel != null) {
          //           print(courtSessionModel.toJson());
          //           Get.snackbar(
          //               "Success", "Court session synced successfully.");
          //         } else {
          //           Get.snackbar(
          //               "Error", "No court session found for this case ID.");
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
          //     const SizedBox(width: 10),
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
          //           await courtDatabaseHelper.deleteCourtSession(
          //               "1213"); // Replace with actual case ID
          //           Get.snackbar(
          //               "Success", "Court session deleted successfully.");
          //         } catch (e) {
          //           print(e.toString());
          //           showErrorSnackBar(context,  "Failed to delete court session.");
          //         }
          //       },
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
