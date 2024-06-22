import '../core/constants/constants.dart';
import '../core/network/database.dart';

Future<void> deleteCrsForm(String formID) async{
  try {
    var db = await localdb.database;

    // Family status
    await db.delete(
      crsFamilyStatusTable,
      where: "formID = ?",
      whereArgs: [formID]
    );

    // Fetch all forms from DB
    var forms = await db.query(
        crsTable,
        distinct: true,
        whereArgs: [0],
        where: "synced = ?"
    );

    // Close friends
    await db.delete(
      crsCloseFriendsTable,
      where: "formID = ?",
      whereArgs: [formID]
    );

    // Hobbies
    await db.delete(
      crsHobbiesTable,
      whereArgs: [formID],
      where: "formID = ?"
    );

    // Mental condition
    await db.delete(
      crsMentalConditionTable,
      where: "formID = ?",
      whereArgs: [formID]
    );

    // Physical condition
    await db.delete(
      crsPhysicalConditionTable,
      whereArgs: [formID],
      where: "formID = ?"
    );

    // Other condition
    await db.delete(
        crsOtherConditionTable,
        whereArgs: [formID],
        where: "formID = ?"
    );

    // Case categories
    await db.delete(
      crsFormSubCategoriesTable,
      where: "crsFormCategoryID = ?",
      whereArgs: [formID]
    );

    await db.delete(
        crsFormCategoriesTable,
        where: "formID = ?",
        whereArgs: [formID]
    );

    // Referrals table
    await db.delete(
      crsReferralsTable,
      where: "formID = ?",
      whereArgs: [formID]
    );

    // Immediate needs
    await db.delete(
      crsImmediateTable,
      whereArgs: [formID],
      where: "formID = ?"
    );

    // Future needs
    await db.delete(
        crsFutureNeedsTable,
        whereArgs: [formID],
        where: "formID = ?"
    );

    // Perpetrators
    await db.delete(
      crsFormPerpetrators,
      where: "formID = ?",
      whereArgs: [formID]
    );

    // Delete form
    await db.delete(
      crsTable,
      where: "id = ?",
      whereArgs: [formID]
    );
  } catch(err) {
    throw "Could Not Delete Form";
  }
}