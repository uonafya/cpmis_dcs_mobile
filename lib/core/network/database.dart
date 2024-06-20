import 'package:cpims_dcs_mobile/models/case_load/case_load_model.dart';
import 'package:cpims_dcs_mobile/models/case_load/perpetrator_model.dart';
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
        version: 5,
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
            id INTEGER PRIMARY KEY AUTOINCREMENT,
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
            courtName TEXT,
            reporterPhoneNumber TEXT,
            reporterLastName TEXT,
            reporterFirstName TEXT,
            courtFileNumber TEXT,
            reporterOtherName TEXT,
            policeStation TEXT,
            obNumber TEXT,
            placeOfOccurence TEXT NOT NULL,
            subCountyID INTEGER NOT NULL,
            village TEXT,
            wardID INTEGER,
            sublocationID INTEGER,
            reportingSubcountyID INTEGER NOT NULL,
            reportingOrgUnitID INTEGER NOT NULL,          
            dateCaseReported TEXT NOT NULL,
            childID INTEGER NOT NULL,
            countryID INTEGER NOT NULL,
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
            FOREIGN KEY(subCountyID) REFERENCES geolocations(id),
            FOREIGN KEY(wardID) REFERENCES geolocations(id),
            FOREIGN KEY(sublocationID) REFERENCES geolocations(id),
            FOREIGN KEY(countryID) REFERENCES geolocations(id),
            FOREIGN KEY(reportingSubcountyID) REFERENCES geolocations(id),
            FOREIGN KEY(childID) REFERENCES people(id),
            FOREIGN KEY(reportingOrgUnitID) REFERENCES geolocations(id)
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
            name TEXT NOT NULL
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
            condition TEXT NOT NULL,
            FOREIGN KEY(categoryID) REFERENCES categories(id),
            FOREIGN KEY(formID) REFERENCES crs(id)
          );
       ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $crsFormSubCategoriesTable(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            crsFormCategoryID INTEGER NOT NULL,
            subCategoryID TEXT NOT NULL,
            FOREIGN KEY(crsFormCategoryID) REFERENCES crsFormCategories(id),
            FOREIGN KEY(subCategoryID) REFERENCES subcategories(id)
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

    // Creating registry tables

    await db.execute('''
    CREATE TABLE IF NOT EXISTS $registryIdentificationTable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      birthRegistrationNumber TEXT,
      givenName TEXT,
      countryOfOrigin TEXT,
      tribe TEXT,
      religion TEXT
    )
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS $registryContactTable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      designatedPhoneNumber TEXT,
      otherMobileNumber TEXT,
      emailAddress TEXT,
      physicalLocation TEXT
    )
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS $registryLocationTable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      county TEXT,
      subCounty TEXT,
      ward TEXT
    )
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS $registryCaregiverTable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      relationship TEXT,
      contactNumber TEXT
    )
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS $registrySiblingTable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      age INTEGER,
      gender TEXT
    )
    ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS $registryCboChvTable (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      cboParentUnit TEXT,
      ovcProgramEnrollment TEXT,
      chv TEXT
    )
    ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $caregiverCaseLoadTable (
            ${CaregiversCaseloadTable.id} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${CaregiversCaseloadTable.caseID} TEXT NOT NULL,
            ${CaregiversCaseloadTable.caregiverCpimsId} TEXT NOT NULL,
            ${CaregiversCaseloadTable.relationshipType} TEXT NOT NULL,
            ${CaregiversCaseloadTable.guardianPerson} TEXT NOT NULL,
            ${CaregiversCaseloadTable.dateLinked} TEXT NOT NULL,
            FOREIGN KEY(case_id) REFERENCES $caseLoadTable(${CaseLoadTableFields.caseID})
          );
       ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $siblingsCaseLoadTable (
            ${SiblingsCaseLoadTable.id} INTEGER PRIMARY KEY,
            ${SiblingsCaseLoadTable.caseID} TEXT NOT NULL,
            ${SiblingsCaseLoadTable.childPersonId} TEXT NOT NULL,
            ${SiblingsCaseLoadTable.siblingPersonId} TEXT NOT NULL,
            ${SiblingsCaseLoadTable.dateLinked} TEXT NOT NULL,
            ${SiblingsCaseLoadTable.dateDelinked} TEXT NOT NULL,
            ${SiblingsCaseLoadTable.remarks} TEXT NOT NULL,
            ${SiblingsCaseLoadTable.isVoid} INTEGER NOT NULL,
            FOREIGN KEY(case_id) REFERENCES $caseLoadTable(${CaseLoadTableFields.caseID})
          );
       ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $perpetratorCaseLoadTable(
            ${PerpetratorsCaseloadTable.id} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${PerpetratorsCaseloadTable.caseID} TEXT NOT NULL,
            ${PerpetratorsCaseloadTable.firstName} TEXT NOT NULL,
            ${PerpetratorsCaseloadTable.surName} TEXT NOT NULL,
            ${PerpetratorsCaseloadTable.ovcOtherNames} TEXT,
            ${PerpetratorsCaseloadTable.relationshipType} TEXT,
            FOREIGN KEY(case_id) REFERENCES $caseLoadTable(${CaseLoadTableFields.caseID})
          );
       ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $caseLoadCategoryTable(
            ${CaseCategoriesTable.id} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${CaseCategoriesTable.caseID} TEXT NOT NULL,
            ${CaseCategoriesTable.caseCaregory} TEXT NOT NULL,
            ${CaseCategoriesTable.dateOfEvent} TEXT NOT NULL,
            ${CaseCategoriesTable.placeOfEvent} TEXT NOT NULL,
            ${CaseCategoriesTable.caseNature} TEXT,
            FOREIGN KEY(case_id) REFERENCES $caseLoadTable(${CaseLoadTableFields.caseID})
          );
       ''');

    await db.execute('''
        CREATE TABLE IF NOT EXISTS $caseLoadTable (
            ${CaseLoadTableFields.caseID} TEXT PRIMARY KEY,
            ${CaseLoadTableFields.caseSerial} TEXT NOT NULL,
            ${CaseLoadTableFields.caseReporter} TEXT NOT NULL,
            ${CaseLoadTableFields.ovcCpimsId} TEXT NOT NULL,
            ${CaseLoadTableFields.ovcFirstName} TEXT NOT NULL,
            ${CaseLoadTableFields.ovcSurname} TEXT NOT NULL,
            ${CaseLoadTableFields.ovcOtherNames} TEXT NOT NULL,
            ${CaseLoadTableFields.ovcSex} TEXT NOT NULL,
            ${CaseLoadTableFields.perpetratorStatus} TEXT NOT NULL,
            ${CaseLoadTableFields.riskLevel} TEXT NOT NULL,
            ${CaseLoadTableFields.dateCaseOpened} TEXT NOT NULL,
            ${CaseLoadTableFields.caseStatus} TEXT NOT NULL,
            ${CaseLoadTableFields.caseRemarks} TEXT NOT NULL
            );
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS $caseClosureTable(
        case_id TEXT PRIMARY KEY,
        case_outcome TEXT,
        transfered_to TEXT,
        case_closure_notes TEXT,
        date_of_case_closure TEXT,
        intervention_list TEXT
      );
    ''');
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
            CaseLoadTableFields.caseID: caseLoadModel.caseID,
            CaseLoadTableFields.caseSerial: caseLoadModel.caseSerial,
            CaseLoadTableFields.caseReporter: caseLoadModel.caseReporter,
            CaseLoadTableFields.ovcCpimsId: caseLoadModel.ovcCpimsId,
            CaseLoadTableFields.ovcFirstName: caseLoadModel.ovcFirstName,
            CaseLoadTableFields.ovcSurname: caseLoadModel.ovcSurname,
            CaseLoadTableFields.ovcOtherNames: caseLoadModel.ovcOtherNames,
            CaseLoadTableFields.ovcSex: caseLoadModel.ovcSex,
            CaseLoadTableFields.perpetratorStatus:
                caseLoadModel.perpetratorStatus,
            CaseLoadTableFields.riskLevel: caseLoadModel.riskLevel,
            CaseLoadTableFields.dateCaseOpened: caseLoadModel.dateCaseOpened,
            CaseLoadTableFields.caseStatus: caseLoadModel.caseStatus,
            CaseLoadTableFields.caseRemarks: caseLoadModel.caseRemarks,
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );

        // Insert related perpetrators
        if (caseLoadModel.perpetrators != null) {
          for (final PerpetratorModel perpetrator
              in caseLoadModel.perpetrators!) {
            final perpetratorMap = perpetrator
                .toMap(); // Convert PerpetratorModel to Map<String, dynamic>
            perpetratorMap['case_id'] =
                caseLoadModel.caseID; // Add the case_id field
            batch.insert(
              perpetratorCaseLoadTable,
              perpetratorMap,
              conflictAlgorithm: ConflictAlgorithm.replace,
            );
          }
        }

        // Insert related case categories
        if (caseLoadModel.caseCategories != null) {
          for (final caseCategory in caseLoadModel.caseCategories!) {
            final caseCategoryMap = caseCategory.toMap();
            caseCategoryMap['case_id'] = caseLoadModel.caseID;
            batch.insert(
              caseLoadCategoryTable,
              caseCategoryMap,
              conflictAlgorithm: ConflictAlgorithm.replace,
            );
          }
        }

        // Insert related caregivers
        if (caseLoadModel.caregivers != null) {
          for (final caregiver in caseLoadModel.caregivers!) {
            final caregiverMap = caregiver.toMap();
            caregiverMap['case_id'] = caseLoadModel.caseID;
            batch.insert(
              caregiverCaseLoadTable,
              caregiverMap,
              conflictAlgorithm: ConflictAlgorithm.replace,
            );
          }
        }

        // Insert related siblings
        if (caseLoadModel.siblings != null) {
          for (final sibling in caseLoadModel.siblings!) {
            final siblingMap = sibling.toMap();
            siblingMap['case_id'] = caseLoadModel.caseID;
            batch.insert(
              siblingsCaseLoadTable,
              siblingMap,
              conflictAlgorithm: ConflictAlgorithm.replace,
            );
          }
        }
      }
      await batch.commit(noResult: true);
    } catch (e) {
      if (kDebugMode) {
        print("Error inserting caseload data: $e");
      }
    }
  }
}

