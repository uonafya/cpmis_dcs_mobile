class ServiceFollowupModel {
  String? caseId;
  String? formId;
  String? encounterNotes;
  String? caseCategoryId;
  List<ServiceProvidedList>? serviceProvidedList;

  ServiceFollowupModel({
    this.caseId,
    this.formId,
    this.encounterNotes,
    this.caseCategoryId,
    this.serviceProvidedList,
  });

  ServiceFollowupModel.fromJson(Map<String, dynamic> json) {
    caseId = json['case_id'];
    formId = json['form_id'];
    encounterNotes = json['encounter_notes'];
    caseCategoryId = json['case_category_id'];
    if (json['service_provided_list'] != null) {
      serviceProvidedList = <ServiceProvidedList>[];
      json['service_provided_list'].forEach((v) {
        serviceProvidedList!.add(ServiceProvidedList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['case_id'] = caseId;
    data['form_id'] = formId;
    data['encounter_notes'] = encounterNotes;
    data['case_category_id'] = caseCategoryId;
    if (serviceProvidedList != null) {
      data['service_provided_list'] =
          serviceProvidedList!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'case_id': caseId,
      'form_id': formId,
      'encounter_notes': encounterNotes,
      'case_category_id': caseCategoryId,
      'service_provided_list':
          serviceProvidedList?.map((e) => e.toMap()).toList() ?? [],
    };
  }
}

class ServiceProvidedList {
  String? serviceProvided;
  String? serviceProvider;
  String? placeOfService;
  String? dateOfEncounterEvent;

  ServiceProvidedList({
    this.serviceProvided,
    this.serviceProvider,
    this.placeOfService,
    this.dateOfEncounterEvent,
  });

  ServiceProvidedList.fromJson(Map<String, dynamic> json) {
    serviceProvided = json['service_provided'];
    serviceProvider = json['service_provider'];
    placeOfService = json['place_of_service'];
    dateOfEncounterEvent = json['date_of_encounter_event'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_provided'] = serviceProvided;
    data['service_provider'] = serviceProvider;
    data['place_of_service'] = placeOfService;
    data['date_of_encounter_event'] = dateOfEncounterEvent;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'service_provided': serviceProvided,
      'service_provider': serviceProvider,
      'place_of_service': placeOfService,
      'date_of_encounter_event': dateOfEncounterEvent,
    };
  }
}
