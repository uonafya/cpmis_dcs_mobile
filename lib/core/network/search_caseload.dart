import 'dart:convert';

import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:cpims_dcs_mobile/core/network/database.dart';
import 'package:cpims_dcs_mobile/models/case_load/caregiver_model.dart';
import 'package:cpims_dcs_mobile/models/case_load/case_category_model.dart';
import 'package:cpims_dcs_mobile/models/case_load/case_load_model.dart';
import 'package:cpims_dcs_mobile/models/case_load/conditions_model.dart';
import 'package:cpims_dcs_mobile/models/case_load/event_model.dart';
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

      return ovcQuery.isNotEmpty
          ? await getCaseLoadListFromQuery(ovcQuery)
          : [];
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

      return ovcQuery.isNotEmpty
          ? await getCaseLoadListFromQuery(ovcQuery)
          : [];
    } catch (e) {
      if (kDebugMode) {
        print("Error searching by ovc id: $e");
      }
    }
    return null;
  }

  // search ovc by case serial number
  Future<List<CaseLoadModel>?> searchOVCByCaseSerial(
    String caseSerial,
  ) async {
    try {
      final db = await LocalDB.instance.database;

      final ovcQuery = await db.query(
        caseLoadTable,
        where: '${CaseLoadTableFields.caseSerial} = ?',
        whereArgs: [caseSerial],
      );

      return ovcQuery.isNotEmpty
          ? await getCaseLoadListFromQuery(ovcQuery)
          : [];
    } catch (e) {
      if (kDebugMode) {
        print("Error searching by case serial: $e");
      }
    }
    return null;
  }

  // search by org unit Id
  // search ovc by case serial number
  Future<List<CaseLoadModel>?> searchOVCByOrgUnit(
    String orgUnitId,
  ) async {
    try {
      final db = await LocalDB.instance.database;

      final ovcQuery = await db.query(
        caseLoadTable,
        where: '${CaseLoadTableFields.orgUnitId} = ?',
        whereArgs: [
          orgUnitId,
        ],
      );

      return ovcQuery.isNotEmpty
          ? await getCaseLoadListFromQuery(ovcQuery)
          : [];
    } catch (e) {
      if (kDebugMode) {
        print("Error searching by case serial: $e");
      }
    }
    return null;
  }

  // Decodes and converts JSON fields in OVC data
  Map<String, dynamic> decodeJsonFields(Map<String, dynamic> ovcData) {
    if (ovcData[CaseLoadTableFields.perpetrators] != null) {
      ovcData[CaseLoadTableFields.perpetrators] =
          (jsonDecode(ovcData[CaseLoadTableFields.perpetrators] as String)
                  as List<dynamic>?)
              ?.map((e) => PerpetratorModel.fromJson(e).toJson())
              .toList();
    }

    if (ovcData[CaseLoadTableFields.siblings] != null) {
      ovcData[CaseLoadTableFields.siblings] =
          (jsonDecode(ovcData[CaseLoadTableFields.siblings] as String)
                  as List<dynamic>?)
              ?.map((e) => SiblingsModel.fromJson(e).toJson())
              .toList();
    }

    if (ovcData[CaseLoadTableFields.caregivers] != null) {
      ovcData[CaseLoadTableFields.caregivers] =
          (jsonDecode(ovcData[CaseLoadTableFields.caregivers] as String)
                  as List<dynamic>?)
              ?.map((e) => CaregiverModel.fromJson(e).toJson())
              .toList();
    }

    if (ovcData[CaseLoadTableFields.caseCategories] != null) {
      ovcData[CaseLoadTableFields.caseCategories] =
          (jsonDecode(ovcData[CaseLoadTableFields.caseCategories] as String)
                  as List<dynamic>?)
              ?.map((e) => CaseCategoryModel.fromJson(e).toJson())
              .toList();
    }

    if (ovcData[CaseLoadTableFields.householdEconomicStatus] != null) {
      ovcData[CaseLoadTableFields.householdEconomicStatus] = (jsonDecode(
              ovcData[CaseLoadTableFields.householdEconomicStatus]
                  as String) as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList();
    }

    if (ovcData[CaseLoadTableFields.mentalCondition] != null) {
      ovcData[CaseLoadTableFields.mentalCondition] =
          (jsonDecode(ovcData[CaseLoadTableFields.mentalCondition] as String)
                  as List<dynamic>?)
              ?.map((e) => ConditionsModel.fromJson(e).toJson())
              .toList();
    }

    if (ovcData[CaseLoadTableFields.physicalCondition] != null) {
      ovcData[CaseLoadTableFields.physicalCondition] =
          (jsonDecode(ovcData[CaseLoadTableFields.physicalCondition] as String)
                  as List<dynamic>?)
              ?.map((e) => ConditionsModel.fromJson(e).toJson())
              .toList();
    }

    if (ovcData[CaseLoadTableFields.otherCondition] != null) {
      ovcData[CaseLoadTableFields.otherCondition] =
          (jsonDecode(ovcData[CaseLoadTableFields.otherCondition] as String)
                  as List<dynamic>?)
              ?.map((e) => ConditionsModel.fromJson(e).toJson())
              .toList();
    }

    if (ovcData[CaseLoadTableFields.immediateNeeds] != null) {
      ovcData[CaseLoadTableFields.immediateNeeds] =
          (jsonDecode(ovcData[CaseLoadTableFields.immediateNeeds] as String)
                  as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList();
    }

    if (ovcData[CaseLoadTableFields.futureNeeds] != null) {
      ovcData[CaseLoadTableFields.futureNeeds] =
          (jsonDecode(ovcData[CaseLoadTableFields.futureNeeds] as String)
                  as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList();
    }

    if (ovcData[CaseLoadTableFields.friends] != null) {
      ovcData[CaseLoadTableFields.friends] =
          (jsonDecode(ovcData[CaseLoadTableFields.friends] as String)
                  as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList();
    }

    if (ovcData[CaseLoadTableFields.hobbies] != null) {
      ovcData[CaseLoadTableFields.hobbies] =
          (jsonDecode(ovcData[CaseLoadTableFields.hobbies] as String)
                  as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList();
    }

    if (ovcData[CaseLoadTableFields.summonStatus] != null) {
      ovcData[CaseLoadTableFields.summonStatus] =
          ovcData[CaseLoadTableFields.summonStatus] == 1 ? true : false;
    }

    if (ovcData[CaseLoadTableFields.events] != null) {
      ovcData[CaseLoadTableFields.events] =
          (jsonDecode(ovcData[CaseLoadTableFields.events] as String)
                  as List<dynamic>?)
              ?.map((e) => EventModel.fromJson(e).toJson())
              .toList();
    }

    return ovcData;
  }

  // Creates a list of CaseLoadModels from query results
  Future<List<CaseLoadModel>> getCaseLoadListFromQuery(
      List<Map<String, dynamic>> queryResult) async {
    List<CaseLoadModel> ovcDataList = [];
    for (var ovc in queryResult) {
      Map<String, dynamic> ovcData =
          decodeJsonFields(Map<String, dynamic>.from(ovc));
      ovcDataList.add(CaseLoadModel.fromJson(ovcData));
    }
    return ovcDataList;
  }
}

final searchCaseLoad = SearchCaseLoad();
