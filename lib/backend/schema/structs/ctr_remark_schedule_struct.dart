// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CtrRemarkScheduleStruct extends BaseStruct {
  CtrRemarkScheduleStruct({
    String? title,
    List<String>? values,
  })  : _title = title,
        _values = values;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "values" field.
  List<String>? _values;
  List<String> get values => _values ?? const [];
  set values(List<String>? val) => _values = val;

  void updateValues(Function(List<String>) updateFn) {
    updateFn(_values ??= []);
  }

  bool hasValues() => _values != null;

  static CtrRemarkScheduleStruct fromMap(Map<String, dynamic> data) =>
      CtrRemarkScheduleStruct(
        title: data['title'] as String?,
        values: getDataList(data['values']),
      );

  static CtrRemarkScheduleStruct? maybeFromMap(dynamic data) => data is Map
      ? CtrRemarkScheduleStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'values': _values,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'values': serializeParam(
          _values,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static CtrRemarkScheduleStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CtrRemarkScheduleStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        values: deserializeParam<String>(
          data['values'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'CtrRemarkScheduleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CtrRemarkScheduleStruct &&
        title == other.title &&
        listEquality.equals(values, other.values);
  }

  @override
  int get hashCode => const ListEquality().hash([title, values]);
}

CtrRemarkScheduleStruct createCtrRemarkScheduleStruct({
  String? title,
}) =>
    CtrRemarkScheduleStruct(
      title: title,
    );
