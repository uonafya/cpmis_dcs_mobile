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

// CCI Transition tools
List<String> yesNoOptions = [
  pleaseSelect,
  "Yes",
  "No",
];

List<String> cciAwareOptions = [
  pleaseSelect,
  "Aware",
  "Moderately Aware",
  "Not Aware",
];

List<String> cciDoneOptions = [
  pleaseSelect,
  "Done",
  "Partly Done",
  "Not Done",
];

List<String> cciDecisionOptions = [
  pleaseSelect,
  "Decision Made",
  "Decision partly Made",
  "Decision not Made",
];

List<String> cciProgramsOptions = [
  pleaseSelect,
  "Child welfare program",
  "Rescue centre",
  "None",
];

List<String> cciSurvivalRightsOptions = [
  pleaseSelect,
  "Health",
  "Nutrition",
  "Shelter and Clothing",
];

List<String> cciDevRightsOptions = [
  pleaseSelect,
  "Education",
  "Leisure, recreation and play",
  "Access to Information",
  "Conscience and religion",
];

List<String> cciProtectRightsOptions = [
  pleaseSelect,
  "Legal aid and awareness",
  "Establishment of children clubs",
  "Family tracing, reunification and reintegration services",
  "Awareness and implementation of programmes on positive parenting",
  "Child labour preventive programmes",
  "Family and community strengthening programmes",
  "Stakeholders /case workers capacity building",
  "Professional individual/ family therapies",
  "Economic empowerment of families",
  "Education support services",
  "Health support services [ ] Promotion of Alternative family and community care-based services/ models",
  "After care/Emergency care services",
  "Online protection",
  "Any other relevant programmes.",
];

List<String> cciParticipateRightsOptions = [
  pleaseSelect,
  "Establishment of talent development programmes to nurture creative skills among children",
  "Advocacy programmes targeting children and their families e.g. Media publications",
  "Establishment of school and community-based child rights clubs",
  "Peer support programmes",
  "Empowerment programmes for children and families with children with disabilities",
  "Life skills development programmes",
  "Creation of child rights clubs to enhance the creativity of children",
  "Any other relevant programmes. ",
];

List<String> cciDisability = [
  pleaseSelect,
  "Children with diabilities only",
  "Children without diabilities only",
  "Both Children with and without diabilities only",
];

const gender = [
  ValueItem<String>(label: "Male", value: "Male"),
  ValueItem<String>(label: "Female", value: "Female"),
  ValueItem<String>(label: "Intersex", value: "Intersex"),
];

// end of variables for CCI Transition tools

List<String> childClass = [
  "Please Select",
  "NOT IN SCHOOL",
  "ECDE - Baby Class",
  "ECDE - Middle Class",
  "ECDE - Pre-Unit Class",
  "Primary - Class 1",
  "Primary - Class 2",
  "Primary - Class 3",
  "Primary - Class 4",
  "Primary - Class 5",
  "Primary - Class 6",
  "Primary - Class 7",
  "Primary - Class 8",
  "Secondary - Form 1",
  "Secondary - Form 2",
  "Secondary - Form 3",
  "Secondary - Form 4",
  "Secondary - Form 5",
  "Secondary - Form 6",
  "University - Year 1",
  "University - Year 2",
  "University - Year 3",
  "University - Year 4",
  "University - Year 5",
  "University - Year 6",
  "Tertiary/Vocational - Year 1",
  "Tertiary/Vocational - Year 2",
  "Tertiary/Vocational - Year 3",
  "Tertiary/Vocational - Year 4",
  "Tertiary/Vocational - Year 5",
  "Unknown"
];
