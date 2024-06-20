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
          dateOfBirth: DateTime.parse(maps[i]['dateOfBirth']),
          childClass: "",  // TODO : Add key for childClass
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
}
