import 'package:cpims_dcs_mobile/models/crs_forms.dart';
import 'package:flutter/material.dart';

class CRSFormProvider extends ChangeNotifier {
  final CRSForm form = CRSForm();

  CaseReportingCRSFormModel? get caseReport => form.caseReporting;
  AboutChildCRSFormModel? get about => form.about;
  MedicalCRSFormModel? get medical => form.medical;
  CaseDataCRSFormModel? get caseData => form.caseData;

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
