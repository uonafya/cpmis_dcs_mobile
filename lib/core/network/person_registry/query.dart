import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/models/registry/personal_details_model.dart';

class PersonRegistryQuery {
  Future<void> insertPersonIdentification(RegisterNewChildModel person) async {
    // Insert the person's identification details into the database
    try {
      final db = await LocalDB.instance.database;
      await db.insert(registryIdentificationTable,
          person.registryIdentificationModel.toJson());
    } catch (e) {
      print("Error inserting person identification: $e");
    }
  }
}
