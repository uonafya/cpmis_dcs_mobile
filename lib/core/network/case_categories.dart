import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/core/network/http_client.dart';
import 'package:cpims_dcs_mobile/models/categories_from_upstream.dart';
import 'package:cpims_dcs_mobile/models/nameid.dart';
import 'package:sqflite/sqflite.dart';


Future<void> saveCategoriesInDB() async {
  try {
    var db = await localdb.database;
    var request = await httpClient.request("${cpimsApiUrl}v1/settings/?field_name=case_category_id", "GET", null);

    print(request.toString());
    var categories = request.data.map((e) => CategoriesFromUpstream.fromJSON(e)).toList();

    saveCategories(db, categories);
    print("Save categories done");
  } catch(err) {
    print(err.toString());
    throw "Could Not Save Categories";
  }
}

Future<void> saveCategories(Database db, List<dynamic> categories) async {
  try {
    var batch = db.batch();

    for (var i = 0; i < categories.length; i++) {
      var categ = categories[i];
      batch.insert(categoriesTable, {
        "id": categ.id ?? "",
        "name": categ.description ?? "",
        "subcategory": categ.subCategory,
        "orderNo": categ.order
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    }

    await batch.commit();
  } catch(err) {
    throw "Could Not Get categories";
  }
}

Future<List<NameID>> getCategoriesFromDB() async{
  try {
    var db = await localdb.database;

    // Get all items from categories table
    var results = await db.query(
      categoriesTable,
      distinct: true,
      columns: ['name', 'id'],
    );

    // Map to name id
    List<NameID> toReturn = results.map((e) => NameID(name: e['name'].toString(), id: e['id'].toString())).toList();

    return toReturn;
  } catch(err) {
    throw "Could Not Get Categories";
  }
}