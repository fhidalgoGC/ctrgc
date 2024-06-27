// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PeopleStruct extends BaseStruct {
  PeopleStruct({
    String? id,
    String? externalId,
    String? fullName,
    String? email,
    String? phoneNumber,
  })  : _id = id,
        _externalId = externalId,
        _fullName = fullName,
        _email = email,
        _phoneNumber = phoneNumber;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "externalId" field.
  String? _externalId;
  String get externalId => _externalId ?? '';
  set externalId(String? val) => _externalId = val;

  bool hasExternalId() => _externalId != null;

  // "fullName" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;

  bool hasFullName() => _fullName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  static PeopleStruct fromMap(Map<String, dynamic> data) => PeopleStruct(
        id: data['id'] as String?,
        externalId: data['externalId'] as String?,
        fullName: data['fullName'] as String?,
        email: data['email'] as String?,
        phoneNumber: data['phoneNumber'] as String?,
      );

  static PeopleStruct? maybeFromMap(dynamic data) =>
      data is Map ? PeopleStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'externalId': _externalId,
        'fullName': _fullName,
        'email': _email,
        'phoneNumber': _phoneNumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'externalId': serializeParam(
          _externalId,
          ParamType.String,
        ),
        'fullName': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'phoneNumber': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
      }.withoutNulls;

  static PeopleStruct fromSerializableMap(Map<String, dynamic> data) =>
      PeopleStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        externalId: deserializeParam(
          data['externalId'],
          ParamType.String,
          false,
        ),
        fullName: deserializeParam(
          data['fullName'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phoneNumber'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PeopleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PeopleStruct &&
        id == other.id &&
        externalId == other.externalId &&
        fullName == other.fullName &&
        email == other.email &&
        phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, externalId, fullName, email, phoneNumber]);
}

PeopleStruct createPeopleStruct({
  String? id,
  String? externalId,
  String? fullName,
  String? email,
  String? phoneNumber,
}) =>
    PeopleStruct(
      id: id,
      externalId: externalId,
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
    );
