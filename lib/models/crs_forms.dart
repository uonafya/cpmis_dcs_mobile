class CaseReportingCRSFormModel {
  final String originator;
  final String? courtName;
  final String? courtFileNumber;
  final String? reporterPhoneNumber;
  final String? reporterFirstName;
  final String? reporterLastName;
  final String? reporterOtherName;
  final String? policeStation;
  final String? obNumber;
  final bool placeOfOccurence;
  final String county;
  final String subCounty;
  final String? village;
  final String? ward;
  final String? location;
  final String? subLocation;
  final String reportingSubCounty;
  final String reportingOrganizationalUnit;
  final DateTime dateCaseReported;
  final String country;
  final String? city;

  const CaseReportingCRSFormModel(
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
  final bool isVoid;

  const SiblingDetails(
      {required this.childID,
      required this.siblingID,
      required this.dateLinked,
      this.dateUnlinked,
      this.remarks,
      required this.isVoid});
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
  final InitialChildDetails initialDetails;
  final List<SiblingDetails>? siblingDetails;
  final String houseEconomicStatus;
  final List<Caregivers>? caregivers;
  final List<String> familyStatus;
  final List<String>? closeFriends;
  final List<String>? hobbies;

  const AboutChildCRSFormModel(
      {required this.initialDetails,
      this.siblingDetails,
      required this.houseEconomicStatus,
      required this.familyStatus,
      this.closeFriends,
      this.caregivers,
      this.hobbies});
}

class MedicalCRSFormModel {
  final String mentalConditionStatus;
  final List<String>? mentalCondition;
  final String physicalConditionStatus;
  final List<String>? physicalCondition;
  final String otherConditionStatus;
  final List<String>? otherCondition;

  const MedicalCRSFormModel(
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

class CaseDataCRSFormModel {
  final String serialNumber;
  final String offenderKnown;
  final List<CRSCategory> crsCategories;
  final String riskLevel;
  final bool referralsPresent;
  final bool summonsIssued;
  final DateTime? dateOfSummon;
  final List<String> immediateNeeds;
  final List<String> futureNeeds;
  final List<String> perpetrators;

  const CaseDataCRSFormModel(
      {required this.serialNumber,
      required this.offenderKnown,
      required this.crsCategories,
      required this.riskLevel,
      required this.referralsPresent,
      required this.summonsIssued,
      this.dateOfSummon,
      required this.immediateNeeds,
      required this.futureNeeds,
      required this.perpetrators});
}

class CRSForm {
  CaseReportingCRSFormModel? caseReporting;
  AboutChildCRSFormModel? about;
  MedicalCRSFormModel? medical;
  CaseDataCRSFormModel? caseData;

  CRSForm(
      {
      this.caseReporting,
      this.about,
      this.medical,
      this.caseData});
}
