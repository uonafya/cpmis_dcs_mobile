import 'dart:convert';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/models/registry/registry_identification_details_model.dart';
import 'package:cpims_dcs_mobile/models/registry/registry_contact_details_model.dart';
import 'package:cpims_dcs_mobile/models/registry/personal_details_model.dart';
import 'package:cpims_dcs_mobile/models/registry/registry_caregiver_model.dart';
import 'package:cpims_dcs_mobile/models/registry/registry_cbo_chv_model.dart';
import 'package:cpims_dcs_mobile/models/registry/registry_location_model.dart';
import 'package:cpims_dcs_mobile/models/registry/registry_sibling_model.dart';



class PersonalDetailsQuery {
  // insert queries
  static Future<void> insertPersonalDetails(
      RegistryPersonalDetailsModel person) async {
    // Insert the person's identification details into the database
    try {
      final db = await LocalDB.instance.database;
      await db.insert(registrtPersonalDetails, person.toJson());
    } catch (e) {
      print("Error inserting person identification: $e");
    }
  }

  // select queries
  static Future<RegistryPersonalDetailsModel> getPersonalDetails() async {
    // Get the person's identification details from the database
    try {
      final db = await LocalDB.instance.database;
      final List<Map<String, dynamic>> maps =
      await db.query(registryIdentificationTable);
      return RegistryPersonalDetailsModel.fromJson(maps.first);
    } catch (e) {
      print("Error getting person identification: $e");
      return RegistryPersonalDetailsModel(
          personType: "",
          childOVCProgram: false,
          firstName: "",
          surname: "",
          sex: "",
          dateOfBirth: DateTime.now(),
          workforceIdName: "",
          datePaperFormFilled: ""
      );
    }
  }
}

class PersonRegistryQuery {
  // insert queries
  static Future<void> insertPersonIdentification(
      RegistryIdentificationModel person) async {
    // Insert the person's identification details into the database
    try {
      final db = await LocalDB.instance.database;
      await db.insert(registryIdentificationTable, person.toJson());
    } catch (e) {
      print("Error inserting person identification: $e");
    }
  }

  // select queries
  static Future<RegistryIdentificationModel> getPersonIdentification() async {
    // Get the person's identification details from the database
    try {
      final db = await LocalDB.instance.database;
      final List<Map<String, dynamic>> maps =
          await db.query(registryIdentificationTable);
      return RegistryIdentificationModel.fromJson(maps.first);
    } catch (e) {
      print("Error getting person identification: $e");
      return RegistryIdentificationModel(
          birthRegistrationNumber: "",
          givenName: "",
          countryOfOrigin: "",
          tribe: "",
          religion: "");
    }
  }
}

class ContactDetailsQuery {
  // Insert contact details
  static Future<void> insertContactDetails(RegistryContactDetailsModel contact) async {
    try {
      final db = await LocalDB.instance.database;
      await db.insert(registryContactTable, contact.toJson());
    } catch (e) {
      print("Error inserting contact details: $e");
    }
  }

  // Select contact details
  static Future<RegistryContactDetailsModel> getContactDetails() async {
    try {
      final db = await LocalDB.instance.database;
      final List<Map<String, dynamic>> maps = await db.query(registryContactTable);
      return RegistryContactDetailsModel.fromJson(maps.first);
    } catch (e) {
      print("Error getting contact details: $e");
      return RegistryContactDetailsModel(
        designatedPhoneNumber: "",
        otherMobileNumber: "",
        emailAddress: "",
        physicalLocation: "",
      );
    }
  }
}

class LocationQuery {
  // Insert location details
  static Future<void> insertLocationDetails(RegistryLocationModel location) async {
    try {
      final db = await LocalDB.instance.database;
      await db.insert(registryLocationTable, location.toJson());
    } catch (e) {
      print("Error inserting location details: $e");
    }
  }

  // Select location details
  static Future<RegistryLocationModel> getLocationDetails() async {
    try {
      final db = await LocalDB.instance.database;
      final List<Map<String, dynamic>> maps = await db.query(registryLocationTable);
      return RegistryLocationModel.fromJson(maps.first);
    } catch (e) {
      print("Error getting location details: $e");
      return RegistryLocationModel(
        county: "",
        subCounty: "",
        ward: "",
      );
    }
  }
}

class CaregiverQuery {
  // Insert caregiver
  static Future<void> insertCaregiver(RegistryCaregiverModel caregiver) async {
    try {
      final db = await LocalDB.instance.database;
      await db.insert(registryCaregiverTable, caregiver.toJson());
    } catch (e) {
      print("Error inserting caregiver: $e");
    }
  }