class CaseLoadTableFields {
  static final List<String> values = [
    caseID,
    caseSerial,
    caseReporter,
    ovcCpimsId,
    ovcFirstName,
    ovcSurname,
    ovcOtherNames,
    ovcSex,
    perpetratorStatus,
    riskLevel,
    dateCaseOpened,
    caseStatus,
    caseCategories,
    caseRemarks,
  ];

  static const String caseID = 'case_id';
  static const String caseSerial = 'case_serial';
  static const String caseReporter = 'case_reporter';
  static const String ovcCpimsId = 'ovc_cpims_id';
  static const String ovcFirstName = 'ovc_first_name';
  static const String ovcSurname = 'ovc_surname';
  static const String ovcOtherNames = 'ovc_other_names';
  static const String ovcSex = 'ovc_sex';
  static const String perpetratorStatus = 'perpetrator_status';
  static const String riskLevel = 'risk_level';
  static const String dateCaseOpened = 'date_case_opened';
  static const String caseStatus = 'case_status';
  static const String caseCategories = 'case_categories';
  static const String caseRemarks = 'case_remarks';
}

class PerpetratorsCaseloadTable {
  static final List<String> values = [
    id,
    caseID,
    firstName,
    surName,
    ovcOtherNames,
    relationshipType
  ];

