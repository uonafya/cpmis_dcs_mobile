import 'package:flutter/material.dart';

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

const String cpimsApiUrl = "https://dev.cpims.net/api/";
const String mobileEndpoint = "https://dev.cpims.net/mobile/";

enum RadioButtonOptions { yes, no, na }


// Database table names
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

const String registerUrl = "https://test.cpims.net/accounts/request/";
const String forgotPasswordUrl = "https://test.cpims.net/accounts/password-reset/";