  // Select caregivers
  static Future<List<RegistryCaregiverModel>> getCaregivers() async {
    try {
      final db = await LocalDB.instance.database;
      final List<Map<String, dynamic>> maps = await db.query(registryCaregiverTable);
      return List.generate(maps.length, (i) {
        return RegistryCaregiverModel.fromJson(maps[i]);
      });
    } catch (e) {
      print("Error getting caregivers: $e");
      return [];
    }
  }
}

class SiblingQuery {
  // Insert sibling
  static Future<void> insertSibling(RegistrySiblingModel sibling) async {
    try {
      final db = await LocalDB.instance.database;
      await db.insert(registrySiblingTable, sibling.toJson());
    } catch (e) {
      print("Error inserting sibling: $e");
    }
  }

  // Select siblings
  static Future<List<RegistrySiblingModel>> getSiblings() async {
    try {
      final db = await LocalDB.instance.database;
      final List<Map<String, dynamic>> maps = await db.query(registrySiblingTable);
      return List.generate(maps.length, (i) {
        return RegistrySiblingModel.fromJson(maps[i]);
      });
    } catch (e) {
      print("Error getting siblings: $e");
      return [];
    }
  }
}

class CboChvQuery {
  // Insert CBO/CHV details
  static Future<void> insertCboChvDetails(RegistryCboChvModel cboChv) async {
    try {
      final db = await LocalDB.instance.database;
      await db.insert(registryCboChvTable, cboChv.toJson());
    } catch (e) {
      print("Error inserting CBO/CHV details: $e");
    }
  }

  // Select CBO/CHV details
  static Future<RegistryCboChvModel> getCboChvDetails() async {
    try {
      final db = await LocalDB.instance.database;
      final List<Map<String, dynamic>> maps = await db.query(registryCboChvTable);
      return RegistryCboChvModel.fromJson(maps.first);
    } catch (e) {
      print("Error getting CBO/CHV details: $e");
      return RegistryCboChvModel(
        cboParentUnit: "",
        ovcProgramEnrollment: "",
        chv: "",
      );
    }
  }
}


class RegisterNewChildQuery {
  static Future<void> insertRegisterNewChild(RegisterNewChildModel child) async {
    try {
      final db = await LocalDB.instance.database;

      // Start a transaction
      await db.transaction((txn) async {
        // Insert identification details
        await txn.insert(registryIdentificationTable, child.registryIdentificationModel.toJson());

        // Insert contact details
        await txn.insert(registryContactTable, child.registryContactDetailsModel.toJson());

        // Insert location details
        await txn.insert(registryLocationTable, child.registryLocationModel.toJson());

        // Insert each caregiver
        for (var caregiver in child.caregivers) {
          await txn.insert(registryCaregiverTable, caregiver.toJson());
        }

        // Insert each sibling
        for (var sibling in child.siblings) {
          await txn.insert(registrySiblingTable, sibling.toJson());
        }

        // Insert CBO/CHV details
        await txn.insert(registryCboChvTable, child.registryCboChvModel.toJson());

        // Insert personal details
        await txn.insert(registrtPersonalDetails, {
          'personType': child.personType,
          'isCaregiver': child.isCaregiver,
          'childOVCProgram': child.childOVCProgram,
          'firstName': child.firstName,
          'surname': child.surname,
          'otherNames': child.otherNames,
          'sex': child.sex,
          'dateOfBirth': child.dateOfBirth.toIso8601String(),
          'workforceIdName': child.workforceIdName,
          'datePaperFormFilled': child.datePaperFormFilled,
        });
      });

    } catch (e) {
      print("Error inserting new child: $e");
    }
  }

  static Future<void> insertRegistryFormDetails(RegisterNewChildModel child) async {
    try {
      final db = await LocalDB.instance.database;

      // Start a transactionh
      await db.transaction((txn) async {
        // Insert personal details
        await txn.insert(registryFormDetails, {
          'personType': child.personType,
          'isCaregiver': child.isCaregiver,
          'childOVCProgram': child.childOVCProgram,
          'firstName': child.firstName,
          'surname': child.surname,
          'otherNames': child.otherNames,
          'sex': child.sex,
          'dateOfBirth': child.dateOfBirth.toIso8601String(),
          'registryIdentificationModel': jsonEncode(child.registryIdentificationModel.toJson()),
          'registryContactDetailsModel': jsonEncode(child.registryContactDetailsModel.toJson()),
          'registryLocationModel': jsonEncode(child.registryLocationModel.toJson()),
          'caregivers': jsonEncode(child.caregivers.map((c) => c.toJson()).toList()),
          'siblings': jsonEncode(child.siblings.map((s) => s.toJson()).toList()),
          'registryCboChvModel': jsonEncode(child.registryCboChvModel.toJson()),
          'workforceIdName': child.workforceIdName,
          'datePaperFormFilled': child.datePaperFormFilled,
        });
      });

    } catch (e) {
      print("Error inserting new child: $e");
    }
  }
}
