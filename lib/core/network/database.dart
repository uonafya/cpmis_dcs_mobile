import 'dart:convert';

import 'package:cpims_dcs_mobile/core/network/followup_closure.dart';
import 'package:cpims_dcs_mobile/core/network/followup_court.dart';
import 'package:cpims_dcs_mobile/core/network/followup_referrals.dart';
import 'package:cpims_dcs_mobile/core/network/followup_services.dart';
import 'package:cpims_dcs_mobile/core/network/followup_summons.dart';
import 'package:cpims_dcs_mobile/models/case_load/case_load_model.dart';
import 'package:cpims_dcs_mobile/models/esr_form_model.dart';
import 'package:cpims_dcs_mobile/models/social_inquiry_form_model.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import '../constants/constants.dart';
import "package:path/path.dart";

//ALL LOCAL DATABASE OPERATIONS WILL BE DONE HERE(QUERIES, READS, WRITES, UPDATES, DELETES, ETC.)
//However, we will not have logic for UI, API, or any other business logic here.
//Please refer to the respective folders for those(models, controllers & views).

class LocalDB {
  static Database? _database;
  static const String _databaseName = 'cpims_dcs_mobile.db';

  static final LocalDB instance = LocalDB._init();

  LocalDB._init();

  Future<Database> _initDB(String filePath) async {
    try {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, filePath);
      return await openDatabase(
        path,
        version: 9,
        onCreate: _initialise,
        onUpgrade: (db, oldVersion, newVersion) {
          if (oldVersion < newVersion) {
            db.execute('''
            ALTER TABLE users ADD COLUMN role TEXT
          ''');
          }
        },
      );
    } catch (err) {
      throw "Could Not Create Instance of DB";
    }
  }

  Future<Database> get database async {
    // If database exists return it
    if (_database != null) {
      return _database!;
    }

    // Else create it and return
    Database db = await _initDB(_databaseName);
    return db;
  }

  Future<void> _initialise(Database db, int version) async {
    await db.execute('''
          CREATE TABLE IF NOT EXISTS $geolocationTable(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            code TEXT,
            name TEXT NOT NULL,
            type TEXT NOT NULL,
            parent INTEGER 
          );
        ''');
    await db.execute('''
          CREATE TABLE IF NOT EXISTS $usersTable(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT,
            password TEXT,
            email TEXT,
            phone_number TEXT,
            created_at TEXT,
            updated_at TEXT
          );        
        ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $childTable(
            id TEXT PRIMARY KEY,
            firstName TEXT NOT NULL,
            surname TEXT NOT NULL,
            othername TEXT,
            nickname TEXT,
            sex TEXT NOT NULL,
            dob TEXT NOT NULL
          );
       ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $caregiverTable(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            firstName TEXT NOT NULL,
            surname TEXT NOT NULL,
            othername TEXT,
            nickname TEXT,
            sex TEXT,
            dob TEXT,
            wardID INTEGER,
            subCountyID INTEGER,
            FOREIGN KEY(wardID) REFERENCES geolocation(id),
            FOREIGN KEY(subCountyID) REFERENCES geolocation(id)
          );
       ''');

    await db.execute('''
       CREATE TABLE IF NOT EXISTS $siblingsTable(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            siblingID INTEGER NOT NULL,
            childID INTEGER NOT NULL,
            dateLinked TEXT,
            dateUnlinked TEXT,
            remarks TEXT,
            FOREIGN KEY(childID) REFERENCES child(id),
            FOREIGN KEY(siblingID) REFERENCES child(id)
          );
       ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $caregiverChildTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            caregiverID INTEGER NOT NULL,
            childID INTEGER NOT NULL,
            dateLinked TEXT NOT NULL,
            relationshipType TEXT NOT NULL,
            FOREIGN KEY(caregiverID) REFERENCES caregiver(id),
            FOREIGN KEY(childID) REFERENCES child(id)
          );
       ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $crsTable(
            id TEXT PRIMARY KEY,
            caseReporter TEXT NOT NULL,
            courtName TEXT,
            reporterPhoneNumber TEXT,
            reporterLastName TEXT,
            reporterFirstName TEXT,
            courtFileNumber TEXT,
            reporterOtherName TEXT,
            county TEXT NOT NULL,
            subCounty TEXT NOT NULL,
            policeStation TEXT,
            obNumber TEXT,
            isNew INTEGER NOT NULL,
            placeOfOccurence INTEGER NOT NULL,
            village TEXT,
            ward TEXT,
            location TEXT,
            subLocation TEXT,
            reportingSubCounty TEXT NOT NULL,
            reportingOrgUnit TEXT NOT NULL,          
            dateCaseReported TEXT NOT NULL,
            childID TEXT NOT NULL,
            country TEXT,
            city TEXT,
            houseEconomic TEXT NOT NULL,
            mentalConditionStatus TEXT NOT NULL,
            physicalConditionStatus TEXT NOT NULL,
            otherConditionStatus TEXT NOT NULL,
            caseSerialNumber TEXT NOT NULL,
            offenderKnown TEXT NOT NULL,
            riskLevel TEXT NOT NULL,
            referralPresent INT NOT NULL,
            summonsIssued INT NOT NULL,
            dateOfSummon TEXT,
            caseNarration TEXT,
            synced INTEGER NOT NULL
          );
       ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $perpetratorTable(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            firstName TEXT NOT NULL,
            surname TEXT NOT NULL,
            otherNames TEXT,
            sex TEXT,
            dob TEXT,
            age INTEGER,
            relationshipType TEXT
          );
       ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $crsFamilyStatusTable(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            formID TEXT NOT NULL,
            status TEXT NOT NULL,
            FOREIGN KEY(formID) REFERENCES crs(id)
          );
       ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $crsCloseFriendsTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            formID TEXT NOT NULL,
            name TEXT NOT NULL,
            FOREIGN KEY(formID) REFERENCES crs(id)
          );
       ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $crsHobbiesTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            formID TEXT NOT NULL,
            hobby TEXT NOT NULL,
            FOREIGN KEY(formID) REFERENCES crs(id)
          );
       ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $crsMentalConditionTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            formID TEXT NOT NULL,
            condition TEXT NOT NULL,
            FOREIGN KEY(formID) REFERENCES crs(id)
          );
       ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $crsPhysicalConditionTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            formID TEXT NOT NULL,
            condition TEXT NOT NULL,
            FOREIGN KEY(formID) REFERENCES crs(id)
          );
       ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $crsOtherConditionTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            formID TEXT NOT NULL,
            condition TEXT NOT NULL,
            FOREIGN KEY(formID) REFERENCES crs(id)
          );
       ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $categoriesTable (
            id TEXT PRIMARY KEY,
            name TEXT NOT NULL,
            subcategory TEXT,
            orderNo INTEGER
          );
       ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $subCategoriesTable (
            id TEXT PRIMARY KEY,
            name TEXT NOT NULL,
            categoryID TEXT NOT NULL,
            FOREIGN KEY(categoryID) REFERENCES categories(id)
          );
       ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $crsFormCategoriesTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            formID TEXT NOT NULL,
            categoryID TEXT NOT NULL,
            placeOfEvent TEXT NOT NULL,
            caseNature TEXT NOT NULL,
            dateOfEvent TEXT NOT NULL,
            FOREIGN KEY(formID) REFERENCES crs(id)
          );
       ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $crsFormSubCategoriesTable(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            crsFormCategoryID INTEGER NOT NULL,
            categoryID TEXT NOT NULL,
            subCategoryID TEXT NOT NULL,
            FOREIGN KEY(crsFormCategoryID) REFERENCES $crsFormCategoriesTable(id)
          );
       ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $crsReferralsTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            formID TEXT NOT NULL,
            actor TEXT NOT NULL,
            specify TEXT NOT NULL,
            reason TEXT NOT NULL,
            FOREIGN KEY(formID) REFERENCES crs(id)
          );
       ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $crsImmediateTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            formID TEXT NOT NULL,
            need TEXT NOT NULL,
            FOREIGN KEY(formID) REFERENCES crs(id)
          );
       ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $crsFutureNeedsTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            formID TEXT NOT NULL,
            need TEXT NOT NULL,
            FOREIGN KEY(formID) REFERENCES crs(id)
          );
       ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $crsFormPerpetrators (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            formID TEXT NOT NULL,
            perpetratorID INT NOT NULL,
            FOREIGN KEY(formID) REFERENCES crs(id),
            FOREIGN KEY(perpetratorID) REFERENCES $perpetratorTable(id)
        );
        ''');

    // Creating registry tables
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $registryFormDetails (
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        personType TEXT NOT NULL,
        isCaregiver BOOLEAN,
        childOVCProgram BOOLEAN NOT NULL,
        firstName TEXT NOT NULL,
        surname TEXT NOT NULL,
        otherNames TEXT,
        sex TEXT NOT NULL,
        dateOfBirth TEXT NOT NULL,
        childClass Text NOT NULL,
        registryIdentificationModel TEXT NOT NULL,
        registryContactDetailsModel TEXT NOT NULL,
        registryLocationModel TEXT NOT NULL,
        caregivers TEXT NOT NULL,
        siblings TEXT NOT NULL,
        registryCboChvModel TEXT NOT NULL,
        workforceIdName TEXT NOT NULL,
        datePaperFormFilled TEXT NOT NULL
      );
    ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $caseLoadTable (
            ${CaseLoadTableFields.orgUnitName} TEXT,
            ${CaseLoadTableFields.orgUnitId} INTEGER,
            ${CaseLoadTableFields.reportSubCountyName} TEXT,
            ${CaseLoadTableFields.reportSubCountyId} INTEGER,
            ${CaseLoadTableFields.occurrenceCountyName} TEXT,
            ${CaseLoadTableFields.occurrenceCountyId} INTEGER,
            ${CaseLoadTableFields.occurrenceSubCountyName} TEXT,
            ${CaseLoadTableFields.occurrenceSubCountyId} INTEGER,
            ${CaseLoadTableFields.occurrenceWardName} TEXT,
            ${CaseLoadTableFields.occurrenceVillageName} TEXT,
            ${CaseLoadTableFields.caseID} TEXT PRIMARY KEY,
            ${CaseLoadTableFields.caseSerial} TEXT,
            ${CaseLoadTableFields.perpetratorStatus} TEXT,
            ${CaseLoadTableFields.perpetrators} TEXT,
            ${CaseLoadTableFields.ovcCpimsId} TEXT,
            ${CaseLoadTableFields.ovcFirstName} TEXT,
            ${CaseLoadTableFields.ovcSurname} TEXT,
            ${CaseLoadTableFields.ovcOtherNames} TEXT,
            ${CaseLoadTableFields.ovcSex} TEXT,
            ${CaseLoadTableFields.siblings} TEXT,
            ${CaseLoadTableFields.caregivers} TEXT,
            ${CaseLoadTableFields.caseCategories} TEXT,
            ${CaseLoadTableFields.riskLevel} TEXT,
            ${CaseLoadTableFields.dateCaseOpened} TEXT,
            ${CaseLoadTableFields.caseReporterfirstName} TEXT,
            ${CaseLoadTableFields.caseReporterOtherNames} TEXT,
            ${CaseLoadTableFields.caseReporterSurName} TEXT,
            ${CaseLoadTableFields.caseReporterContacts} TEXT,
            ${CaseLoadTableFields.caseReporter} TEXT,
            ${CaseLoadTableFields.courtName} TEXT,
            ${CaseLoadTableFields.courtNumber} TEXT,
            ${CaseLoadTableFields.policeStationName} TEXT,
            ${CaseLoadTableFields.obNumber} TEXT,
            ${CaseLoadTableFields.caseStatus} TEXT,
            ${CaseLoadTableFields.referralPresent} TEXT,
            ${CaseLoadTableFields.timeStampCreated} TEXT,
            ${CaseLoadTableFields.createdBy} TEXT,
            ${CaseLoadTableFields.personId} TEXT,
            ${CaseLoadTableFields.caseRemarks} TEXT,
            ${CaseLoadTableFields.dateOfSummon} TEXT,
            ${CaseLoadTableFields.summonStatus} INTEGER,
            ${CaseLoadTableFields.householdEconomicStatus} TEXT,
            ${CaseLoadTableFields.mentalCondition} TEXT,
            ${CaseLoadTableFields.physicalCondition} TEXT,
            ${CaseLoadTableFields.otherCondition} TEXT,
            ${CaseLoadTableFields.immediateNeeds} TEXT,
            ${CaseLoadTableFields.futureNeeds} TEXT,
            ${CaseLoadTableFields.friends} TEXT,
            ${CaseLoadTableFields.hobbies} TEXT,
            ${CaseLoadTableFields.events} TEXT
            );  
    ''');

    // Organization unit
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $organizationUnitsTable (
        id INTEGER PRIMARY KEY,
        type TEXT,
        name TEXT,
        primaryUnit INTEGER
       );
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS $caseClosureTable(
        ${CaseClosureTable.caseID} TEXT PRIMARY KEY,
        ${CaseClosureTable.formId} TEXT,
        ${CaseClosureTable.caseOutcome} TEXT,
        ${CaseClosureTable.transferredTo} TEXT,
        ${CaseClosureTable.caseClosureNotes} TEXT,
        ${CaseClosureTable.dateOfCaseClosure} TEXT,
        ${CaseClosureTable.interventionList} TEXT
      );
    ''');

    await db.execute('''
  CREATE TABLE IF NOT EXISTS $serviceFollowupTable(
    ${ServiceFollowupTable.caseID} TEXT PRIMARY KEY,
    ${ServiceFollowupTable.formId} TEXT,
    ${ServiceFollowupTable.encounterNotes} TEXT,
    ${ServiceFollowupTable.caseCategoryId} TEXT,
    ${ServiceFollowupTable.serviceProvidedList} TEXT
  );
''');

    await db.execute('''
  CREATE TABLE IF NOT EXISTS $courtSessionTable(
    ${CourtSessionTable.caseId} TEXT PRIMARY KEY,
    ${CourtSessionTable.formId} TEXT,
    ${CourtSessionTable.courtSessionCase} TEXT,
    ${CourtSessionTable.courtSessionType} TEXT,
    ${CourtSessionTable.dateOfCourtEvent} TEXT,
    ${CourtSessionTable.courtNotes} TEXT,
    ${CourtSessionTable.nextHearingDate} TEXT,
    ${CourtSessionTable.nextMentionDate} TEXT,
    ${CourtSessionTable.pleaTaken} TEXT,
    ${CourtSessionTable.applicationOutcome} TEXT,
    ${CourtSessionTable.courtOutcome} TEXT,
    ${CourtSessionTable.courtOrder} TEXT
  );
''');

    // Social Inquiry
    await db.execute('''
      CREATE TABLE IF NOT EXISTS $socialInquiryTable(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        case_recommendation TEXT,
        case_history TEXT,
        sub_county_children_office TEXT,
        case_observation TEXT,
        officer_name TEXT,
        officer_phone TEXT,
        date_of_social_inquiry TEXT,
        case_id TEXT,
        form_id TEXT

      );
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS $metadataTable(
        id TEXT PRIMARY KEY,
        fieldName TEXT,
        description TEXT,
        subCategory TEXT,
        orderNo INTEGER
      );
    ''');

    // CCI transition form Database
    await db.execute('''
            CREATE TABLE IF NOT EXISTS cciTransition (
            cci_id TEXT NOT NULL,
            cci_name TEXT NOT NULL,
            nccs_registered TEXT,
            cci_reg_no TEXT,
            cci_date_of_reg TEXT,
            cci_valid_yrs TEXT,
            cci_other_reg TEXT,
            cci_serves_disabled TEXT,
            cci_gender TEXT,
            cci_accommodate_ages TEXT,
            transition_started TEXT,
            basis_transition TEXT,
            legal_framework_strategy TEXT,
            stakeholder_engagement TEXT,
            make_decision TEXT,
            assessment_ TEXT,
            strategic_plan TEXT,
            org_planning TEXT,
            prog_planning TEXT,
            transition_planning TEXT,
            employee_development TEXT,
            piloting_and_validation TEXT,
            program_implementation TEXT,
            monitoring_and_evaluation TEXT,
            cci_transition_to TEXT,
            survival_rights TEXT,
            development_rights TEXT,
            protection_rights TEXT,
            participation_rights TEXT
            created_at TEXT
    )
    ''');

    await db.execute('''
  CREATE TABLE IF NOT EXISTS $courtSummonsTable(
    ${CourtSummonsTable.caseId} TEXT PRIMARY KEY,
    ${CourtSummonsTable.honoured} TEXT,
    ${CourtSummonsTable.honouredDate} TEXT,
    ${CourtSummonsTable.summonDate} TEXT,
    ${CourtSummonsTable.summonNote} TEXT
  );
''');

    await db.execute('''
  CREATE TABLE IF NOT EXISTS $referralTable(
    ${ReferralTable.caseId} TEXT PRIMARY KEY,
    ${ReferralTable.caseCategory} TEXT,
    ${ReferralTable.referralActor} TEXT,
    ${ReferralTable.specifiedReferral} TEXT,
    ${ReferralTable.referralFor} TEXT
  );
''');

