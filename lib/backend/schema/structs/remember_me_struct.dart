// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RememberMeStruct extends BaseStruct {
  RememberMeStruct({
    String? email,
    String? password,
    bool? remember,
  })  : _email = email,
        _password = password,
        _remember = remember;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;

  bool hasPassword() => _password != null;

  // "remember" field.
  bool? _remember;
  bool get remember => _remember ?? false;
  set remember(bool? val) => _remember = val;

  bool hasRemember() => _remember != null;

  static RememberMeStruct fromMap(Map<String, dynamic> data) =>
      RememberMeStruct(
        email: data['email'] as String?,
        password: data['password'] as String?,
        remember: data['remember'] as bool?,
      );

  static RememberMeStruct? maybeFromMap(dynamic data) => data is Map
      ? RememberMeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'email': _email,
        'password': _password,
        'remember': _remember,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
        'remember': serializeParam(
          _remember,
          ParamType.bool,
        ),
      }.withoutNulls;

  static RememberMeStruct fromSerializableMap(Map<String, dynamic> data) =>
      RememberMeStruct(
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
        remember: deserializeParam(
          data['remember'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'RememberMeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RememberMeStruct &&
        email == other.email &&
        password == other.password &&
        remember == other.remember;
  }

  @override
  int get hashCode => const ListEquality().hash([email, password, remember]);
}

RememberMeStruct createRememberMeStruct({
  String? email,
  String? password,
  bool? remember,
}) =>
    RememberMeStruct(
      email: email,
      password: password,
      remember: remember,
    );
