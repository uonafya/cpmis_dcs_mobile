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
