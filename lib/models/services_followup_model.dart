class ServiceFollowupModel {
  String? caseId;
  String? encounterNotes;
  String? caseCategoryId;
  List<ServiceProvidedList>? serviceProvidedList;

  ServiceFollowupModel(
      {this.caseId,
      this.encounterNotes,
      this.caseCategoryId,
      this.serviceProvidedList});

  ServiceFollowupModel.fromJson(Map<String, dynamic> json) {
    caseId = json['case_id'];
    encounterNotes = json['encounter_notes'];
    caseCategoryId = json['case_category_id'];
    if (json['service_provided_list'] != null) {
      serviceProvidedList = <ServiceProvidedList>[];
      json['service_provided_list'].forEach((v) {
        serviceProvidedList!.add(new ServiceProvidedList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['case_id'] = this.caseId;
    data['encounter_notes'] = this.encounterNotes;
    data['case_category_id'] = this.caseCategoryId;
    if (this.serviceProvidedList != null) {
      data['service_provided_list'] =
          this.serviceProvidedList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceProvidedList {
  String? serviceProvided;
  String? serviceProvider;
  String? placeOfService;
  String? dateOfEncounterEvent;

  ServiceProvidedList(
      {this.serviceProvided,
      this.serviceProvider,
      this.placeOfService,
      this.dateOfEncounterEvent});

  ServiceProvidedList.fromJson(Map<String, dynamic> json) {
    serviceProvided = json['service_provided'];
    serviceProvider = json['service_provider'];
    placeOfService = json['place_of_service'];
    dateOfEncounterEvent = json['date_of_encounter_event'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_provided'] = this.serviceProvided;
    data['service_provider'] = this.serviceProvider;
    data['place_of_service'] = this.placeOfService;
    data['date_of_encounter_event'] = this.dateOfEncounterEvent;
    return data;
  }
}
