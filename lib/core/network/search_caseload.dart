import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/models/case_load/case_load_model.dart';
import 'package:flutter/foundation.dart';

class SearchCaseLoad {
  // search ovc by names
  Future<List<CaseLoadModel>?> searchOVCByNames(
    String nameInput,
  ) async {
    try {
      final db = await LocalDB.instance.database;

      // Split the input into individual names
      List<String> names = nameInput.split(' ');

      List<String> whereClauses = [];
      List<String> whereArgs = [];

      for (var name in names) {
        whereClauses.add(
            '${CaseLoadTableFields.ovcFirstName} LIKE ? OR ${CaseLoadTableFields.ovcSurname} LIKE ? OR ${CaseLoadTableFields.ovcOtherNames} LIKE ?');
        whereArgs.add('%$name%');
        whereArgs.add('%$name%');
        whereArgs.add('%$name%');
      }

      // Join the where clauses with OR
      String whereString = whereClauses.join(' OR ');

      final ovcQuery = await db.query(
        caseLoadTable,
        where: whereString,
        whereArgs: whereArgs,
      );

      if (ovcQuery.isNotEmpty) {
        List<CaseLoadModel> ovcData = [];

        for (var ovc in ovcQuery) {
          ovcData.add(CaseLoadModel.fromJson(ovc));
        }

        return ovcData;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error searching ovc data: $e");
      }
    }
    return null;
  }

  // search siblings by ovc id
  Future<List<CaseLoadModel>?> searchOVCByCPIMSID(
    String ovcId,
  ) async {
    try {
      final db = await LocalDB.instance.database;

      final ovcQuery = await db.query(
        caseLoadTable,
        where: '${CaseLoadTableFields.ovcCpimsId} = ?',
        whereArgs: [ovcId],
      );

      if (ovcQuery.isNotEmpty) {
        List<CaseLoadModel> caseLoadData = [];

        for (var caseLoad in ovcQuery) {
          caseLoadData.add(CaseLoadModel.fromJson(caseLoad));
        }

        return caseLoadData;
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error searching by ovc id: $e");
      }
    }
    return null;
  }

  // search ovc by case serial number
  Future<CaseLoadModel?> searchOVCByCaseSerial(
    String caseSerial,
  ) async {
    try {
      final db = await LocalDB.instance.database;

      final ovcQuery = await db.query(
        caseLoadTable,
        where: '${CaseLoadTableFields.caseSerial} = ?',
        whereArgs: [caseSerial],
      );

      if (ovcQuery.isNotEmpty) {
        return CaseLoadModel.fromJson(ovcQuery.first);
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error searching by case serial: $e");
      }
    }
    return null;
  }
}
