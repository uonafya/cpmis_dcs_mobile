import 'package:cpims_dcs_mobile/core/constants/booleans.dart';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/constants/convert_date_to_YMD.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/models/crs_forms.dart';

Future<List<CRSForm>> fetchCRSFormsFromDB() async {
  try {
    var db = await localdb.database;
    // Fetch all forms from DB
    var forms = await db.query(
      crsTable,
      distinct: true,
      whereArgs: [0],
      where: "synced = ?"
    );

    List<CRSForm> returnForms = [];

    // For each form
    for (var i = 0; i < forms.length; i++) {
      var formID = forms[i]['id'];
      var rawForm = forms[i];
      // Get family status
      var rawFamilyStatus = await db.query(crsFamilyStatusTable,
          distinct: true,
          columns: ['status'],
          where: "formID = ?",
          whereArgs: [formID]);
      List<String> familyStatus =
          rawFamilyStatus.map((e) => e['status'].toString()).toList();

      // Get close friends
      var rawCloseFriends = await db.query(crsCloseFriendsTable,
          distinct: true,
          columns: ['name'],
          where: "formID = ?",
          whereArgs: [formID]);
      List<String> closeFriends =
          rawCloseFriends.map((e) => e['name'].toString()).toList();

      // Get hobbies
      var rawHobbies = await db.query(crsHobbiesTable,
          distinct: true,
          columns: ['hobby'],
          where: "formID = ?",
          whereArgs: [formID]);
      List<String> hobbies =
          rawHobbies.map((e) => e['hobby'].toString()).toList();

      // Get mental conditions
      var rawMentalConditions = await db.query(crsMentalConditionTable,
          distinct: true,
          columns: ['condition'],
          where: "formID = ?",
          whereArgs: [formID]);
      List<String> mentalCondition =
          rawMentalConditions.map((e) => e['condition'].toString()).toList();

      // Get physical conditions
      var rawPhysicalConditions = await db.query(crsPhysicalConditionTable,
          distinct: true,
          columns: ['condition'],
          where: "formID = ?",
          whereArgs: [formID]);
      List<String> physicalConditions =
          rawPhysicalConditions.map((e) => e['condition'].toString()).toList();

      // Get other conditions
      var rawOtherConditions = await db.query(crsOtherConditionTable,
          distinct: true,
          columns: ['condition'],
          where: "formID = ?",
          whereArgs: [formID]);
      List<String> otherConditions =
          rawOtherConditions.map((e) => e['condition'].toString()).toList();

      // Get case categories
      var rawCategories = await db.query(crsFormCategoriesTable,
          distinct: true,
          where: "formID = ?",
          whereArgs: [formID],
          columns: ['categoryID', 'placeOfEvent', 'caseNature', 'dateOfEvent']);

      List<CRSCategory> categories = [];
      // For each category form sub category
      for (var i = 0; i < rawCategories.length; i++) {
        var rawCateg = rawCategories[i];
        var rawSubCategories = await db.query(
          crsFormSubCategoriesTable,
          distinct: true,
          columns: ['subCategoryID'],
          where: "crsFormCategoryID = ? AND categoryID = ?",
          whereArgs: [formID, rawCateg['categoryID']],
        );

        List<String> subCategories =
            rawSubCategories.map((e) => e['subCategoryID'].toString()).toList();
        categories.add(CRSCategory(
          category: rawCateg['categoryID'].toString(),
          dateOfEvent: rawCateg['dateOfEvent'].toString(),
          subcategory: subCategories,
          placeOfEvent: rawCateg['placeOfEvent'].toString(),
          caseNature: rawCateg['caseNature'].toString(),
        ));
      }

      // Get referrals
      var rawReferrals = await db.query(crsReferralsTable,
          distinct: true,
          columns: ['actor', 'specify', 'reason'],
          where: "formID = ?",
          whereArgs: [formID]);
      List<CRSReferral> referals = rawReferrals
          .map((e) => CRSReferral(
                actor: e['actor'].toString(),
                reason: e['reason'].toString(),
                specify: e['specify'].toString(),
              ))
          .toList();

      // Get immediate needs
      var rawImmediateConditions = await db.query(crsImmediateTable,
          distinct: true,
          columns: ['need'],
          where: "formID = ?",
          whereArgs: [formID]);
      List<String> immediateNeeds =
          rawImmediateConditions.map((e) => e['need'].toString()).toList();

      // Get future needs
      var rawFutureNeeds = await db.query(crsFutureNeedsTable,
          distinct: true,
          columns: ['need'],
          where: "formID = ?",
          whereArgs: [formID]);
      List<String> futureNeeds =
          rawFutureNeeds.map((e) => e['need'].toString()).toList();

      // Get perpetrators
      var perpsList = await db.query(crsFormPerpetrators,
          distinct: true, where: "formID = ?", whereArgs: [formID]);

      List<Perpetrators> perpetrators = [];
      for (var i = 0; i < perpsList.length; i++) {
        var perpID = perpsList[i]['perpetratorID'];

        var rawPerp = await db.query(perpetratorTable,
            distinct: true,
            where: "id = ?",
            whereArgs: [
              perpID
            ],
            columns: [
              'firstName',
              'surname',
              "otherNames",
              'sex',
              'dob',
              'relationshipType'
            ]);

        perpetrators.add(Perpetrators(
          firstName: rawPerp[0]['firstName'].toString(),
          lastName: rawPerp[0]['surname'].toString(),
          relationshipType: rawPerp[0]['relationshipType'].toString(),
          othernames: rawPerp[0]['otherNames'].toString(),
          sex: rawPerp[0]['sex'].toString(),
          dateOfBirth: rawPerp[0]['dob'] != null ? convertYMDtoDate(rawPerp[0]['dob'].toString()): null
        ));
      }

      CRSForm form = CRSForm(
        formID: formID.toString(),
        caseReporting: CaseReportingCRSFormModel(
          courtFileNumber: rawForm['courtFileNumber'].toString(),
          courtName: rawForm['courtName'].toString(),
          originator: rawForm['caseReporter'].toString(),
          placeOfOccurence: strToBool(rawForm['placeOfOccurence'].toString()),
          country: rawForm['country'].toString(),
          county: rawForm['country'].toString(),
          subCounty: rawForm['subCounty'].toString(),
          reportingSubCounty: rawForm['reportingSubCounty'].toString(),
          reportingOrganizationalUnit: rawForm['reportingOrgUnit'].toString(),
          city: rawForm['city'].toString(),
          dateCaseReported: convertYMDtoDate(rawForm['dateCaseReported'].toString()),
        ),
        caseData: CaseDataCRSFormModel(
          serialNumber: rawForm['caseSerialNumber'].toString(),
          offenderKnown: rawForm['offenderKnown'].toString(),
          crsCategories: categories,
          riskLevel: rawForm['riskLevel'].toString(),
          referralsPresent: rawForm['referralPresent'] == 1,
          summonsIssued: rawForm['summonsIssued'] == 1,
          immediateNeeds: immediateNeeds,
          futureNeeds: futureNeeds,
          caseNarration: rawForm['caseNarration'].toString(),
          perpetrators: perpetrators,
        ),
        about: AboutChildCRSFormModel(
          initialDetails: InitialChildDetails(
            firstName: "",
            surName: "",
            otherNames: "",
            dateOfBirth: DateTime.now(),
            sex: "",
          ),
          houseEconomicStatus: rawForm['houseEconomic'].toString(),
          familyStatus: familyStatus,
        ),
        medical: MedicalCRSFormModel(
          mentalConditionStatus: rawForm['mentalConditionStatus'].toString(),
          mentalCondition: mentalCondition,
          physicalConditionStatus: rawForm['physicalConditionStatus'].toString(),
          physicalCondition: physicalConditions,
          otherConditionStatus: rawForm['otherConditionStatus'].toString(),
          otherCondition: otherConditions
        ),
      );
      returnForms.add(form);
    }
    return returnForms;
  } catch (err) {
    throw "Could Not Fetch CRS from DB";
  }
}
