import 'dart:convert';

import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/models/case_load/caregiver_model.dart';
import 'package:cpims_dcs_mobile/models/case_load/case_load_model.dart';
import 'package:cpims_dcs_mobile/models/case_load/perpetrator_model.dart';
import 'package:cpims_dcs_mobile/models/case_load/siblings_model.dart';
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
        List<CaseLoadModel> ovcDataList = [];

        for (var ovc in ovcQuery) {
          // Decode JSON fields
          Map<String, dynamic> ovcData = Map<String, dynamic>.from(ovc);

          if (ovcData[CaseLoadTableFields.perpetrators] != null) {
            ovcData[CaseLoadTableFields.perpetrators] =
                (jsonDecode(ovcData[CaseLoadTableFields.perpetrators] as String)
                        as List<dynamic>?)
                    ?.map((e) => PerpetratorModel.fromJson(e).toJson())
                    .toList();
          }
          // siblings
          if (ovcData[CaseLoadTableFields.siblings] != null) {
            ovcData[CaseLoadTableFields.siblings] =
                (jsonDecode(ovcData[CaseLoadTableFields.siblings] as String)
                        as List<dynamic>?)
                    ?.map((e) => SiblingsModel.fromJson(e).toJson())
                    .toList();
          }

          // caregivers
          if (ovcData[CaseLoadTableFields.caregivers] != null) {
            ovcData[CaseLoadTableFields.caregivers] =
                (jsonDecode(ovcData[CaseLoadTableFields.caregivers] as String)
                        as List<dynamic>?)
                    ?.map((e) => CaregiverModel.fromJson(e).toJson())
                    .toList();
          }

          // case categories
          if (ovcData[CaseLoadTableFields.caseCategories] != null) {
            ovcData[CaseLoadTableFields.caseCategories] = (jsonDecode(
                        ovcData[CaseLoadTableFields.caseCategories] as String)
                    as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList();
          }

          // household economic status
          if (ovcData[CaseLoadTableFields.householdEconomicStatus] != null) {
            ovcData[CaseLoadTableFields.householdEconomicStatus] = (jsonDecode(
                    ovcData[CaseLoadTableFields.householdEconomicStatus]
                        as String) as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList();
          }

          // mental condition
          if (ovcData[CaseLoadTableFields.mentalCondition] != null) {
            ovcData[CaseLoadTableFields.mentalCondition] = (jsonDecode(
                        ovcData[CaseLoadTableFields.mentalCondition] as String)
                    as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList();
          }

          // physical condition
          if (ovcData[CaseLoadTableFields.physicalCondition] != null) {
            ovcData[CaseLoadTableFields.physicalCondition] = (jsonDecode(
                    ovcData[CaseLoadTableFields.physicalCondition]
                        as String) as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList();
          }

          // other condition
          if (ovcData[CaseLoadTableFields.otherCondition] != null) {
            ovcData[CaseLoadTableFields.otherCondition] = (jsonDecode(
                        ovcData[CaseLoadTableFields.otherCondition] as String)
                    as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList();
          }

          // immediate needs
          if (ovcData[CaseLoadTableFields.immediateNeeds] != null) {
            ovcData[CaseLoadTableFields.immediateNeeds] = (jsonDecode(
                        ovcData[CaseLoadTableFields.immediateNeeds] as String)
                    as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList();
          }

          // future needs
          if (ovcData[CaseLoadTableFields.futureNeeds] != null) {
            ovcData[CaseLoadTableFields.futureNeeds] =
                (jsonDecode(ovcData[CaseLoadTableFields.futureNeeds] as String)
                        as List<dynamic>?)
                    ?.map((e) => e.toString())
                    .toList();
          }

          // friends
          if (ovcData[CaseLoadTableFields.friends] != null) {
            ovcData[CaseLoadTableFields.friends] =
                (jsonDecode(ovcData[CaseLoadTableFields.friends] as String)
                        as List<dynamic>?)
                    ?.map((e) => e.toString())
                    .toList();
          }

          // hobbies
          if (ovcData[CaseLoadTableFields.hobbies] != null) {
            ovcData[CaseLoadTableFields.hobbies] =
                (jsonDecode(ovcData[CaseLoadTableFields.hobbies] as String)
                        as List<dynamic>?)
                    ?.map((e) => e.toString())
                    .toList();
          }

          // Convert summonStatus from 1/0 to true/false
          if (ovcData[CaseLoadTableFields.summonStatus] != null) {
            ovcData[CaseLoadTableFields.summonStatus] =
                ovcData[CaseLoadTableFields.summonStatus] == 1 ? true : false;
          }

          ovcDataList.add(CaseLoadModel.fromJson(ovcData));
        }

        return ovcDataList;
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

final searchCaseLoad = SearchCaseLoad();
