import 'package:multi_dropdown/models/value_item.dart';

const pleaseSelect = "Please Select";
const pleaseSpecify = "Please specify: ";
const smallSpacing = 8.0;
const mediumSpacing = 20.0;

List<String> countiesOptions = [
  pleaseSelect,
  "Baringo",
  "Bomet",
  "Bungoma",
  "Busia",
  "Elgeyo-Marakwet",
  "Embu",
  "Garissa",
  "Homa Bay",
  "Isiolo",
  "Kajiado",
  "Kakamega",
  "Kericho",
  "Kiambu",
  "Kilifi",
  "Kirinyaga",
  "Kisii",
  "Kisumu",
  "Kitui",
  "Kwale",
  "Laikipia",
  "Lamu",
  "Machakos",
  "Makueni",
  "Mandera",
  "Marsabit",
  "Meru",
  "Migori",
  "Mombasa",
  "Murang'a",
  "Nairobi",
  "Nakuru",
  "Nandi",
  "Narok",
  "Nyamira",
  "Nyandarua",
  "Nyeri",
  "Samburu",
  "Siaya",
  "Taita Taveta",
  "Tana River",
  "Tharaka Nithi",
  "Trans Nzoia",
  "Turkana",
  "Uasin Gishu",
  "Vihiga",
  "Wajir",
  "West Pokot"
];

// subcounties
List<String> subcountiesOptions = [
  pleaseSelect,
  "Baringo Central",
  "Baringo North",
  "Baringo South",
  "Eldama Ravine",
  "Mogotio",
  "Tiaty"
];

// case reporter options
List<String> caseReporterOptions = [
  pleaseSelect,
  "Court",
  "Father",
  "Helpline 116",
  "Mother",
  "Other relatives",
  "Other non-relative(s)",
  "Police",
  "Probation",
  "Self",
  "Chief",
  "Immigration",
  "Labour Officers",
  "Helpline 1195",
  "Service Providers",
  "Ministry of Tourism",
  "Trade Union",
  "Diplomatic missions",
  "Other Government Agencies",
];

// house economic status options
List<String> houseEconomicStatusOptions = [
  pleaseSelect,
  "High Income (Apparent)",
  "Middle Income (Apparent)",
  "Low Income (Apparent)",
  "Unknown",
];

// family status options
const familyStatusOptions = [
  ValueItem<String>(
      label: "Living with adoptive parents",
      value: "Living with adoptive parents"),
  ValueItem<String>(
      label: "Living with biological parents",
      value: "Living with adoptive parents"),
  ValueItem<String>(
      label: "Caregiver is cronically ill",
      value: "Caregiver is cronically ill"),
  ValueItem<String>(
      label: "Caregiver is disabled", value: "Caregiver is disabled"),
  ValueItem<String>(
      label: "Caregiver is more than 6 years old",
      value: "Caregiver is more than 6 years old"),
  ValueItem<String>(
      label: "Living in children home", value: "Living in children home"),
  ValueItem<String>(
      label: "Living with father only", value: "Living with father only"),
  ValueItem<String>(
      label: "In institution with mother (has child mother)",
      value: "In institution with mother (has child mother)"),
  ValueItem<String>(label: "Informal Guardian", value: "Informal Guardian"),
  ValueItem<String>(
    label: "Living in child-headed household (no adult caregiver)",
    value: "Living in child-headed household (no adult caregiver)",
  ),
  ValueItem<String>(
    label: "Living in poor household (destitute)",
    value: "Living in poor household (destitute)",
  ),
  ValueItem<String>(
    label: "Living in the streets",
    value: "Living in the streets",
  ),
  ValueItem<String>(
      label: "Living with mother only", value: "Living with mother only"),
  ValueItem<String>(
      label: "Orphaned (father head)", value: "Orphaned (father head)"),
  ValueItem<String>(
    label: "Orphaned (mother head)",
    value: "Orphaned (mother head)",
  ),
  ValueItem<String>(label: "Other Family Member", value: "Other Family Member"),
  ValueItem<String>(
    label: "Parents not living together",
    value: "Parents not living together",
  ),
  ValueItem<String>(
    label: "Unknown (including abandoned babies)",
    value: "Unknown (including abandoned babies)",
  ),
  ValueItem<String>(
    label: "Living alone",
    value: "Living alone",
  ),
  ValueItem<String>(
    label: "Living with a friend",
    value: "Living with a friend",
  ),
  ValueItem<String>(
    label: "Living in temporal shelter",
    value: "Living in temporal shelter",
  ),
  ValueItem<String>(
    label: "Living in ICP Camp",
    value: "Living in ICP Camp",
  ),
];
