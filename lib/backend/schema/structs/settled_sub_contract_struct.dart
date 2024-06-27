// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SettledSubContractStruct extends BaseStruct {
  SettledSubContractStruct({
    String? createdByName,
    String? createdById,
  })  : _createdByName = createdByName,
        _createdById = createdById;

  // "created_by_name" field.
  String? _createdByName;
  String get createdByName => _createdByName ?? '';
  set createdByName(String? val) => _createdByName = val;

  bool hasCreatedByName() => _createdByName != null;

  // "created_by_id" field.
  String? _createdById;
  String get createdById => _createdById ?? '';
  set createdById(String? val) => _createdById = val;

  bool hasCreatedById() => _createdById != null;

  static SettledSubContractStruct fromMap(Map<String, dynamic> data) =>
      SettledSubContractStruct(
        createdByName: data['created_by_name'] as String?,
        createdById: data['created_by_id'] as String?,
      );

  static SettledSubContractStruct? maybeFromMap(dynamic data) => data is Map
      ? SettledSubContractStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'created_by_name': _createdByName,
        'created_by_id': _createdById,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'created_by_name': serializeParam(
          _createdByName,
          ParamType.String,
        ),
        'created_by_id': serializeParam(
          _createdById,
          ParamType.String,
        ),
      }.withoutNulls;

  static SettledSubContractStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SettledSubContractStruct(
        createdByName: deserializeParam(
          data['created_by_name'],
          ParamType.String,
          false,
        ),
        createdById: deserializeParam(
          data['created_by_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SettledSubContractStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SettledSubContractStruct &&
        createdByName == other.createdByName &&
        createdById == other.createdById;
  }

  @override
  int get hashCode => const ListEquality().hash([createdByName, createdById]);
}

SettledSubContractStruct createSettledSubContractStruct({
  String? createdByName,
  String? createdById,
}) =>
    SettledSubContractStruct(
      createdByName: createdByName,
      createdById: createdById,
    );
