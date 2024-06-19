import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/models/registry/registry_identification_details_model.dart';

class PersonRegistryQuery {
  // insert queries
  Future<void> insertPersonIdentification(
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
  Future<RegistryIdentificationModel> getPersonIdentification() async {
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
