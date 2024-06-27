// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EnviromentsStruct extends BaseStruct {
  EnviromentsStruct({
    bool? setforms,
    bool? setrootfields,
  })  : _setforms = setforms,
        _setrootfields = setrootfields;

  // "SETFORMS" field.
  bool? _setforms;
  bool get setforms => _setforms ?? false;
  set setforms(bool? val) => _setforms = val;

  bool hasSetforms() => _setforms != null;

  // "SETROOTFIELDS" field.
  bool? _setrootfields;
  bool get setrootfields => _setrootfields ?? false;
  set setrootfields(bool? val) => _setrootfields = val;

  bool hasSetrootfields() => _setrootfields != null;

  static EnviromentsStruct fromMap(Map<String, dynamic> data) =>
      EnviromentsStruct(
        setforms: data['SETFORMS'] as bool?,
        setrootfields: data['SETROOTFIELDS'] as bool?,
      );

  static EnviromentsStruct? maybeFromMap(dynamic data) => data is Map
      ? EnviromentsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'SETFORMS': _setforms,
        'SETROOTFIELDS': _setrootfields,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'SETFORMS': serializeParam(
          _setforms,
          ParamType.bool,
        ),
        'SETROOTFIELDS': serializeParam(
          _setrootfields,
          ParamType.bool,
        ),
      }.withoutNulls;

  static EnviromentsStruct fromSerializableMap(Map<String, dynamic> data) =>
      EnviromentsStruct(
        setforms: deserializeParam(
          data['SETFORMS'],
          ParamType.bool,
          false,
        ),
        setrootfields: deserializeParam(
          data['SETROOTFIELDS'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'EnviromentsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EnviromentsStruct &&
        setforms == other.setforms &&
        setrootfields == other.setrootfields;
  }

  @override
  int get hashCode => const ListEquality().hash([setforms, setrootfields]);
}

EnviromentsStruct createEnviromentsStruct({
  bool? setforms,
  bool? setrootfields,
}) =>
    EnviromentsStruct(
      setforms: setforms,
      setrootfields: setrootfields,
    );