  static const String id = 'id';
  static const String caseID = 'case_id';
  static const String firstName = 'first_name';
  static const String surName = 'surname';
  static const String ovcOtherNames = 'ovc_other_names';
  static const String relationshipType = 'relationship_type';
}

class CaregiversCaseloadTable {
  static final List<String> values = [
    id,
    caseID,
    caregiverCpimsId,
    relationshipType,
    guardianPerson,
    dateLinked
  ];

  static const String id = 'id';
  static const String caseID = 'case_id';
  static const String caregiverCpimsId = 'caregiver_cpims_id';
  static const String relationshipType = 'relationship_type';
  static const String guardianPerson = 'guardian_person';
  static const String dateLinked = 'date_linked';
}

class SiblingsCaseLoadTable {
  static final List<String> values = [
    id,
    caseID,
    childPersonId,
    siblingPersonId,
    dateLinked,
    dateDelinked,
    remarks,
    isVoid
  ];

  static const String id = 'id';
  static const String caseID = 'case_id';
  static const String childPersonId = 'child_person_id';
  static const String siblingPersonId = 'sibling_person_id';
  static const String dateLinked = 'date_linked';
  static const String dateDelinked = 'date_delinked';
  static const String remarks = 'remarks';
  static const String isVoid = 'is_void';
}

class CaseCategoriesTable {
  static final List<String> values = [
    id,
    caseID,
    caseCaregory,
    dateOfEvent,
    placeOfEvent,
    caseNature
  ];

  static const String id = 'id';
  static const String caseID = 'case_id';
  static const String caseCaregory = 'case_category';
  static const String dateOfEvent = 'date_of_event';
  static const String placeOfEvent = 'place_of_event';
  static const String caseNature = 'case_nature';
}

var localdb = LocalDB._init();
