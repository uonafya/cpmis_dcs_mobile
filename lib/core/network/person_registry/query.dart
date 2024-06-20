import 'dart:convert';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/models/registry/personal_details_model.dart';



class RegisterNewChildQuery {
  static Future<void> insertRegistryFormDetails(RegisterNewChildModel child) async {
    try {
      final db = await LocalDB.instance.database;
        // Insert personal details
        await db.insert(registryFormDetails, {
          'personType': child.personType,
          'isCaregiver': child.isCaregiver == true ?1:0,
          'childOVCProgram': child.childOVCProgram ?1:0,
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
    } catch (e) {
      print("Error inserting new child: $e");
    }
  }
}
