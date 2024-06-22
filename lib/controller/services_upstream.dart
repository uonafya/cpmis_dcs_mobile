import 'dart:convert';

import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/api_service.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/core/network/followup_services.dart';
import 'package:cpims_dcs_mobile/models/services_followup_model.dart';
import 'package:intl/intl.dart';

Future<void> sendServicesUpstream() async {
  final db = await LocalDB.instance.database;

  // Sync services
  final services = await db.query(serviceFollowupTable);
  print("SERVICES:$services");

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
