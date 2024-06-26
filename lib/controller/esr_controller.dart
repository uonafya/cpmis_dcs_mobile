// ignore_for_file: use_build_context_synchronously

import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/models/esr_form_model.dart';
import 'package:cpims_dcs_mobile/views/screens/esr/esr_form.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ESRController with ChangeNotifier {
  final householdGeolocationFormKey = GlobalKey<FormState>();
  final householdDemographicFormKey = GlobalKey<FormState>();
  final benefitsFormKey = GlobalKey<FormState>();
  final familyFormKey = GlobalKey<FormState>();

  List<Map<String, dynamic>> familyMembers = [];
  List<Map<String, dynamic>> familyMembersDetails = [];
  String selectedCounty = 'Please select';
  int selectedIndex = 0;

  String selectedSubCounty = 'Please select';
  String location = 'Please select';
  String selectedSubLocation = 'Please select';
  String selectedVillage = 'Please select';
  final villageElderController = TextEditingController();
  final nearestChurchMosqueController = TextEditingController();
  final nearestSchoolController = TextEditingController();
  final yearsController = TextEditingController();
  final monthsController = TextEditingController();
  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final surnameController = TextEditingController();

  String doesHaveId = 'Type';
  String relationship = "Please select";
  String sex = "Please select";
  String? dateOfBirth;
  String maritalStatus = "Please select";
  String doesSufferChronic = "Please select";
  String disabilityRequire24Care = "Please select";
  String typeOfDisability = "Please select";
  String learningInstitution = "Please select";
  String highestLearning = "Please select";
  String doingLast = "Please select";
  String hasFormalJob = "Please select";
  String recommendSupport = "Please select";
  final memberCaregiver = TextEditingController();
  final specifiedBenefit = TextEditingController();
  final specifyInKindController = TextEditingController();
  String kindOfBenefits = 'Please select';
  String householdReceivingBenefits = 'Please select';

  bool get showMainCareGiver {
    if (dateOfBirth == null) {
      return false;
    }

    final date = DateTime.parse(dateOfBirth!);
    //Check if dob is <17 or above 65
    final age = DateTime.now().difference(date).inDays ~/ 365;
    if ((age < 18 || age > 65) && disabilityRequire24Care == "Yes") {
      return true;
    }
    return false;
  }

  int get age {
    if (dateOfBirth == null) {
      return 0;
    }

    final date = DateTime.parse(dateOfBirth!);
    //Check if dob is <17 or above 65
    return DateTime.now().difference(date).inDays ~/ 365;
  }

  void addFamilyMember(Map<String, dynamic> member) {
    familyMembers.add(member);
    notifyListeners();
  }

  void removeFamilyMember(Map<String, dynamic> member) {
    familyMembers.remove(member);
    notifyListeners();
  }

  void addFamilyMemberDetails() {
    if (!familyFormKey.currentState!.validate()) {
      return;
    }
    final family = {
      "doesHaveId": doesHaveId,
      "relationship": relationship,
      "sex": sex,
      "date_of_birth": dateOfBirth,
      "marital_status": maritalStatus,
      "does_suffer_chronic": doesSufferChronic,
      "disability_require_24_care": disabilityRequire24Care,
      "type_of_disability": typeOfDisability,
      "learning_institution": learningInstitution,
      "highest_learning": highestLearning,
      "doing_last": doingLast,
      "has_formal_job": hasFormalJob,
      "recommend_support": recommendSupport,
      "main_caregiver": memberCaregiver.text
    };
    familyMembersDetails.add(family);
    memberCaregiver.clear();
    doesHaveId = 'Type';
    relationship = "Please select";
    sex = "Please select";
    dateOfBirth = null;
    maritalStatus = "Please select";
    doesSufferChronic = "Please select";
    disabilityRequire24Care = "Please select";
    typeOfDisability = "Please select";
    learningInstitution = "Please select";
    highestLearning = "Please select";
    doingLast = "Please select";
    hasFormalJob = "Please select";
    recommendSupport = "Please select";
    notifyListeners();
  }

  void removeFamilyMemberDetails(Map<String, dynamic> member) {
    familyMembersDetails.remove(member);
    notifyListeners();
  }

  void setSelectedCounty(String county) {
    selectedCounty = county;
    selectedSubCounty = 'Please select';
    location = 'Please select';
    selectedSubLocation = 'Please select';
    selectedVillage = 'Please select';
    notifyListeners();
  }

  void setSelectedSubCounty(String subCounty) {
    selectedSubCounty = subCounty;
    location = 'Please select';
    selectedSubLocation = 'Please select';
    selectedVillage = 'Please select';
    notifyListeners();
  }

  void setLocation(String loc) {
    location = loc;
    selectedSubLocation = 'Please select';
    selectedVillage = 'Please select';
    notifyListeners();
  }

  void setSelectedSubLocation(String subLoc) {
    selectedSubLocation = subLoc;
    selectedVillage = 'Please select';
    notifyListeners();
  }

  void setSelectedVillage(String village) {
    selectedVillage = village;
    notifyListeners();
  }

  void setDoesHaveId(String val) {
    doesHaveId = val;
    notifyListeners();
  }

  void setRelationship(String val) {
    relationship = val;
    notifyListeners();
  }

  void setSex(String val) {
    sex = val;
    notifyListeners();
  }

  void setDateOfBirth(String val) {
    dateOfBirth = val;
    notifyListeners();
  }

  void setMaritalStatus(String val) {
    maritalStatus = val;
    notifyListeners();
  }

  void setDoesSufferChronic(String val) {
    doesSufferChronic = val;
    notifyListeners();
  }

  void setDisabilityRequire24Care(String val) {
    disabilityRequire24Care = val;
    notifyListeners();
  }

  void setTypeOfDisability(String val) {
    typeOfDisability = val;
    notifyListeners();
  }

  void setLearningInstitution(String val) {
    learningInstitution = val;
    notifyListeners();
  }

  void setHighestLearning(String val) {
    highestLearning = val;
    notifyListeners();
  }

  void setDoingLast(String val) {
    doingLast = val;
    notifyListeners();
  }

  void setHasFormalJob(String val) {
    hasFormalJob = val;
    notifyListeners();
  }

  void setRecommendSupport(String val) {
    recommendSupport = val;
    notifyListeners();
  }

  void setKindOfBenefits(String val) {
    kindOfBenefits = val;
    notifyListeners();
  }

  void setHouseholdReceivingBenefits(String val) {
    householdReceivingBenefits = val;
    notifyListeners();
  }

  void clearData() {
    familyMembers = [];
    familyMembersDetails = [];
    selectedCounty = 'Please select';
    selectedSubCounty = 'Please select';
    location = 'Please select';
    selectedSubLocation = 'Please select';
    selectedVillage = 'Please select';
    villageElderController.clear();
    nearestChurchMosqueController.clear();
    nearestSchoolController.clear();
    yearsController.clear();
    monthsController.clear();
    firstNameController.clear();
    middleNameController.clear();
    surnameController.clear();
    doesHaveId = 'Type';
    relationship = "Please select";

    sex = "Please select";
    dateOfBirth = null;
    maritalStatus = "Please select";
    doesSufferChronic = "Please select";
    disabilityRequire24Care = "Please select";
    typeOfDisability = "Please select";
    learningInstitution = "Please select";
    highestLearning = "Please select";
    doingLast = "Please select";
    hasFormalJob = "Please select";
    recommendSupport = "Please select";
    memberCaregiver.clear();
    specifiedBenefit.clear();
    specifyInKindController.clear();
    kindOfBenefits = 'Please select';
    householdReceivingBenefits = 'Please select';
    setSelectedIndex(0);
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void addMember() {
    if (householdDemographicFormKey.currentState!.validate()) {
      addFamilyMember({
        'firstName': firstNameController.text,
        'middleName': middleNameController.text,
        'surname': surnameController.text,
      });
      firstNameController.clear();
      middleNameController.clear();
      surnameController.clear();
    }
  }

  Future<void> handleSubmit(BuildContext context) async {
    if (selectedIndex < esrStepperWidgets.length - 1) {
      if (selectedIndex == 0) {
        if (!householdGeolocationFormKey.currentState!.validate()) {
          return;
        }
      } else if (selectedIndex == 1) {
        if (!benefitsFormKey.currentState!.validate()) {
          return;
        }
      } else if (selectedIndex == 2 && familyMembers.isEmpty) {
        if (!householdDemographicFormKey.currentState!.validate()) {
          return;
        } else if (selectedIndex == 3) {
          if (!familyFormKey.currentState!.validate()) {
            return;
          }
        }
      }

      setSelectedIndex(selectedIndex + 1);
    } else {
      final data = {
        "form_id": "esr",
        "county": selectedCounty,
        "sub_county": selectedSubCounty,
        "location": location,
        "sub_location": selectedSubLocation,
        "village": selectedVillage,
        "village_elder": villageElderController.text,
        "nearest_church_mosque": nearestChurchMosqueController.text,
        "nearest_school": nearestSchoolController.text,
        "years": yearsController.text,
        "months": monthsController.text,
        "household_benefits": householdReceivingBenefits,
        "benefit_type": kindOfBenefits,
        "specified_benefit": specifiedBenefit.text,
        "family_members": [
          for (var i = 0; i < familyMembers.length; i++)
            {
              "first_name": familyMembers[i]['firstName'],
              "middle_name": familyMembers[i]['middleName'],
              "surname": familyMembers[i]['surname'],
              "doesHaveId": familyMembersDetails[i]['doesHaveId'],
              "relationship": familyMembersDetails[i]['relationship'],
              "sex": familyMembersDetails[i]["sex"],
              "date_of_birth": familyMembersDetails[i]["date_of_birth"],
              "marital_status": familyMembersDetails[i]["marital_status"],
              "does_suffer_chronic": familyMembersDetails[i]
                  ["does_suffer_chronic"],
              "disability_require_24_care": familyMembersDetails[i]
                  ["disability_require_24_care"],
              "type_of_disability": familyMembersDetails[i]
                  ["type_of_disability"],
              "learning_institution": familyMembersDetails[i]
                  ["learning_institution"],
              "highest_learning": familyMembersDetails[i]["highest_learning"],
              "doing_last": familyMembersDetails[i]["doing_last"],
              "has_formal_job": familyMembersDetails[i]["has_formal_job"],
              "recommend_support": familyMembersDetails[i]["recommend_support"],
              "main_caregiver": familyMembersDetails[i]["main_caregiver"]
            }
        ]
      };
      final esrForm = ESRFormModel.fromJson(data);
      // await apiService.sendESRForm(data);
      final isSaved = await LocalDB.instance.saveESRForm(esrForm);

      if (!isSaved) {
        showErrorSnackBar(
            context, "Failed to submit ESR form. Please try again.");
        return;
      }
      clearData();
      Get.back();
      showSuccessSnackBar(context, "Successfully submitted ESR form.");
    }
  }
}
