// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CtrParticipantSchemaStruct extends BaseStruct {
  CtrParticipantSchemaStruct({
    String? peopleId,
    String? name,
    String? role,
  })  : _peopleId = peopleId,
        _name = name,
        _role = role;

  // "people_id" field.
  String? _peopleId;
  String get peopleId => _peopleId ?? '';
  set peopleId(String? val) => _peopleId = val;

  bool hasPeopleId() => _peopleId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;

  bool hasRole() => _role != null;

  static CtrParticipantSchemaStruct fromMap(Map<String, dynamic> data) =>
      CtrParticipantSchemaStruct(
        peopleId: data['people_id'] as String?,
        name: data['name'] as String?,
        role: data['role'] as String?,
      );

  static CtrParticipantSchemaStruct? maybeFromMap(dynamic data) => data is Map
      ? CtrParticipantSchemaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'people_id': _peopleId,
        'name': _name,
        'role': _role,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'people_id': serializeParam(
          _peopleId,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
      }.withoutNulls;

  static CtrParticipantSchemaStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CtrParticipantSchemaStruct(
        peopleId: deserializeParam(
          data['people_id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CtrParticipantSchemaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CtrParticipantSchemaStruct &&
        peopleId == other.peopleId &&
        name == other.name &&
        role == other.role;
  }

  @override
  int get hashCode => const ListEquality().hash([peopleId, name, role]);
}

CtrParticipantSchemaStruct createCtrParticipantSchemaStruct({
  String? peopleId,
  String? name,
  String? role,
}) =>
    CtrParticipantSchemaStruct(
      peopleId: peopleId,
      name: name,
      role: role,
    );