//ESR FORMS
    const String createESRFormTable = '''
CREATE TABLE esr_form (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  form_id TEXT,
  county TEXT,
  sub_county TEXT,
  location TEXT,
  sub_location TEXT,
  village TEXT,
  village_elder TEXT,
  nearest_church_mosque TEXT,
  nearest_school TEXT,
  years TEXT,
  months TEXT,
  household_benefits TEXT,
  benefit_type TEXT,
  specified_benefit TEXT
)
''';

    const String createFamilyMembersTable = '''
CREATE TABLE family_members (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  esr_form_id INTEGER,
  first_name TEXT,
  middle_name TEXT,
  surname TEXT,
  doesHaveId TEXT,
  relationship TEXT,
  sex TEXT,
  date_of_birth TEXT,
  marital_status TEXT,
  does_suffer_chronic TEXT,
  disability_require_24_care TEXT,
  type_of_disability TEXT,
  learning_institution TEXT,
  highest_learning TEXT,
  doing_last TEXT,
  has_formal_job TEXT,
  recommend_support TEXT,
  main_caregiver TEXT,
  FOREIGN KEY (esr_form_id) REFERENCES esr_form (id)
)
''';

    await db.execute(createESRFormTable);
    await db.execute(createFamilyMembersTable);
  }

  //Insert ESR
  Future<bool> saveESRForm(ESRFormModel esrForm) async {
    Database db = await database;

    // Start a transaction to ensure all operations complete or none do
    return await db.transaction((txn) async {
      try {
        // Insert the main ESR form data
        int esrFormId = await txn.insert('esr_form', {
          'form_id': esrForm.formId,
          'county': esrForm.county,
          'sub_county': esrForm.subCounty,
          'location': esrForm.location,
          'sub_location': esrForm.subLocation,
          'village': esrForm.village,
          'village_elder': esrForm.villageElder,
          'nearest_church_mosque': esrForm.nearestChurchMosque,
          'nearest_school': esrForm.nearestSchool,
          'years': esrForm.years,
          'months': esrForm.months,
          'household_benefits': esrForm.householdBenefits,
          'benefit_type': esrForm.benefitType,
          'specified_benefit': esrForm.specifiedBenefit,
        });

        // Insert family members if they exist
        if (esrForm.familyMembers != null) {
          for (var familyMember in esrForm.familyMembers!) {
            await txn.insert('family_members', {
              'esr_form_id': esrFormId,
              'first_name': familyMember.firstName,
              'middle_name': familyMember.middleName,
              'surname': familyMember.surname,
              'doesHaveId': familyMember.doesHaveId,
              'relationship': familyMember.relationship,
              'sex': familyMember.sex,
              'date_of_birth': familyMember.dateOfBirth,
              'marital_status': familyMember.maritalStatus,
              'does_suffer_chronic': familyMember.doesSufferChronic,
              'disability_require_24_care':
                  familyMember.disabilityRequire24Care,
              'type_of_disability': familyMember.typeOfDisability,
              'learning_institution': familyMember.learningInstitution,
              'highest_learning': familyMember.highestLearning,
              'doing_last': familyMember.doingLast,
              'has_formal_job': familyMember.hasFormalJob,
              'recommend_support': familyMember.recommendSupport,
              'main_caregiver': familyMember.mainCaregiver,
            });
          }
        }

        return true; // Successfully saved
      } catch (e) {
        print('Error saving ESR form: $e');
        return false; // Failed to save
      }
    });
  }

  Future<List<ESRFormModel>> getESRForms() async {
    Database db = await database;
    List<ESRFormModel> esrForms = [];

    // First, get all ESR forms
    List<Map<String, dynamic>> esrMaps = await db.query('esr_form');

    for (var esrMap in esrMaps) {
      // Create ESRFormModel object
      ESRFormModel esrForm = ESRFormModel.fromJson(esrMap);

      // Get associated family members
      List<Map<String, dynamic>> familyMemberMaps = await db.query(
        'family_members',
        where: 'esr_form_id = ?',
        whereArgs: [esrMap['id']],
      );

      // Create FamilyMembers objects and add to ESRFormModel
      esrForm.familyMembers = familyMemberMaps
          .map((familyMap) => FamilyMembers.fromJson(familyMap))
          .toList();

      esrForms.add(esrForm);
    }

    return esrForms;
  }

  //Delete all data from ESR form table
  Future<void> deleteAllESRForms() async {
    Database db = await database;
    await db.delete('esr_form');
  }

  //Insert social inquiry form data
  Future<void> insertSocialInquiryForm(
      SocialInquiryFormModel socialInquiryForm) async {
    try {
      final db = await instance.database;
      final id = await db.insert(
        socialInquiryTable,
        socialInquiryForm.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print(id);
    } catch (e) {
      if (kDebugMode) {
        print("Error inserting social inquiry form data: $e");
      }
    }
  }

  // Save CCI Transition form method
  //Insert social inquiry form data
  Future<void> saveCciTransition(
      {selectedCCI,
      cciNCCSRegistered,
      final cciRegNo,
      cciRegDate,
      cciRegValidYrs,
      cciOtherRegistered,
      cciRegOtherType,
      cciServesDisabled,
      cciServesGender,
      cciAgeGroupsOne,
      cciStartedTransition,
      cciBasisOfTransition,
      cciLegaFramework,
      cciStakeholderEngagement,
      cciMakeDecision,
      cciAssessment,
      cciStrategicPlanning,
      cciOrganizationPlanning,
      cciProgramPlanning,
      cciTransitionPlanning,
      cciEmployeeDev,
      cciPilotValidation,
      cciProgramImplementation,
      cciMonitorEvaluate,
      cciTransitionTo,
      cciSurvivalRights,
      cciDevRights,
      cciProtectionRights,
      cciParticipationRights}) async {
    try {
      final db = await instance.database;
      final id = await db.insert("cciTransition", {
        "cci_id": "909090",
        'cci_name': selectedCCI,
        'nccs_registered': cciNCCSRegistered,
        'cci_reg_no': cciRegNo,
        'cci_date_of_reg': cciRegDate,
        'cci_valid_yrs': cciRegValidYrs,
        'cci_other_reg': cciOtherRegistered,
        'cci_serves_disabled': cciServesDisabled,
        'cci_gender': cciServesGender,
        'cci_accommodate_ages': cciAgeGroupsOne,
        'transition_started': cciStartedTransition,
        'basis_transition': cciBasisOfTransition,
        'legal_framework_strategy': cciLegaFramework,
        'stakeholder_engagement': cciStakeholderEngagement,
        'make_decision': cciMakeDecision,
        'assessment_': cciAssessment,
        'strategic_plan': cciStrategicPlanning,
        'org_planning': cciOrganizationPlanning,
        'prog_planning': cciProgramPlanning,
        'transition_planning': cciTransitionPlanning,
        'employee_development': cciEmployeeDev,
        'piloting_and_validation': cciPilotValidation,
        'program_implementation': cciProgramImplementation,
        'monitoring_and_evaluation': cciMonitorEvaluate,
        'cci_transition_to': cciTransitionTo,
        'survival_rights': cciSurvivalRights,
        'development_rights': cciDevRights,
        'protection_rights': cciProtectionRights,
        'participation_rights': cciParticipationRights
      });
      print(id);
    } catch (e) {
      if (kDebugMode) {
        print("Error inserting social inquiry form data: $e");
      }
    }
  }

  // insert multiple caseload records
  Future<void> insertMultipleCaseLoad(
    List<CaseLoadModel> caseLoadModelData,
  ) async {
    try {
      final db = await instance.database;

      final batch = db.batch();

      for (final caseLoadModel in caseLoadModelData) {
        batch.insert(
          caseLoadTable,
          {
            CaseLoadTableFields.orgUnitName: caseLoadModel.orgUnitName,
            CaseLoadTableFields.orgUnitId: caseLoadModel.orgUnitId,
            CaseLoadTableFields.reportSubCountyName:
                caseLoadModel.reportSubCountyName,
            CaseLoadTableFields.reportSubCountyId:
                caseLoadModel.reportSubCountyId,
            CaseLoadTableFields.occurrenceCountyName:
                caseLoadModel.occurrenceCountyName,
            CaseLoadTableFields.occurrenceCountyId:
                caseLoadModel.occurrenceCountyId,
            CaseLoadTableFields.occurrenceSubCountyName:
                caseLoadModel.occurrenceSubCountyName,
            CaseLoadTableFields.occurrenceSubCountyId:
                caseLoadModel.occurrenceSubCountyId,
            CaseLoadTableFields.occurrenceWardName:
                caseLoadModel.occurrenceWardName,
            CaseLoadTableFields.occurrenceVillageName:
                caseLoadModel.occurrenceVillageName,
            CaseLoadTableFields.caseID: caseLoadModel.caseID,
            CaseLoadTableFields.caseSerial: caseLoadModel.caseSerial,
            CaseLoadTableFields.perpetratorStatus:
                caseLoadModel.perpetratorStatus,
            CaseLoadTableFields.perpetrators:
                jsonEncode(caseLoadModel.perpetrators),
            CaseLoadTableFields.ovcCpimsId: caseLoadModel.ovcCpimsId,
            CaseLoadTableFields.ovcFirstName: caseLoadModel.ovcFirstName,
            CaseLoadTableFields.ovcSurname: caseLoadModel.ovcSurname,
            CaseLoadTableFields.ovcOtherNames: caseLoadModel.ovcOtherNames,
            CaseLoadTableFields.ovcSex: caseLoadModel.ovcSex,
            CaseLoadTableFields.siblings: jsonEncode(caseLoadModel.siblings),
            CaseLoadTableFields.caregivers:
                jsonEncode(caseLoadModel.caregivers),
            CaseLoadTableFields.caseCategories:
                jsonEncode(caseLoadModel.caseCategories),
            CaseLoadTableFields.riskLevel: caseLoadModel.riskLevel,
            CaseLoadTableFields.dateCaseOpened: caseLoadModel.dateCaseOpened,
            CaseLoadTableFields.caseReporterfirstName:
                caseLoadModel.caseReporterfirstName,
            CaseLoadTableFields.caseReporterOtherNames:
                caseLoadModel.caseReporterOtherNames,
            CaseLoadTableFields.caseReporterSurName:
                caseLoadModel.caseReporterSurName,
            CaseLoadTableFields.caseReporterContacts:
                caseLoadModel.caseReporterContacts,
            CaseLoadTableFields.caseReporter: caseLoadModel.caseReporter,
            CaseLoadTableFields.courtName: caseLoadModel.courtName,
            CaseLoadTableFields.courtNumber: caseLoadModel.courtNumber,
            CaseLoadTableFields.policeStationName:
                caseLoadModel.policeStationName,
            CaseLoadTableFields.obNumber: caseLoadModel.obNumber,
            CaseLoadTableFields.caseStatus: caseLoadModel.caseStatus,
            CaseLoadTableFields.referralPresent: caseLoadModel.referralPresent,
            CaseLoadTableFields.timeStampCreated:
                caseLoadModel.timeStampCreated,
            CaseLoadTableFields.createdBy: caseLoadModel.createdBy,
            CaseLoadTableFields.personId: caseLoadModel.personId,
            CaseLoadTableFields.caseRemarks: caseLoadModel.caseRemarks,
            CaseLoadTableFields.dateOfSummon: caseLoadModel.dateOfSummon,
            CaseLoadTableFields.summonStatus:
                caseLoadModel.summonStatus == true ? 1 : 0,
            CaseLoadTableFields.householdEconomicStatus:
                jsonEncode(caseLoadModel.householdEconomicStatus),
            CaseLoadTableFields.mentalCondition:
                jsonEncode(caseLoadModel.mentalCondition),
            CaseLoadTableFields.physicalCondition:
                jsonEncode(caseLoadModel.physicalCondition),
            CaseLoadTableFields.otherCondition:
                jsonEncode(caseLoadModel.otherCondition),
            CaseLoadTableFields.immediateNeeds:
                jsonEncode(caseLoadModel.immediateNeeds),
            CaseLoadTableFields.futureNeeds:
                jsonEncode(caseLoadModel.futureNeeds),
            CaseLoadTableFields.friends: jsonEncode(caseLoadModel.friends),
            CaseLoadTableFields.hobbies: jsonEncode(caseLoadModel.hobbies),
            CaseLoadTableFields.events: jsonEncode(caseLoadModel.events),
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
      await batch.commit(noResult: true);
    } catch (e) {
      if (kDebugMode) {
        print("Error inserting caseload data: $e");
      }
    }
  }
}

var localdb = LocalDB._init();

class CaseLoadTableFields {
  static final List<String> values = [
    orgUnitName,
    orgUnitId,
    reportSubCountyName,
    reportSubCountyId,
    occurrenceCountyName,
    occurrenceCountyId,
    occurrenceSubCountyName,
    occurrenceSubCountyId,
    occurrenceWardName,
    occurrenceVillageName,
    caseID,
    caseSerial,
    perpetratorStatus,
    perpetrators,
    ovcCpimsId,
    ovcFirstName,
    ovcSurname,
    ovcOtherNames,
    ovcSex,
    siblings,
    caregivers,
    caseCategories,
    riskLevel,
    dateCaseOpened,
    caseReporterfirstName,
    caseReporterOtherNames,
    caseReporterSurName,
    caseReporterContacts,
    caseReporter,
    courtName,
    courtNumber,
    policeStationName,
    obNumber,
    caseStatus,
    referralPresent,
    timeStampCreated,
    createdBy,
    personId,
    caseRemarks,
    dateOfSummon,
    summonStatus,
    householdEconomicStatus,
    mentalCondition,
    physicalCondition,
    otherCondition,
    immediateNeeds,
    futureNeeds,
    friends,
    hobbies,
    events,
  ];

  static const String orgUnitName = 'org_unit_name';
  static const String orgUnitId = 'org_unit_id';
  static const String reportSubCountyName = 'report_subcounty_name';
  static const String reportSubCountyId = 'report_subcounty_id';
  static const String occurrenceCountyName = 'occurence_county_name';
  static const String occurrenceCountyId = 'occurence_county_id';
  static const String occurrenceSubCountyName = 'occurence_subcounty_name';
  static const String occurrenceSubCountyId = 'occurence_subcounty_id';
  static const String occurrenceWardName = 'occurence_ward';
  static const String occurrenceVillageName = 'occurence_village';
  static const String caseID = 'case_id';
  static const String caseSerial = 'case_serial';
  static const String perpetratorStatus = 'perpetrator_status';
  static const String perpetrators = 'perpetrators';
  static const String ovcCpimsId = 'ovc_cpims_id';
  static const String ovcFirstName = 'ovc_first_name';
  static const String ovcSurname = 'ovc_surname';
  static const String ovcOtherNames = 'ovc_other_names';
  static const String ovcSex = 'ovc_sex';
  static const String siblings = 'siblings';
  static const String caregivers = 'caregivers';
  static const String caseCategories = 'case_categories';
  static const String riskLevel = 'risk_level';
  static const String dateCaseOpened = 'date_case_opened';
  static const String caseReporterfirstName = 'case_reporter_first_name';
  static const String caseReporterOtherNames = 'case_reporter_other_names';
  static const String caseReporterSurName = 'case_reporter_surname';
  static const String caseReporterContacts = 'case_reporter_contacts';
  static const String caseReporter = 'case_reporter';
  static const String courtName = 'court_name';
  static const String courtNumber = 'court_number';
  static const String policeStationName = 'police_station';
  static const String obNumber = 'ob_number';
  static const String caseStatus = 'case_status';
  static const String referralPresent = 'referral_present';
  static const String timeStampCreated = 'timestamp_created';
  static const String createdBy = 'created_by';
  static const String personId = 'person_id';
  static const String caseRemarks = 'case_remarks';
  static const String dateOfSummon = 'date_of_summon';
  static const String summonStatus = 'summon_status';
  static const String householdEconomicStatus = 'household_economic_status';
  static const String mentalCondition = 'mental_condition';
  static const String physicalCondition = 'physical_condition';
  static const String otherCondition = 'other_condition';
  static const String immediateNeeds = 'immediate_needs';
  static const String futureNeeds = 'future_needs';
  static const String friends = 'friends';
  static const String hobbies = 'hobbies';
  static const String events = 'events';
}
