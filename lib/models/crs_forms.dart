import 'package:cpims_dcs_mobile/core/constants/convert_date_to_YMD.dart';

class CaseReportingCRSFormModel {
  String originator;
  String? courtName;
  String? courtFileNumber;
  String? reporterPhoneNumber;
  String? reporterFirstName;
  String? reporterLastName;
  String? reporterOtherName;
  String? policeStation;
  String? obNumber;
  bool placeOfOccurence;
  String county;
  String subCounty;
  String? village;
  String? ward;
  String? location;
  String? subLocation;
  String reportingSubCounty;
  String reportingOrganizationalUnit;
  DateTime? dateCaseReported;
  String country;
  String? city;

  CaseReportingCRSFormModel(
      {required this.originator,
      this.courtName,
      this.courtFileNumber,
      this.reporterPhoneNumber,
      this.reporterFirstName,
      this.reporterLastName,
      this.reporterOtherName,
      this.policeStation,
      this.obNumber,
      required this.placeOfOccurence,
      required this.county,
      required this.subCounty,
      this.village,
      this.ward,
      this.location,
      this.subLocation,
      required this.reportingSubCounty,
      required this.reportingOrganizationalUnit,
      required this.country,
      required this.city,
      required this.dateCaseReported});
}

class InitialChildDetails {
  final String firstName;
  final String surname;
  final String otherNames;
  final String sex;
  final DateTime? dateOfBirth;
  final int age;

  const InitialChildDetails(
      {required this.firstName,
      required this.surname,
      required this.otherNames,
      required this.sex,
      this.dateOfBirth,
      required this.age});
}

class SiblingDetails {
  final int childID;
  final int siblingID;
  final DateTime dateLinked;
  final DateTime? dateUnlinked;
  final String? remarks;

  const SiblingDetails({
    required this.childID,
    required this.siblingID,
    required this.dateLinked,
    this.dateUnlinked,
    this.remarks,
  });

  Map<String, dynamic> toJSON() {
    return {
      "child_person_id": childID,
      "sibling_person_id": siblingID,
      "date_linked": dateLinked, // Date submitted
      "date_delinked": dateUnlinked,
      "remarks": remarks ?? "",
    };
  }
}

class Caregivers {
  final int caregiverCPIMSID;
  final String relationshipType;
  final int personID;
  final String dateLinked;

  const Caregivers(
      {required this.caregiverCPIMSID,
      required this.relationshipType,
      required this.personID,
      required this.dateLinked});
}

class AboutChildCRSFormModel {
  InitialChildDetails initialDetails;
  List<SiblingDetails>? siblingDetails;
  String houseEconomicStatus;
  List<Caregivers>? caregivers;
  List<String> familyStatus;
  List<String>? closeFriends;
  List<String>? hobbies;

  AboutChildCRSFormModel(
      {required this.initialDetails,
      this.siblingDetails,
      required this.houseEconomicStatus,
      required this.familyStatus,
      this.closeFriends,
      this.caregivers,
      this.hobbies});
}

class MedicalCRSFormModel {
  String mentalConditionStatus;
  List<String>? mentalCondition;
  String physicalConditionStatus;
  List<String>? physicalCondition;
  String otherConditionStatus;
  List<String>? otherCondition;

  MedicalCRSFormModel(
      {required this.mentalConditionStatus,
      this.mentalCondition,
      required this.physicalConditionStatus,
      this.physicalCondition,
      required this.otherConditionStatus,
      this.otherCondition});
}

class CRSCategory {
  final String category;
  final List<String>? subcategory;
  final String dateOfEvent;
  final String placeOfEvent;
  final String caseNature;

  const CRSCategory(
      {required this.category,
      this.subcategory,
      required this.dateOfEvent,
      required this.placeOfEvent,
      required this.caseNature});

  Map<String, dynamic> toJSON() {
    return {
      "case_category": category,
      "date_of_event": dateOfEvent,
      "place_of_event": placeOfEvent,
      "case_nature": caseNature
    };
  }
}

class CRSReferrals {
  final String actor;
  final String specify;
  final String reason;

  const CRSReferrals(
      {required this.actor, required this.specify, required this.reason});
}

class Perpetrators {
  final String firstName;
  final String lastName;
  final String? othernames;
  final String? sex;
  final String? relationshipType;
  final DateTime? dateOfBirth;
  final int? age;

  const Perpetrators(
      {required this.firstName,
      this.relationshipType,
      required this.lastName,
      this.othernames,
      this.sex,
      this.dateOfBirth,
      this.age});
}

class CRSReferral {
  String actor;
  String specify;
  String reason;

  CRSReferral(
      {required this.actor, required this.reason, required this.specify});
}

class CaseDataCRSFormModel {
  String serialNumber;
  String? offenderKnown;
  List<CRSCategory> crsCategories;
  String riskLevel;
  bool referralsPresent;
  bool? summonsIssued;
  DateTime? dateOfSummon;
  List<String> immediateNeeds;
  List<String> futureNeeds;
  List<CRSReferral>? referrals;
  List<Perpetrators> perpetrators;
  String caseNarration;

  CaseDataCRSFormModel(
      {required this.serialNumber,
      required this.offenderKnown,
      required this.crsCategories,
      required this.riskLevel,
      required this.referralsPresent,
      required this.summonsIssued,
      this.dateOfSummon,
      this.referrals,
      required this.immediateNeeds,
      required this.futureNeeds,
      required this.caseNarration,
      required this.perpetrators});
}

