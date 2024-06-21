class ESRFormModel {
  String? formId;
  String? county;
  String? subCounty;
  String? location;
  String? subLocation;
  String? village;
  String? villageElder;
  String? nearestChurchMosque;
  String? nearestSchool;
  String? years;
  String? months;
  String? householdBenefits;
  String? benefitType;
  String? specifiedBenefit;
  List<FamilyMembers>? familyMembers;

  ESRFormModel(
      {this.formId,
      this.county,
      this.subCounty,
      this.location,
      this.subLocation,
      this.village,
      this.villageElder,
      this.nearestChurchMosque,
      this.nearestSchool,
      this.years,
      this.months,
      this.householdBenefits,
      this.benefitType,
      this.specifiedBenefit,
      this.familyMembers});

  ESRFormModel.fromJson(Map<String, dynamic> json) {
    formId = json['form_id'];
    county = json['county'];
    subCounty = json['sub_county'];
    location = json['location'];
    subLocation = json['sub_location'];
    village = json['village'];
    villageElder = json['village_elder'];
    nearestChurchMosque = json['nearest_church_mosque'];
    nearestSchool = json['nearest_school'];
    years = json['years'];
    months = json['months'];
    householdBenefits = json['household_benefits'];
    benefitType = json['benefit_type'];
    specifiedBenefit = json['specified_benefit'];
    if (json['family_members'] != null) {
      familyMembers = <FamilyMembers>[];
      json['family_members'].forEach((v) {
        familyMembers!.add(FamilyMembers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['form_id'] = formId;
    data['county'] = county;
    data['sub_county'] = subCounty;
    data['location'] = location;
    data['sub_location'] = subLocation;
    data['village'] = village;
    data['village_elder'] = villageElder;
    data['nearest_church_mosque'] = nearestChurchMosque;
    data['nearest_school'] = nearestSchool;
    data['years'] = years;
    data['months'] = months;
    data['household_benefits'] = householdBenefits;
    data['benefit_type'] = benefitType;
    data['specified_benefit'] = specifiedBenefit;
    if (familyMembers != null) {
      data['family_members'] = familyMembers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FamilyMembers {
  String? firstName;
  String? middleName;
  String? surname;
  String? doesHaveId;
  String? relationship;
  String? sex;
  String? dateOfBirth;
  String? maritalStatus;
  String? doesSufferChronic;
  String? disabilityRequire24Care;
  String? typeOfDisability;
  String? learningInstitution;
  String? highestLearning;
  String? doingLast;
  String? hasFormalJob;
  String? recommendSupport;
  String? mainCaregiver;

  FamilyMembers(
      {this.firstName,
      this.middleName,
      this.surname,
      this.doesHaveId,
      this.relationship,
      this.sex,
      this.dateOfBirth,
      this.maritalStatus,
      this.doesSufferChronic,
      this.disabilityRequire24Care,
      this.typeOfDisability,
      this.learningInstitution,
      this.highestLearning,
      this.doingLast,
      this.hasFormalJob,
      this.recommendSupport,
      this.mainCaregiver});

  FamilyMembers.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    middleName = json['middle_name'];
    surname = json['surname'];
    doesHaveId = json['doesHaveId'];
    relationship = json['relationship'];
    sex = json['sex'];
    dateOfBirth = json['date_of_birth'];
    maritalStatus = json['marital_status'];
    doesSufferChronic = json['does_suffer_chronic'];
    disabilityRequire24Care = json['disability_require_24_care'];
    typeOfDisability = json['type_of_disability'];
    learningInstitution = json['learning_institution'];
    highestLearning = json['highest_learning'];
    doingLast = json['doing_last'];
    hasFormalJob = json['has_formal_job'];
    recommendSupport = json['recommend_support'];
    mainCaregiver = json['main_caregiver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['middle_name'] = middleName;
    data['surname'] = surname;
    data['doesHaveId'] = doesHaveId;
    data['relationship'] = relationship;
    data['sex'] = sex;
    data['date_of_birth'] = dateOfBirth;
    data['marital_status'] = maritalStatus;
    data['does_suffer_chronic'] = doesSufferChronic;
    data['disability_require_24_care'] = disabilityRequire24Care;
    data['type_of_disability'] = typeOfDisability;
    data['learning_institution'] = learningInstitution;
    data['highest_learning'] = highestLearning;
    data['doing_last'] = doingLast;
    data['has_formal_job'] = hasFormalJob;
    data['recommend_support'] = recommendSupport;
    data['main_caregiver'] = mainCaregiver;
    return data;
  }
}
