import 'package:cpims_dcs_mobile/core/constants/booleans.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/constants/convert_date_to_YMD.dart';
import 'package:cpims_dcs_mobile/models/crs_forms.dart';
import 'package:sqflite/sqflite.dart';

class CRSDatabaseForm {
  static storeFormInDB(CRSForm form, Database db, String formID) async {
    try {
      // Insert into form table
      await db.insert(crsTable, {
        "id": formID,
        "caseReporter": form.caseReporting?.originator,
        "courtName": form.caseReporting?.courtName,
        "reporterPhoneNumber": form.caseReporting?.reporterPhoneNumber,
        "reporterLastName": form.caseReporting?.reporterLastName,
        "reporterFirstName": form.caseReporting?.reporterFirstName,
        "courtFileNumber": form.caseReporting?.courtFileNumber,
        "reporterOtherName": form.caseReporting?.reporterOtherName,
        "policeStation": form.caseReporting?.policeStation,
        "obNumber": form.caseReporting?.obNumber,
        "placeOfOccurence": form.caseReporting?.placeOfOccurence == true ? 1: 0,
        "village": form.caseReporting?.village,
        "ward": form.caseReporting?.ward,
        "county": form.caseReporting?.county,
        "subCounty": form.caseReporting?.subCounty,
        "reportingSubCounty": form.caseReporting?.reportingSubCounty,
        "reportingOrgUnit": form.caseReporting?.reportingOrganizationalUnit,
        "dateCaseReported": convertDateToYMD(form.caseReporting!.dateCaseReported!),
        "childID": "",
        "country": form.caseReporting?.country,
        "city": form.caseReporting?.city,
        "houseEconomic": form.about!.houseEconomicStatus,
        "mentalConditionStatus": form.medical!.mentalConditionStatus,
        "physicalConditionStatus": form.medical!.physicalConditionStatus,
        "otherConditionStatus": form.medical!.otherConditionStatus,
        "caseSerialNumber": form.caseData?.serialNumber ?? "",
        "offenderKnown": form.caseData?.offenderKnown ?? "",
        "location": form.caseReporting?.location,
        "subLocation": form.caseReporting?.subLocation,
        "riskLevel": form.caseData?.riskLevel,
        "referralPresent": form.caseData?.referralsPresent == true ? 1 : 0,
        "summonsIssued": form.caseData?.referralsPresent == true ? 1 : 0,
        "dateOfSummon": form.caseData?.dateOfSummon?.toIso8601String(),
        "caseNarration": form.caseData?.caseNarration
      });

      // Insert into family status
      for (var i = 0; i < form.about!.familyStatus.length; i++) {
        await db.insert(crsFamilyStatusTable, {
          "formID": formID,
          "status": form.about!.familyStatus[i],
        });
      }

      // Insert into close friends
      if (form.about!.closeFriends != null) {
        for (var j = 0; j < form.about!.closeFriends!.length; j++) {
          await db.insert(crsCloseFriendsTable, {
            "formID": formID,
            "name": form.about!.closeFriends![j],
          });
        }
      }

      // Insert into hobbies
      if (form.about!.hobbies != null) {
        for (var j = 0; j < form.about!.hobbies!.length; j++) {
          await db.insert(crsHobbiesTable, {
            "formID": formID,
            "hobby": form.about!.hobbies![j],
          });
        }
      }

      // Inserting mental conditions
      if (form.medical!.mentalCondition != null) {
        for (var j = 0; j < form.medical!.mentalCondition!.length; j++) {
          await db.insert(crsMentalConditionTable, {
            "formID": formID,
            "condition": form.medical!.mentalCondition![j],
          });
        }
      }

      // Inserting physical conditions
      if (form.medical!.physicalCondition != null) {
        for (var j = 0; j < form.medical!.physicalCondition!.length; j++) {
          await db.insert(crsPhysicalConditionTable, {
            "formID": formID,
            "condition": form.medical!.physicalCondition![j],
          });
        }
      }

      // Inserting other conditions
      if (form.medical!.otherCondition != null) {
        for (var j = 0; j < form.medical!.otherCondition!.length; j++) {
          await db.insert(crsOtherConditionTable, {
            "formID": formID,
            "condition": form.medical!.otherCondition![j],
          });
        }
      }

      // Inserting CRS categories
      for (var j = 0; j < form.caseData!.crsCategories.length; j++) {
        await db.insert(crsFormCategoriesTable, {
          "formID": formID,
          "categoryID": form.caseData?.crsCategories[j].category,
          "placeOfEvent": form.caseData?.crsCategories[j].placeOfEvent,
          "caseNature": form.caseData?.crsCategories[j].caseNature,
          "dateOfEvent": form.caseData?.crsCategories[j].dateOfEvent,
        });

        // Inserting sub categories
        for (var l = 0;
            l < form.caseData!.crsCategories[j].subcategory!.length;
            l++) {
          var subCateg = form.caseData!.crsCategories[j].subcategory![l];
          await db.insert(crsFormSubCategoriesTable, {
            "crsFormCategoryID": formID,
            "categoryID": form.caseData?.crsCategories[j].category,
            "subCategoryID": subCateg,
          });
        }
      }

      // Insert form refferals
      if (form.caseData?.referrals != null) {
        for (var j = 0; j < form.caseData!.referrals!.length; j++) {
          var referral = form.caseData!.referrals![j];
          await db.insert(crsReferralsTable, {
            "formID": formID,
            "actor": referral.actor,
            "specify": referral.specify,
            "reason": referral.reason,
          });
        }
      }

      // Immediate needs
      for (var j = 0; j < form.caseData!.immediateNeeds.length; j++) {
        var immediate = form.caseData!.immediateNeeds[j];
        await db.insert(crsImmediateTable, {
          "formID": formID,
          "need": immediate,
        });
      }

      // Future needs
      for (var j = 0; j < form.caseData!.futureNeeds.length; j++) {
        var future = form.caseData!.futureNeeds[j];
        await db.insert(crsFutureNeedsTable, {
          "formID": formID,
          "need": future,
        });
      }

      // Store Perpetrators
      for (var j = 0; j < form.caseData!.perpetrators.length; j++) {
        var perp = form.caseData!.perpetrators[j];
        var perpid = await db.insert(perpetratorTable, {
          "firstName": perp.firstName,
          "surname": perp.lastName,
          "otherNames": perp.othernames,
          "sex": perp.sex,
          "dob": convertDateToYMD(perp.dateOfBirth),
          "relationshipType": perp.relationshipType
        });

        // Store relationship betwen perp and form
        await db.insert(crsFormPerpetrators, {
          "formID": formID,
          "perpetratorID": perpid,
        });
      }
    } catch (err) {
      throw "Could Not Store Form In Database";
    }
  }
}
