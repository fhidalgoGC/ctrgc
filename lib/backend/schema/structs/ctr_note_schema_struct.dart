// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CtrNoteSchemaStruct extends BaseStruct {
  CtrNoteSchemaStruct({
    String? peopleId,
    String? peopleName,
    String? text,
    String? date,
  })  : _peopleId = peopleId,
        _peopleName = peopleName,
        _text = text,
        _date = date;

  // "people_id" field.
  String? _peopleId;
  String get peopleId => _peopleId ?? '';
  set peopleId(String? val) => _peopleId = val;

  bool hasPeopleId() => _peopleId != null;

  // "people_name" field.
  String? _peopleName;
  String get peopleName => _peopleName ?? '';
  set peopleName(String? val) => _peopleName = val;

  bool hasPeopleName() => _peopleName != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  static CtrNoteSchemaStruct fromMap(Map<String, dynamic> data) =>
      CtrNoteSchemaStruct(
        peopleId: data['people_id'] as String?,
        peopleName: data['people_name'] as String?,
        text: data['text'] as String?,
        date: data['date'] as String?,
      );

  static CtrNoteSchemaStruct? maybeFromMap(dynamic data) => data is Map
      ? CtrNoteSchemaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'people_id': _peopleId,
        'people_name': _peopleName,
        'text': _text,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'people_id': serializeParam(
          _peopleId,
          ParamType.String,
        ),
        'people_name': serializeParam(
          _peopleName,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
      }.withoutNulls;

  static CtrNoteSchemaStruct fromSerializableMap(Map<String, dynamic> data) =>
      CtrNoteSchemaStruct(
        peopleId: deserializeParam(
          data['people_id'],
          ParamType.String,
          false,
        ),
        peopleName: deserializeParam(
          data['people_name'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CtrNoteSchemaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CtrNoteSchemaStruct &&
        peopleId == other.peopleId &&
        peopleName == other.peopleName &&
        text == other.text &&
        date == other.date;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([peopleId, peopleName, text, date]);
}

CtrNoteSchemaStruct createCtrNoteSchemaStruct({
  String? peopleId,
  String? peopleName,
  String? text,
  String? date,
}) =>
    CtrNoteSchemaStruct(
      peopleId: peopleId,
      peopleName: peopleName,
      text: text,
      date: date,
    );
