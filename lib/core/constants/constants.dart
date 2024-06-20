import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

const kPrimaryColor = Color(0xff00acac);
const kTextGrey = Color(0XFF707478);
const kSystemPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 0);

void errorSnackBar(BuildContext context, String message,
    {Duration duration = const Duration(seconds: 8)}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(message),
    duration: duration,
  ));
}

const String cpimsApiUrl = "https://test.cpims.net/api/";
const String mobileEndpoint = "https://dev.cpims.net/mobile/";

enum RadioButtonOptions { yes, no, na }

// Database table names
const String organizationUnitsTable = "orgUnits";
const String socialInquiryTable = "socialInquiry";
const String geolocationTable = "geolocations";
const String usersTable = "users";
const String childTable = "child";
const String caregiverTable = "caregiver";
const String siblingsTable = "siblings";
const String caregiverChildTable = "caregiverChild";
const String crsTable = "crs";
const String perpetratorTable = "perpetrator";
const String crsFamilyStatusTable = "crsFamilyStatus";
const String crsCloseFriendsTable = "crsCloseFriends";
const String crsHobbiesTable = "crsHobbies";
const String crsMentalConditionTable = "crsMentalCondition";
const String crsPhysicalConditionTable = "crsPhysicalCondition";
const String crsOtherConditionTable = "crsOtherCondition";
const String categoriesTable = "categories";
const String subCategoriesTable = "subcategories";
const String crsFormCategoriesTable = "crsFormCategories";
const String crsFormSubCategoriesTable = "crsFormSubcategories";
const String crsReferralsTable = "crsReferrals";
const String crsImmediateTable = "crsImmediate";
const String crsFutureNeedsTable = "crsFutureNeeds";
const String crsFormPerpetrators = "crsFormPerpetrators";
const String caseLoadTable = "caseLoad";
const String caregiverCaseLoadTable = "caregiverCaseLoad";
const String siblingsCaseLoadTable = "siblingsCaseLoad";
const String perpetratorCaseLoadTable = "perpetratorCaseLoad";
const String caseLoadCategoryTable = "caseLoadCategory";
const String caseClosureTable = "caseClosure";

const String registryIdentificationTable = "registry_identification";
const String registryContactTable = "registry_contact";
const String registryLocationTable = "registry_location";
const String registryCaregiverTable = "registry_caregiver";
const String registrySiblingTable = "registry_sibling";
const String registryCboChvTable = "registry_cbo_chv";

const String registryFormDetails = "registry_form_details";

const String registerUrl = "https://test.cpims.net/accounts/request/";
const String forgotPasswordUrl =
    "https://test.cpims.net/accounts/password-reset/";

showErrorSnackBar(BuildContext context, String message) {
  toastification.show(
    context: context,
    type: ToastificationType.error,
    style: ToastificationStyle.minimal,
    autoCloseDuration: const Duration(seconds: 3),
    description: RichText(
        text:
            TextSpan(text: message, style: const TextStyle(color: Colors.red))),
    alignment: Alignment.bottomRight,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    icon: const Icon(Icons.error_outline, color: Colors.red),
    primaryColor: Colors.red,
    backgroundColor: Colors.red[50]!.withOpacity(0.1),
    foregroundColor: Colors.red,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
    margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    borderRadius: BorderRadius.circular(4),
    showProgressBar: true,
    progressBarTheme: const ProgressIndicatorThemeData(
      color: Colors.red,
    ),
    closeButtonShowType: CloseButtonShowType.always,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: true,
  );
}

showSuccessSnackBar(BuildContext context, String message) {
  toastification.show(
    context: context,
    type: ToastificationType.success,
    style: ToastificationStyle.minimal,
    autoCloseDuration: const Duration(seconds: 3),
    description: RichText(
        text: TextSpan(
            text: message, style: const TextStyle(color: Colors.green))),
    alignment: Alignment.bottomRight,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    icon: const Icon(Icons.check, color: Colors.green),
    primaryColor: Colors.green,
    backgroundColor: Colors.green[50]!.withOpacity(0.1),
    foregroundColor: Colors.green,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
    margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    borderRadius: BorderRadius.circular(4),
    showProgressBar: true,
    progressBarTheme: const ProgressIndicatorThemeData(
      color: Colors.green,
    ),
    closeButtonShowType: CloseButtonShowType.always,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: true,
  );
}
