import 'package:cpims_dcs_mobile/controller/metadata_manager.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/constants/convert_date_to_YMD.dart';
import 'package:cpims_dcs_mobile/core/network/http_client.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/medical_page_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

abstract class BaseCRSFormModel {
  late String firstName;
  late String surName;
  String? otherNames;
  DateTime? dateOfBirth;
  late String sex;

  Map<String, dynamic> toJSON();

  BaseCRSFormModel(
      {required this.firstName,
      required this.surName,
      this.otherNames,
      required this.dateOfBirth,
      required this.sex});
}

class InitialChildDetails extends BaseCRSFormModel {
  final int? age;
  final String? currentClass;
  final String? remarks;

  InitialChildDetails(
      {required super.firstName,
      required super.surName,
      super.otherNames,
      required DateTime super.dateOfBirth,
      required super.sex,
      this.age,
      this.currentClass,
      this.remarks});

  @override
  Map<String, dynamic> toJSON() {
    var metadata = MetadataManager.getInstance();
    return {
      "first_name": firstName,
      "surname": surName,
      "other_names": otherNames,
      "sex": metadata.getSexValue(sex),
      "date_of_birth": convertDateToYMD(dateOfBirth),
      "age": age,
      "current_class": metadata.getChildClassValue(currentClass ?? ""),
      "remarks": remarks
    };
  }
}

class SiblingDetails extends BaseCRSFormModel {
  final String? id;
  final DateTime dateLinked;
  final DateTime? dateUnlinked;
  final int? age;
  final String? currentClass;
  final String? remarks;

  SiblingDetails(
      {required super.firstName,
      this.id,
      required super.surName,
      super.otherNames,
      required DateTime super.dateOfBirth,
      required super.sex,
      this.age,
      this.currentClass,
      this.remarks,
      required this.dateLinked,
      this.dateUnlinked});

  @override
  Map<String, dynamic> toJSON() {
    var metadata = MetadataManager.getInstance();
    return {
      "first_name": firstName,
      "surname": surName,
      "other_names": otherNames,
      "sex": metadata.getSexValue(sex),
      "date_of_birth": convertDateToYMD(dateOfBirth),
      "age": age,
      "current_class": metadata.getChildClassValue(currentClass ?? ""),
      "remarks": remarks,
      "date_linked": convertDateToYMD(dateLinked),
      "date_unlinked": convertDateToYMD(dateUnlinked)
    };
  }
}

class Caregivers extends BaseCRSFormModel {
  final String relationshipToChild;
  final String nationalIdNumber;
  final String? phoneNumber;

  Caregivers(
      {required super.firstName,
      required super.surName,
      super.otherNames,
      required DateTime super.dateOfBirth,
      required super.sex,
      required this.relationshipToChild,
      required this.nationalIdNumber,
      this.phoneNumber});

  @override
  Map<String, dynamic> toJSON() {
    var metadata = MetadataManager.getInstance();
    return {
      "first_name": firstName,
      "surname": surName,
      "other_names": otherNames,
      "sex": metadata.getSexValue(sex),
      "date_of_birth": convertDateToYMD(dateOfBirth),
      "relationship_to_child":
          metadata.getrelationshiptype(relationshipToChild),
      "national_id_number": nationalIdNumber,
      "phone_number": phoneNumber
    };
  }
}

class AboutChildCRSFormModel {
  String id;
  bool isNewChild;
  InitialChildDetails initialDetails;
  List<SiblingDetails>? siblingDetails;
  String houseEconomicStatus;
  List<Caregivers>? caregivers;
  List<String> familyStatus;
  List<String>? closeFriends;
  List<String>? hobbies;

