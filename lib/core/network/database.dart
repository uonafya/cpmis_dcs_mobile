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
      CREATE TABLE IF NOT EXISTS $registryFormDetails (
        personType TEXT NOT NULL,
        isCaregiver BOOLEAN,
        childOVCProgram BOOLEAN NOT NULL,
        firstName TEXT NOT NULL,
        surname TEXT NOT NULL,
        otherNames TEXT,
        sex TEXT NOT NULL,
        dateOfBirth TEXT NOT NULL,
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
    CREATE TABLE IF NOT EXISTS $registrtPersonalDetails (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      personType TEXT,
      isCaregiver BOOLEAN,
      childOVCProgram BOOLEAN,
      firstName TEXT,
      surname TEXT,
      otherNames TEXT,
      sex TEXT,
      dateOfBirth TEXT,
      workforceIdName TEXT,
      datePaperFormFilled TEXT
    )
    ''');

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
  }
}

var localdb = LocalDB._init();
