import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

enum MentalConditionOptions { normal, challengeVerifed, challengeUnverified }

extension MentalConditionsExtension on MentalConditionOptions {
  String get value {
    switch (this) {
      case MentalConditionOptions.challengeUnverified:
        return "Challenged (unverified)";
      case MentalConditionOptions.challengeVerifed:
        return "Challenged (verified)";
      case MentalConditionOptions.normal:
        return "Appears Normal";
      default:
        throw "Unsupported value";
    }
  }
}

List<String> mentalConditionOptions = [
  pleaseSelect,
  MentalConditionOptions.normal.value,
  MentalConditionOptions.challengeUnverified.value,
  MentalConditionOptions.challengeVerifed.value,
];

enum PhysicalConditionOptions {
  normal,
  challengedVerified,
  challengeUnverified
}

extension PhysicalConditionExtension on PhysicalConditionOptions {
  String get value {
    switch (this) {
      case PhysicalConditionOptions.challengeUnverified:
        return "Challenged (unverified)";
      case PhysicalConditionOptions.challengedVerified:
        return "Challenged (verified)";
      case PhysicalConditionOptions.normal:
        return "Appears normal";
      default:
        throw "Unsupported value";
    }
  }
}

List<String> physicalConditionOptions = [
  pleaseSelect,
  PhysicalConditionOptions.normal.value,
  PhysicalConditionOptions.challengedVerified.value,
  PhysicalConditionOptions.challengeUnverified.value
];

enum OtherConditionOptions { chronic, normal }

extension OtherConditionExtension on OtherConditionOptions {
  String get value {
    switch (this) {
      case OtherConditionOptions.chronic:
        return "Chronic";
      case OtherConditionOptions.normal:
        return "Appears Normal";
      default:
        throw "Unsupported value";
    }
  }
}

List<String> otherConditionOptions = [
  pleaseSelect,
  OtherConditionOptions.chronic.value,
  OtherConditionOptions.normal.value
];

const possibleMentalChallenges = [
  ValueItem<String>(label: "Autism", value: "autism"),
  ValueItem<String>(label: "Bipolar Disease", value: "bipolar"),
  ValueItem<String>(label: "Dementia", value: "dementia"),
  ValueItem<String>(
      label: "Learning disabilities", value: "learning_disabilities"),
  ValueItem<String>(label: "Downs Syndrome", value: "downs"),
  ValueItem<String>(label: "Mental Impairement", value: "mental"),
  ValueItem<String>(
      label: "Hyper-kinetic disorder (Violent or Challenging Behaviour)",
      value: "hyper_kinetic"),
  ValueItem<String>(label: "Psychosis", value: "psychosis"),
  ValueItem<String>(label: "Schizophrenia", value: "schizophrenia"),
];

const possiblePhysicalChallenges = [
  ValueItem<String>(label: "Albinism", value: "albinism"),
  ValueItem<String>(label: "Hearing Impairment (Deaf)", value: "deaf"),
  ValueItem<String>(label: "Multiple disabilities", value: "multiple"),
  ValueItem<String>(label: "Physical", value: "physical"),
  ValueItem<String>(label: "Speech", value: "speech"),
  ValueItem<String>(label: "Visual - Partial Blindness", value: "partial"),
  ValueItem<String>(label: "Visual - Total Blindness", value: "total")
];

const possibleOtherChallenges = [
  ValueItem<String>(label: "Asthma", value: "asthma"),
  ValueItem<String>(label: "Cancer - All lymphonas", value: "lymphonas"),
  ValueItem<String>(
      label: "Cancer - Bone and articular cartilage", value: "bone"),
  ValueItem<String>(label: "Cancer - eye", value: "eye"),
  ValueItem<String>(label: "Cancer - Leukemia", value: "leukemia"),
  ValueItem<String>(label: "Cancer - skin melanoma", value: "melanoma"),
  ValueItem<String>(label: "Cerebral palsy", value: "palsy"),
  ValueItem<String>(
      label:
          "Cystic fibrosis (genetic disorder of the respiratory digestive and reproductive system)",
      value: "cystic"),
  ValueItem<String>(label: "Diabetes Type 1", value: "diabetes1"),
  ValueItem<String>(label: "Diabetes Type 2", value: "diabetes2"),
  ValueItem<String>(label: "Epilepsy", value: "epilepsy"),
  ValueItem<String>(label: "Heart Diseases", value: "heart"),
  ValueItem<String>(label: "HIV/AIDS", value: "hiv"),
  ValueItem<String>(label: "Hydrocephalus", value: "hydro"),
  ValueItem<String>(label: "Other chronic illness", value: "chronic"),
  ValueItem<String>(label: "Sickle Cell Anemia", value: "sicke"),
  ValueItem<String>(label: "TB", value: "TB"),
];
