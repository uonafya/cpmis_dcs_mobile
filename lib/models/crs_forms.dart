import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/constants/convert_date_to_YMD.dart';
import 'package:cpims_dcs_mobile/core/network/http_client.dart';

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
  final int? age;

  const InitialChildDetails(
      {required this.firstName,
      required this.surname,
      required this.otherNames,
      required this.sex,
      this.dateOfBirth,
      this.age});
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
    var json = {
      "case_category": category,
      "date_of_event": dateOfEvent,
      "place_of_event": placeOfEvent,
      "case_nature": caseNature
    };
    json['case_subcategories'] = subcategory.toString();
    return json;
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

  Map<String, dynamic> toJSON() {
    var json =  {
      "relationship_to_child": relationshipType,
      "first_name": firstName,
      "surname": lastName,
      "other_names": othernames
    };

    if (dateOfBirth != null) {
      json['date_of_birth'] = dateOfBirth!.toIso8601String();
    }
    if (sex != null) {
      json['sex'] = sex;
    }
    return json;
  }
}

class CRSReferral {
  String actor;
  String specify;
  String reason;

  CRSReferral(
      {required this.actor, required this.reason, required this.specify});

  Map<String, dynamic> toJSON() {
    return {
      "actor": actor,
      "specify": specify,
      "reason": reason
    };
  }
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

    if(caseReporting?.placeOfOccurence == true) {
      jsonToReturn['country'] = "Kenya";
      jsonToReturn['county'] = caseReporting?.county;
      jsonToReturn['sub_county'] = caseReporting?.subCounty;

      if(caseReporting?.ward != null) {
        jsonToReturn['ward'] = caseReporting?.ward;
      }

      if(caseReporting?.village != null) {
        jsonToReturn['village'] = caseReporting?.village;
      }

      if(caseReporting?.location != null) {
        jsonToReturn['location'] = caseReporting?.location;
      }

      if(caseReporting?.subLocation != null) {
        jsonToReturn['sub_location'] = caseReporting?.subLocation;
      }

    } else {
      jsonToReturn['country'] = caseReporting?.country;
      jsonToReturn['city'] = caseReporting?.city;
    }

    jsonToReturn['reporting_sub_county'] = caseReporting?.reportingSubCounty;
    jsonToReturn['reporting_orgunit'] =
        caseReporting?.reportingOrganizationalUnit;
    jsonToReturn['date_case_reported'] = caseReporting?.dateCaseReported;

    jsonToReturn['child'] = {};
    jsonToReturn['siblings'] = [];
    jsonToReturn['caregivers'] = [];
    jsonToReturn['house_economic_status'] = about?.houseEconomicStatus;
    jsonToReturn['family_status'] = about?.familyStatus;

    if(about?.closeFriends != null && about!.closeFriends!.isNotEmpty) {
      jsonToReturn['close_friends'] = about?.closeFriends;
    }

    if(about?.hobbies != null && about!.hobbies!.isNotEmpty) {
      jsonToReturn['hobbies'] = about?.hobbies;
    }

    jsonToReturn['medical_condition'] = medical?.mentalConditionStatus;
    if (medical?.mentalConditionStatus == "verified") {
      jsonToReturn['medical_conditions'] = medical?.mentalCondition;
    }
    jsonToReturn['physical_condition'] = medical?.physicalCondition;
    if (medical?.physicalConditionStatus == "verified") {
      jsonToReturn['physical_conditions'] = medical?.physicalCondition;
    }
    jsonToReturn['other_condition'] = medical?.otherConditionStatus;
    if (medical?.otherConditionStatus == "verified") {
      jsonToReturn['other_conditions'] = medical?.otherCondition;
    }

    jsonToReturn['case_serial_number'] = caseData?.serialNumber;
    jsonToReturn['offender_known'] = caseData?.offenderKnown;

    if(caseData?.offenderKnown == "Known") {
      jsonToReturn['perpetrators'] = caseData?.perpetrators.map((e) => e.toJSON).toList();
    }

    jsonToReturn['case_categories'] = caseData?.crsCategories.map((e) => e.toJSON()).toList();
    jsonToReturn['risk_level'] = caseData?.riskLevel;

    if (caseData?.referralsPresent == true) {
      jsonToReturn['referrals'] = caseData?.referrals?.map((e) => e.toJSON()).toList();
    }

    if (caseData?.summonsIssued == true) {
      jsonToReturn['date_of_summon'] = caseData?.dateOfSummon;
    }

    jsonToReturn['immediate_needs'] = caseData?.immediateNeeds;
    jsonToReturn['future_needs'] = caseData?.futureNeeds;

    return jsonToReturn;
  }

  Future<void> sendToUpstream() async{
    try {
      // Convert to JSON
      var json = toJSON();

      // Submit
      var request = await httpClient.request("${cpimsApiUrl}mobile/crs/", "POST", json);
      print("Submitted Succesfully");
    } catch(err) {
      throw "Could Not Send To Upstream";
    }
  }
}
