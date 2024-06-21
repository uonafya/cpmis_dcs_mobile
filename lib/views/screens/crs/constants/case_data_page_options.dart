import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

enum AllegedPerpetratorOptions { known, unknown, self, notApplicable }

extension AllegedPerpetratorOptionsExtension on AllegedPerpetratorOptions {
  String get value {
    switch (this) {
      case AllegedPerpetratorOptions.known:
        return "Known";
      case AllegedPerpetratorOptions.notApplicable:
        return "Not Applicable";
      case AllegedPerpetratorOptions.self:
        return "Self";
      case AllegedPerpetratorOptions.unknown:
        return "Unknown";
      default:
        throw "Unsupported type";
    }
  }
}

List<String> perpetratorOptions = [
  pleaseSelect,
  AllegedPerpetratorOptions.known.value,
  AllegedPerpetratorOptions.unknown.value,
  AllegedPerpetratorOptions.self.value,
  AllegedPerpetratorOptions.notApplicable.value
];

enum LowMedHigh { low, medium, high }

extension LowMediumHighExtension on LowMedHigh {
  String get value {
    switch (this) {
      case LowMedHigh.high:
        return "High";
      case LowMedHigh.medium:
        return "Medium";
      case LowMedHigh.low:
        return "Low";
      default:
        throw "Unsupported Error";
    }
  }
}

List<String> lowMedHighList = [
  pleaseSelect,
  LowMedHigh.high.value,
  LowMedHigh.medium.value,
  LowMedHigh.low.value
];

enum YesNo { yes, no }

extension YesNoExtension on YesNo {
  String get value {
    switch (this) {
      case YesNo.no:
        return "no";
      case YesNo.yes:
        return "yes";
      default:
        throw "Unsupported Error";
    }
  }
}

List<String> yesNoList = [pleaseSelect, YesNo.no.value, YesNo.yes.value];

const immediateNeedsOptions = [
  ValueItem<String>(label: "Accompany / Support", value: "support"),
  ValueItem<String>(
      label: "Accomodation in Children's Home", value: "children"),
  ValueItem<String>(label: "Accomodation with foster parent", value: "foster"),
  ValueItem<String>(
      label: "Emergency Accomodation (Other)", value: "emergency"),
  ValueItem<String>(
      label: "Accomodation in Safe House/Emergency Shelter",
      value: "accomodation"),
  ValueItem<String>(label: "Clothing", value: "clothing"),
  ValueItem<String>(label: "Counseling", value: "counseling"),
  ValueItem<String>(label: "Food", value: "food"),
  ValueItem<String>(label: "Medical Testing / Examination", value: "medical"),
  ValueItem<String>(label: "Medical Treatement (incident)", value: "incident"),
  ValueItem<String>(label: "Medical Treatement (other)", value: "other"),
  ValueItem<String>(label: "Transport", value: "transport"),
  ValueItem<String>(label: "Rescue from Harm", value: "rescue"),
  ValueItem<String>(label: "Not Applicable", value: "notApplicable"),
  ValueItem<String>(label: "Resettlement", value: "resettlement"),
];

const futureNeedsOptions = [
  ValueItem<String>(label: "Educational Support", value: "educational"),
  ValueItem<String>(label: "Family Tracing & Reunification", value: "family"),
  ValueItem<String>(label: "Home Visit (Support)", value: "home"),
  ValueItem<String>(label: "Income Generation Support", value: "income"),
  ValueItem<String>(label: "Rehabilitation School", value: "rehab"),
  ValueItem<String>(label: "Placement (Children Home)", value: "children"),
  ValueItem<String>(label: "Placement (Fostering)", value: "fostering"),
  ValueItem<String>(label: "Placement (School)", value: "school"),
  ValueItem<String>(
      label: "Placement (Vocational Training)", value: "vocational"),
  ValueItem<String>(label: "Psycho-Social Counseling", value: "psycho"),
  ValueItem<String>(label: "Placement (Adoptive Parents)", value: "adoptive"),
  ValueItem<String>(label: "Resettlement", value: "res"),
  ValueItem<String>(
      label: "Support with Health Insurance Registeration", value: "insurance"),
  ValueItem<String>(
      label: "Provided with information on child rights and responses",
      value: "child_rights"),
  ValueItem<String>(
      label: "Child living with disability referred and linked to app",
      value: "disablility"),
];

const List<String> relationshipToChildOptions = [
  pleaseSelect,
  "None",
  "Adoptive father",
  "Adoptive mother",
  "Foster father",
  "Foster mother",
  "Other Relative",
  "Parent (father)",
  "Parent (mother)",
  "Guardian",
  "Next of kin",
  "Other"
];

const List<String> additionalRelationshipToChildOptions = [
  pleaseSelect,
  "Commercial Drivers",
  "Employer",
  "Friend",
  "Healthcare Worker",
  "Local influentials",
  "Neighbour",
  "Other non-family",
  "Other family member",
  "Other Humanitarian Worker",
  "Other Primary Care Giver/Guardian",
  "Other Persion in positions of authority",
  "Parent",
  "Religious Leader",
  "Security Guards",
  "Security Personnel / Disciplined force member",
  "Strangers",
  "Teachers",
  "Tourist",
  "Unkown/Not Recorded"
];

