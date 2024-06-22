// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:cpims_dcs_mobile/controller/loadLocationFromUpstream.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/api_service.dart';
import 'package:cpims_dcs_mobile/core/network/countries.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/core/network/followup_closure.dart';
import 'package:cpims_dcs_mobile/core/network/followup_services.dart';
import 'package:cpims_dcs_mobile/core/network/metadata.dart';
import 'package:cpims_dcs_mobile/core/network/mobile_settings.dart';
import 'package:cpims_dcs_mobile/models/closure_followup_model.dart';
import 'package:cpims_dcs_mobile/models/services_followup_model.dart';
import 'package:cpims_dcs_mobile/models/social_inquiry_form_model.dart';

import 'package:intl/intl.dart';
import 'package:cpims_dcs_mobile/views/widgets/initial_loader.dart';
import 'package:flutter/cupertino.dart';

// Mapping functions
int mapCaseOutcome(String outcome) {
  final Map<String, int> outcomeMap = {
    "Please select": 0,
    "Transferred to another organization unit": 1,
    "Child reintegrated into education": 2,
    "Child removed from exploitative situation": 3,
    "Lost contact (Dropped out)": 4,
    "Other outcomes (Standard intervention)": 5,
  };
  return outcomeMap[outcome] ?? 0;
}

int mapCaseCategory(String category) {
  final Map<String, int> categoryMap = {
    "Please select": 0,
    "Neglect": 1,
  };
  return categoryMap[category] ?? 0;
}

int mapServiceProvided(String service) {
  final Map<String, int> serviceMap = {
    "Please select": 0,
    "Supported to access clinical HIV services": 1,
    "Supported to access general clinical service": 2,
    "Admitted in residential institution (CCI or rescue home)": 3,
    "Arrest of perpetrator of abuse or violence to child": 4,
    "Assisted with economic activity (eg farming income generation)": 5,
  };
  return serviceMap[service] ?? 0;
}

int mapServiceProvider(String provider) {
  final Map<String, int> providerMap = {
    "Please select": 0,
    "Civil registration department": 1,
    // Add more providers as needed
  };
  return providerMap[provider] ?? 0;
}

Future<void> syncData(BuildContext context) async {
  final String deviceID = await getDeviceID(context);

  await Future.wait([
    //TO UPSTREAM
    sendClosureUpstream(),
    sendSocialInquiryUpstream(),
    sendESRUpstream(),
    sendServicesUpstream(),
    //FROM UPSTREAM
    apiService.fetchAndInsertCaseload(deviceID: deviceID),
    loadLocationFromUpstream(),
    saveOrganizationUnits(),
    saveCountries(),
    saveMetadata(),
  ]);
}

Future<void> sendSocialInquiryUpstream() async {
  final db = await LocalDB.instance.database;

  //Get all social inquiries
  final inquiries = await db.query(socialInquiryTable);
  print("INQUIRIES: $inquiries");
  for (var inquiry in inquiries) {
    final inq = SocialInquiryFormModel.fromJson(inquiry);
    await apiService.sendSocialInquiry(inq);
    final inquiryId = inquiry['id'];

    await db
        .delete(socialInquiryTable, where: 'id = ?', whereArgs: [inquiryId]);
  }
}

Future<void> sendClosureUpstream() async {
  final db = await LocalDB.instance.database;

  // Sync closure followups
  final closures = await db.query(caseClosureTable);
  print("CLOSURE:$closures ");

  for (var closure in closures) {
    try {
      final closureModel = ClosureFollowupModel.fromJson(closure);

      // Transform the data for API submission
      final apiSubmissionData = {
        'case_id': closureModel.caseId,
        'form_id': closureModel.formId,
        'case_outcome': mapCaseOutcome(closureModel.caseOutcome ?? ""),
        'transfered_to': closureModel.transferedTo,
        'intervention_list': closureModel.interventionList
                ?.map((intervention) => {
                      'intervention':
                          mapCaseOutcome(intervention.intervention ?? ""),
                      'case_category':
                          mapCaseCategory(intervention.caseCategory ?? ""),
                    })
                .toList() ??
            [],
        'case_closure_notes': closureModel.caseClosureNotes,
        'date_of_case_closure': closureModel.dateOfCaseClosure != null
            ? DateFormat("yyyy-MM-dd").format(
                DateFormat("dd/MM/yyyy").parse(closureModel.dateOfCaseClosure!))
            : null,
      };

      // Print the format of the synced data

      print(const JsonEncoder.withIndent('  ').convert(apiSubmissionData));

      await apiService.sendClosureFollowup(apiSubmissionData);
      final closureDatabaseHelper = ClosureDatabaseHelper();
      final caseId = closure[CaseClosureTable.caseID];
      if (caseId != null && caseId is String) {
        await closureDatabaseHelper.deleteClosureFollowup(caseId);
      } else {
        print('Invalid caseId for deletion: $caseId');
      }
    } catch (e) {
      // Continue with the next closure instead of throwing an exception
      continue;
    }
  }
}

Future<void> sendServicesUpstream() async {
  final db = await LocalDB.instance.database;

  // Sync services
  final services = await db.query(serviceFollowupTable);
  print("SERVICES:$services");

  for (var service in services) {
    try {
      final serviceModel = ServiceFollowupModel.fromJson(service);

      // Transform the data for API submission
      final apiSubmissionData = {
        'case_id': serviceModel.caseId,
        'form_id': serviceModel.formId,
        'encounter_notes': serviceModel.encounterNotes,
        'case_category_id': mapCaseCategory(serviceModel.caseCategoryId ?? ""),
        'service_provided_list': serviceModel.serviceProvidedList
                ?.map((service) => {
                      'service_provided_id':
                          mapServiceProvided(service.serviceProvided ?? ""),
                      'service_provider_id':
                          mapServiceProvider(service.serviceProvider ?? ""),
                      'place_of_service': service.placeOfService,
                      'date_of_encounter_event':
                          service.dateOfEncounterEvent != null
                              ? DateFormat("yyyy-MM-dd").format(
                                  DateFormat("dd/MM/yyyy")
                                      .parse(service.dateOfEncounterEvent!))
                              : null,
                    })
                .toList() ??
            [],
      };

      print("Service Synced data format for case ${serviceModel.caseId}:");
      print(const JsonEncoder.withIndent('  ').convert(apiSubmissionData));

      await apiService.sendServiceFollowup(apiSubmissionData);
      final serviceDatabaseHelper = ServiceDatabaseHelper();
      final caseId = service[ServiceFollowupTable.caseID];
      if (caseId != null && caseId is String) {
        await serviceDatabaseHelper.deleteServiceFollowup(caseId);
        print("Successfully synced and deleted service for case $caseId");
      } else {
        print('Invalid caseId for deletion: $caseId');
      }
    } catch (e, stackTrace) {
      print('Error processing service:');
      print('Data: ${jsonEncode(service)}');
      print('Error: $e');
      print('Stack trace: $stackTrace');
      // Continue with the next service instead of throwing an exception
      continue;
    }
  }
}

Future<void> sendESRUpstream() async {
  final db = LocalDB.instance;

  //Get all ESR forms
  final esrForms = await db.getESRForms();
  print("ESR FORMS: $esrForms");

  for (var esr in esrForms) {
    await apiService.sendESRForm(esr.toJson());
  }
  db.deleteAllESRForms();
}
