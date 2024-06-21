import 'dart:convert';
import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/models/registry/personal_details_model.dart';

import '../../../models/registry/registry_caregiver_model.dart';
import '../../../models/registry/registry_cbo_chv_model.dart';
import '../../../models/registry/registry_contact_details_model.dart';
import '../../../models/registry/registry_identification_details_model.dart';
import '../../../models/registry/registry_location_model.dart';
import '../../../models/registry/registry_sibling_model.dart';

class RegisterNewChildQuery {
  static Future<void> insertRegistryFormDetails(
      RegisterNewChildModel child) async {
    try {
      final db = await LocalDB.instance.database;
      // Insert personal details
      await db.insert(registryFormDetails, {
        'personType': child.personType,
        'isCaregiver': child.isCaregiver == true ? 1 : 0,
        'childOVCProgram': child.childOVCProgram ? 1 : 0,
        'firstName': child.firstName,
        'surname': child.surname,
        'otherNames': child.otherNames,
        'sex': child.sex,
        'dateOfBirth': child.dateOfBirth,
        'childClass': child.childClass,
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

  static Future<List<RegisterNewChildModel>> getRegistryFormDetails() async {
    try {
      final db = await LocalDB.instance.database;
      final List<Map<String, dynamic>> maps = await db.query(registryFormDetails);

      List<RegisterNewChildModel> list = List.generate(maps.length, (i) {
        return RegisterNewChildModel(
          personType: maps[i]['personType'],
          isCaregiver: maps[i]['isCaregiver'] == 1 ? true : false,
          childOVCProgram: maps[i]['childOVCProgram'] == 1 ? true : false,
          firstName: maps[i]['firstName'],
          surname: maps[i]['surname'],
          otherNames: maps[i]['otherNames'],
          sex: maps[i]['sex'],
          dateOfBirth: maps[i]['dateOfBirth'],
          childClass: maps[i]['childClass'],  // TODO : Add key for childClass
          registryIdentificationModel: RegistryIdentificationModel.fromJson(jsonDecode(maps[i]['registryIdentificationModel'])),
          registryContactDetailsModel: RegistryContactDetailsModel.fromJson(jsonDecode(maps[i]['registryContactDetailsModel'])),
          registryLocationModel: RegistryLocationModel.fromJson(jsonDecode(maps[i]['registryLocationModel'])),
          caregivers: (jsonDecode(maps[i]['caregivers']) as List).map((c) => RegistryCaregiverModel.fromJson(c)).toList(),
          siblings: (jsonDecode(maps[i]['siblings']) as List).map((s) => RegistrySiblingModel.fromJson(s)).toList(),
          registryCboChvModel: RegistryCboChvModel.fromJson(jsonDecode(maps[i]['registryCboChvModel'])),
          workforceIdName: maps[i]['workforceIdName'],
          datePaperFormFilled: maps[i]['datePaperFormFilled'],
        );
      });
      print(list.toString());
      return list;
    } catch (e, stackTrace) {
      print("Error retrieving registry form details: $e");
      print('Stack trace: $stackTrace');
      return [];
    }
  }

  static Future<RegisterNewChildModel?> getRegistryFormDetailById(int ID) async {
    try {
      final db = await LocalDB.instance.database;
      final List<Map<String, dynamic>> maps = await db.query(
        registryFormDetails,
        where: 'ID = ?',
        whereArgs: [ID],
      );

      if (maps.isNotEmpty) {
        final map = maps.first;
        final registerNewChildModel = RegisterNewChildModel(
          personType: map['personType'],
          isCaregiver: map['isCaregiver'] == 1 ? true : false,
          childOVCProgram: map['childOVCProgram'] == 1 ? true : false,
          firstName: map['firstName'],
          surname: map['surname'],
          otherNames: map['otherNames'],
          sex: map['sex'],
          dateOfBirth: map['dateOfBirth'],
          childClass: map['childClass'],
          registryIdentificationModel: RegistryIdentificationModel.fromJson(jsonDecode(map['registryIdentificationModel'])),
          registryContactDetailsModel: RegistryContactDetailsModel.fromJson(jsonDecode(map['registryContactDetailsModel'])),
          registryLocationModel: RegistryLocationModel.fromJson(jsonDecode(map['registryLocationModel'])),
          caregivers: (jsonDecode(map['caregivers']) as List).map((c) => RegistryCaregiverModel.fromJson(c)).toList(),
          siblings: (jsonDecode(map['siblings']) as List).map((s) => RegistrySiblingModel.fromJson(s)).toList(),
          registryCboChvModel: RegistryCboChvModel.fromJson(jsonDecode(map['registryCboChvModel'])),
          workforceIdName: map['workforceIdName'],
          datePaperFormFilled: map['datePaperFormFilled'],
        );

        print("Data retrieved: ${registerNewChildModel.toJson()}");
        return registerNewChildModel;
      } else {
        print("No record found with ID: $ID");
        return null;
      }
    } catch (e, stackTrace) {
      print("Error retrieving registry form detail: $e");
      print('Stack trace: $stackTrace');
      return null;
    }
  }

}