String childCustodyOption = "Custody";
String childDefilementOption = "Defilement";
String childOnStreetOption = "Children/Persons on the streets";
String childTruancyOption = "Child Truancy";
String childOffenderOption = "Child offender";
String childLabourOption = "Child labour";

List<String> caseCategoryOptions = [
  pleaseSelect,
  "Abandoned",
  "Abduction",
  "Child Affected by HIV/AIDS",
  "Child Delinquency",
  "Child headed household",
  "Child labour",
  "Child marriage",
  "Child of imprisoned marriage",
  childOffenderOption,
  "Child out of school",
  "Child pregnancy",
  "Child radicalization",
  childTruancyOption,
  "Child with disability",
  childOnStreetOption,
  childCustodyOption,
  childDefilementOption,
  "Disputed paternity"
];

const List<ValueItem<String>> caseNatureOptions = [
  ValueItem<String>(label: "Chronic/ On-going event", value: "chronic"),
  ValueItem<String>(label: "One-off event", value: "one"),
  ValueItem<String>(label: "Emergency", value: "emergency")
];

const List<ValueItem<String>> placeOfEventOptions = [
  ValueItem<String>(label: "During a Cultural/Sporting Event", value: "event"),
  ValueItem<String>(label: "Care and Justice Institutions", value: "justice"),
  ValueItem<String>(label: "Health Facility", value: "health"),
  ValueItem<String>(label: "Home & Family", value: "family"),
  ValueItem<String>(label: "On public transport", value: "public"),
  ValueItem<String>(label: "On the Street", value: "street"),
  ValueItem<String>(label: "Other community event", value: "other_event"),
  ValueItem<String>(
      label: "Place of worship/Religious Center", value: "religious"),
  ValueItem<String>(label: "Places of Work", value: "work"),
  ValueItem<String>(
      label: "School and Educational Settings", value: "educational"),
  ValueItem<String>(
      label: "Using public toilets or washing places", value: "toilets"),
  ValueItem<String>(label: "Walking Locally", value: "walking"),
  ValueItem<String>(
      label: "Working for the family outside the home", value: "family"),
];

const List<ValueItem<String>> childLabourSubCategoryOptions = [
  ValueItem<String>(label: "Albinism", value: "albinism"),
];

const List<ValueItem<String>> childOffenderSubcategories = [
  ValueItem<String>(label: "Loitering", value: "loitering"),
  ValueItem<String>(label: "House Breaking / Burglary", value: "buglary"),
  ValueItem<String>(label: "Handling food", value: "food"),
  ValueItem<String>(label: "Removing forest products", value: "forest"),
  ValueItem<String>(label: "Creating disturbance", value: "disturbance"),
  ValueItem<String>(label: "Preparing to commit felony", value: "preparing"),
  ValueItem<String>(label: "Child Trafficking", value: "trafficking"),
  ValueItem<String>(label: "Grevious bodily harm", value: "grevious"),
  ValueItem<String>(label: "Lack of driving license", value: "driving"),
  ValueItem<String>(label: "Impregnated child", value: "impregnated"),
  ValueItem<String>(label: "Being unlawfully in Kenya", value: "unlawfully"),
  ValueItem<String>(label: "Other indecent act", value: "indecent"),
  ValueItem<String>(label: "Labour", value: "labour"),
  ValueItem<String>(label: "Albinism", value: "albinism"),
];

const List<ValueItem<String>> childTruancyOptions = [
  ValueItem<String>(label: "Below School Age", value: "below"),
  ValueItem<String>(label: "Care Givers Decision", value: "decision"),
  ValueItem<String>(
      label: "Childs Care Responsibility", value: "responsibility"),
  ValueItem<String>(label: "Childs Preference", value: "preference"),
  ValueItem<String>(label: "Disability / Chronic Illness", value: "disability"),
  ValueItem<String>(label: "Exclusion (ability)", value: "ability"),
  ValueItem<String>(label: "Exclusion (behaviour)", value: "behaviour"),
  ValueItem<String>(label: "Family Poverty", value: "poverty"),
  ValueItem<String>(label: "Engaged in child labour", value: "labour"),
  ValueItem<String>(label: "Other", value: "other"),
  ValueItem<String>(label: "Unkown/Not Recorded", value: "unknown"),
];

const List<ValueItem<String>> childOnStreetOptions = [
  ValueItem<String>(label: "Street living", value: "living"),
  ValueItem<String>(label: "Street Working", value: "working"),
  ValueItem<String>(label: "From Street Family", value: "family"),
];

const List<ValueItem<String>> childCustodyOptions = [
  ValueItem<String>(label: "Access Denied", value: "denied"),
  ValueItem<String>(label: "Guardianship", value: "guardianship"),
  ValueItem<String>(label: "Disputed Custody", value: "disputed"),
];

const List<ValueItem<String>> childDefilementOptions = [
  ValueItem<String>(label: "Defilement Victim", value: "victim"),
  ValueItem<String>(label: "Defilement Offender", value: "offender")
];

List<String> referralActorOptions = [
  "State",
];

List<String> specifyOptions = [
  "State",
];

List<String> reasonOptions = [
  "State",
];

List<String> sexOptions = [pleaseSelect, "Male", "Female", "Other"];

YesNo boolToYesNo(bool? item) {
  if (item == true) {
    return YesNo.yes;
  }
  return YesNo.no;
}