  AboutChildCRSFormModel(
      {required this.initialDetails,
      required this.id,
      required this.isNewChild,
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
    var metadata = MetadataManager.getInstance();
    var json = {
      "case_category": metadata.getCategoryValue(category),
      "date_of_event": dateOfEvent,
      "place_of_event": metadata.getplaceOfEvent(placeOfEvent),
      "case_nature": metadata.getcaseNature(placeOfEvent)
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
    var metadata = MetadataManager.getInstance();
    var json = {
      "relationship_to_child":
          metadata.getrelationshiptype(relationshipType ?? ""),
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
    var metadata = MetadataManager.getInstance();
    return {
      "actor": metadata.getreferralDestinationID(actor),
      "specify": metadata.getreferralDestinationClassification(specify),
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
  String? formID;
  DateTime startTime;
  String longitude;
  String latitude;
  DateTime endTime;
  CaseReportingCRSFormModel? caseReporting;
  AboutChildCRSFormModel? about;
  MedicalCRSFormModel? medical;
  CaseDataCRSFormModel? caseData;

  CRSForm(
      {this.caseReporting,
      this.about,
      this.medical,
      required this.startTime,
      required this.endTime,
      required this.latitude,
      required this.longitude,
      this.caseData,
      this.formID});

  Map<String, dynamic> toJSON() {
    MetadataManager metadata = MetadataManager.getInstance();

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
    jsonToReturn["case_reporter"] =
        metadata.getReporterValue(caseReporting?.originator ?? "");
    jsonToReturn['startTime'] = startTime.toIso8601String();
    jsonToReturn['endTime'] = endTime.toIso8601String();
    jsonToReturn['latitiude'] = latitude;
    jsonToReturn['longitude'] = longitude;

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

    if (caseReporting?.placeOfOccurence == true) {
      jsonToReturn['country'] = "KE";
      jsonToReturn['county'] = caseReporting?.county;
      jsonToReturn['sub_county'] = caseReporting?.subCounty;

      if (caseReporting?.ward != null) {
        jsonToReturn['ward'] = caseReporting?.ward;
      }

      if (caseReporting?.village != null) {
        jsonToReturn['village'] = caseReporting?.village;
      }

      if (caseReporting?.location != null) {
        jsonToReturn['location'] = caseReporting?.location;
      }

      if (caseReporting?.subLocation != null) {
        jsonToReturn['sub_location'] = caseReporting?.subLocation;
      }
    } else {
      jsonToReturn['country'] = caseReporting?.country;
      jsonToReturn['city'] = caseReporting?.city;
    }

    jsonToReturn['reporting_sub_county'] = caseReporting?.reportingSubCounty;
    jsonToReturn['reporting_orgunit'] =
        caseReporting?.reportingOrganizationalUnit;
    jsonToReturn['date_case_reported'] =
        convertDateToYMD(caseReporting?.dateCaseReported);

    jsonToReturn['child'] =
        about?.initialDetails == null ? {} : about!.initialDetails.toJSON();

    if (about?.siblingDetails != null) {
      jsonToReturn['siblings'] = [
        for (var i = 0; i < about!.siblingDetails!.length; i++)
          about!.siblingDetails![i].toJSON()
      ];
    }

    if (about?.caregivers != null) {
      jsonToReturn['caregivers'] = [
        for (var i = 0; i < about!.caregivers!.length; i++)
          about!.caregivers![i].toJSON()
      ];
    }
    jsonToReturn['house_economic_status'] =
        metadata.gethouseholdEconomics(about?.houseEconomicStatus ?? "");

    if (about?.familyStatus != null) {
      List<String> familyStatusCodes = [];
      for (var i = 0; i < about!.familyStatus.length; i++) {
        var stat = about!.familyStatus[i];
        familyStatusCodes.add(metadata.getfamilyStatus(stat));
      }
      jsonToReturn['family_status'] = familyStatusCodes;
    }

    if (about?.closeFriends != null && about!.closeFriends!.isNotEmpty) {
      jsonToReturn['close_friends'] = about?.closeFriends;
    }

    if (about?.hobbies != null && about!.hobbies!.isNotEmpty) {
      jsonToReturn['hobbies'] = about?.hobbies;
    }

    jsonToReturn['medical_condition'] = medical?.mentalConditionStatus;
    if (medical?.mentalConditionStatus ==
        MentalConditionOptions.challengeVerifed.value) {
      if (medical?.mentalCondition != null) {
        List<String> ments = [];
        for (var i = 0; i < medical!.mentalCondition!.length; i++) {
          var stat = medical!.mentalCondition![i];
          ments.add(metadata.getmentalSubCondition(stat));
        }
        jsonToReturn['medical_conditions'] = ments;
      }
    }
    jsonToReturn['physical_condition'] = medical?.physicalCondition;
    if (medical?.physicalConditionStatus ==
        PhysicalConditionOptions.challengedVerified.value) {
      if (medical?.physicalCondition != null) {
        List<String> ments = [];
        for (var i = 0; i < medical!.physicalCondition!.length; i++) {
          var stat = medical!.physicalCondition![i];
          ments.add(metadata.getphysicalSubCondition(stat));
        }
        jsonToReturn['physical_conditions'] = ments;
      }
    }
    jsonToReturn['other_condition'] = medical?.otherConditionStatus;
    if (medical?.otherConditionStatus == OtherConditionOptions.chronic.value) {
      if (medical?.otherCondition != null) {
        List<String> ments = [];
        for (var i = 0; i < medical!.otherCondition!.length; i++) {
          var stat = medical!.otherCondition![i];
          ments.add(metadata.getotherSubcondition(stat));
        }
        jsonToReturn['other_conditions'] = ments;
      }
    }

    jsonToReturn['case_serial_number'] = caseData?.serialNumber;
    jsonToReturn['offender_known'] =
        metadata.getperpetratorStatus(caseData?.offenderKnown ?? "");

    if (caseData?.offenderKnown == "Known") {
      jsonToReturn['perpetrators'] =
          caseData?.perpetrators.map((e) => e.toJSON()).toList();
    }

    jsonToReturn['case_categories'] =
        caseData?.crsCategories.map((e) => e.toJSON()).toList();
    jsonToReturn['risk_level'] = caseData?.riskLevel;

    if (caseData?.referralsPresent == true) {
      jsonToReturn['referrals'] =
          caseData?.referrals?.map((e) => e.toJSON()).toList();
    }

    if (caseData?.summonsIssued == true) {
      jsonToReturn['date_of_summon'] = convertDateToYMD(caseData?.dateOfSummon);
    }

    jsonToReturn['immediate_needs'] = caseData?.immediateNeeds;
    jsonToReturn['future_needs'] = caseData?.futureNeeds;

    if (caseData?.immediateNeeds != null) {
      List<String> codes = [];
      for (var i = 0; i < caseData!.immediateNeeds.length; i++) {
        var stat = caseData!.immediateNeeds[i];
        codes.add(metadata.getimmediateNeed(stat));
      }
      jsonToReturn['immediate_needs'] = codes;
    }

    if (caseData?.futureNeeds != null) {
      List<String> codes = [];
      for (var i = 0; i < caseData!.futureNeeds.length; i++) {
        var stat = caseData!.futureNeeds[i];
        codes.add(metadata.getlongTermSupport(stat));
      }
      jsonToReturn['future_needs'] = codes;
    }

    return jsonToReturn;
  }

  Future<void> sendToUpstream() async {
    try {
      // Convert to JSON
      var json = toJSON();

      // Submit
      var request =
          await httpClient.request("${cpimsApiUrl}mobile/crs/", "POST", json);
      print("Submitted Succesfully");
    } catch (err) {
      throw "Could Not Send To Upstream";
    }
  }
}