class CRSForm {
  String caseID;
  String childID;
  CaseReportingCRSFormModel? caseReporting;
  AboutChildCRSFormModel? about;
  MedicalCRSFormModel? medical;
  CaseDataCRSFormModel? caseData;

  CRSForm({
    this.caseReporting,
    this.about,
    this.medical,
    this.caseData,
    required this.caseID,
    required this.childID,
  });

  Map<String, dynamic> toJSON() {
    List<Map<String, dynamic>> siblingJSON;
    if (about?.siblingDetails == null) {
      siblingJSON = [];
    } else {
      siblingJSON = about!.siblingDetails!.map((e) => e.toJSON()).toList();
    }

    List<Map<String, dynamic>> caseCategories;
    if (caseData?.crsCategories == null) {
      caseCategories = [];
    } else {
      caseCategories = caseData!.crsCategories.map((e) => e.toJSON()).toList();
    }

    Map<String, dynamic> jsonToReturn = {};
    jsonToReturn["case_reporter"] = caseReporting?.originator;

    if (caseReporting?.originator == "Court") {
      jsonToReturn["court_name"] = caseReporting?.courtName;
      jsonToReturn["court_file_number"] = caseReporting?.courtFileNumber;
    } else if (caseReporting?.originator == "Police") {
      jsonToReturn["police_station_name"] = caseReporting?.policeStation;
      jsonToReturn['ob_number'] = caseReporting?.obNumber;
    } else if (caseReporting?.originator == "Self") {
      jsonToReturn['reporter_phone_number'] =
          caseReporting?.reporterPhoneNumber;
    } else {
      jsonToReturn['reporter_phone_number'] =
          caseReporting?.reporterPhoneNumber;
      jsonToReturn['reporter_first_name'] = caseReporting?.reporterFirstName;
      jsonToReturn['reporter_surname'] = caseReporting?.reporterLastName;
      jsonToReturn['reporter_othernumber'] = caseReporting?.reporterOtherName;
    }

    jsonToReturn["court_file_number"] = caseReporting?.courtFileNumber;
    jsonToReturn["case_reporter"] = caseReporting?.originator;
    jsonToReturn["case_reporter"] = caseReporting?.originator;
    jsonToReturn["case_reporter"] = caseReporting?.originator;
    jsonToReturn["case_reporter"] = caseReporting?.originator;

    return jsonToReturn;

    // return {
    //   "siblings": siblingJSON,
    //   "physical_condition": medical?.physicalConditionStatus,
    //   "county": caseReporting?.county,
    //   "hh_economic_status": about?.houseEconomicStatus,
    //   "case_id": caseID,
    //   "school_admission_class": "ACPR",
    //   "other_condition": medical?.otherConditionStatus,
    //   "child_sex": about?.initialDetails.sex,
    //   "reporter_first_name": caseReporting?.reporterFirstName,
    //   "ob_number": caseReporting?.obNumber,
    //   "longitude": "34.750397",
    //   "recommendation_bic":
    //       "The matter was referred to SCCO for further interventions and directives ",
    //   "family_status": about?.familyStatus ?? [],
    //   "reporter_other_names": caseReporting?.reporterOtherName,
    //   "case_date": caseReporting?.dateCaseReported,
    //   "organization_unit": caseReporting?.reportingOrganizationalUnit,
    //   "case_reporter": "CRON",
    //   "child_in_school": "AYES",
    //   "tribe": "TRLO",
    //   "sublocation": caseReporting?.subLocation,
    //   "parents": [
    //     {
    //       "alive": "AYES",
    //       "phone": "0735542250",
    //       "surname": "Omondi",
    //       "village": "Kondele",
    //       "first_name": "Bildad"
    //     },
    //     {
    //       "national_id": "34321589",
    //       "phone": "0758483272/0792488479",
    //       "surname": "Opiyo",
    //       "first_name": "Emma"
    //     }
    //   ],
    //   "child_surname": about?.initialDetails.surname,
    //   "case_village": "Kondele ",
    //   "latitude": "-0.109161",
    //   "child_first_name": about?.initialDetails.firstName,
    //   "reporter_telephone": caseReporting?.reporterPhoneNumber,
    //   "court_number": caseReporting?.courtFileNumber,
    //   "child_dob": about?.initialDetails.dateOfBirth,
    //   "perpetrator_status": caseData?.offenderKnown,
    //   "reporter_surname": caseReporting?.reporterLastName,
    //   "case_narration":
    //       "The subject has been engaged in criminal activities; pick pocketing,bhang smoking and gangster ", // Add to bottom of fomr
    //   "court_name": caseReporting?.courtName,
    //   "case_landmark": "Lakebreeze",
    //   "future_needs": "LSES,LSHV,LSRH,LSPS", // Future needs
    //   "immediate_needs": caseData?.immediateNeeds,
    //   "mental_condition": medical?.mentalConditionStatus,
    //   "school_name": "Kosawo Primary school ",
    //   "police_station": caseReporting?.policeStation,
    //   "risk_level": caseData?.riskLevel,
    //   "case_details": caseCategories,
    //   "constituency": caseReporting?.reportingSubCounty,
    //   "reporter_email": null,
    //   "primary_class_level": "CLS3",
    //   "location": caseReporting?.location,
    //   "has_birth_cert": "AYES",
    //   "user": "catieno"
    // };
  }
}
