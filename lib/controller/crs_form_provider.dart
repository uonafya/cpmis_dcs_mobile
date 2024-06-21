import 'package:cpims_dcs_mobile/models/crs_forms.dart';
import 'package:cpims_dcs_mobile/views/screens/crs/constants/constants.dart';
import 'package:flutter/material.dart';

class CRSFormProvider extends ChangeNotifier {
  final CRSForm form = CRSForm();

  CaseReportingCRSFormModel get caseReport {
    if (form.caseReporting == null) {
      var caseReport = CaseReportingCRSFormModel(
          originator: pleaseSelect,
          placeOfOccurence: false,
          county: pleaseSelect,
          subCounty: pleaseSelect,
          reportingSubCounty: pleaseSelect,
          reportingOrganizationalUnit: pleaseSelect,
          country: pleaseSelect,
          city: pleaseSelect,
          dateCaseReported: null);

      form.caseReporting = caseReport;
      notifyListeners();
      return caseReport;
    }
    return form.caseReporting!;
  }

  AboutChildCRSFormModel? get about {
    if (form.about == null) {
      var about = AboutChildCRSFormModel(
          initialDetails: const InitialChildDetails(
            firstName: "",
            surname: "",
            otherNames: "",
            sex: "",
            age: 2,
          ),
          houseEconomicStatus: pleaseSelect,
          familyStatus: [],
          closeFriends: [],
          caregivers: [],
          siblingDetails: [],
          hobbies: []);
      form.about = about;
      notifyListeners();
      return about;
    }
    return form.about!;
  }

  MedicalCRSFormModel get medical {
    if (form.medical == null) {
      var medical = MedicalCRSFormModel(
        mentalConditionStatus: pleaseSelect,
        physicalConditionStatus: pleaseSelect,
        otherConditionStatus: pleaseSelect,
      );
      form.medical = medical;
      notifyListeners();
      return form.medical!;
    }
    return form.medical!;
  }

  CaseDataCRSFormModel get caseData {
    if (form.caseData == null) {
      var caseData = CaseDataCRSFormModel(
        serialNumber: "",
        offenderKnown: "no",
        crsCategories: [],
        riskLevel: "low",
        referralsPresent: false,
        summonsIssued: false,
        caseNarration: "",
        immediateNeeds: [],
        futureNeeds: [],
        perpetrators: [],
      );
      form.caseData = caseData;
      notifyListeners();
      return caseData;
    }
    return form.caseData!;
  }

  set caseReport(CaseReportingCRSFormModel? data) {
    form.caseReporting = data;
    notifyListeners();
  }

  set about(AboutChildCRSFormModel? data) {
    form.about = data;
    notifyListeners();
  }

  set medical(MedicalCRSFormModel? data) {
    form.medical = data;
    notifyListeners();
  }

  set caseData(CaseDataCRSFormModel? data) {
    form.caseData = data;
    notifyListeners();
  }
}
