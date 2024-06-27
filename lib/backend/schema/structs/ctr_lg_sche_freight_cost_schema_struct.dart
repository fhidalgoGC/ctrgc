// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CtrLgScheFreightCostSchemaStruct extends BaseStruct {
  CtrLgScheFreightCostSchemaStruct({
    String? type,
    double? min,
    double? max,
  })  : _type = type,
        _min = min,
        _max = max;

  // "type" field.
  String? _type;
  String get type => _type ?? 'fixed';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "min" field.
  double? _min;
  double get min => _min ?? 0.0;
  set min(double? val) => _min = val;

  void incrementMin(double amount) => min = min + amount;

  bool hasMin() => _min != null;

  // "max" field.
  double? _max;
  double get max => _max ?? 0.0;
  set max(double? val) => _max = val;

  void incrementMax(double amount) => max = max + amount;

  bool hasMax() => _max != null;

  static CtrLgScheFreightCostSchemaStruct fromMap(Map<String, dynamic> data) =>
      CtrLgScheFreightCostSchemaStruct(
        type: data['type'] as String?,
        min: castToType<double>(data['min']),
        max: castToType<double>(data['max']),
      );

  static CtrLgScheFreightCostSchemaStruct? maybeFromMap(dynamic data) => data
          is Map
      ? CtrLgScheFreightCostSchemaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'min': _min,
        'max': _max,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'min': serializeParam(
          _min,
          ParamType.double,
        ),
        'max': serializeParam(
          _max,
          ParamType.double,
        ),
      }.withoutNulls;

  static CtrLgScheFreightCostSchemaStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CtrLgScheFreightCostSchemaStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        min: deserializeParam(
          data['min'],
          ParamType.double,
          false,
        ),
        max: deserializeParam(
          data['max'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'CtrLgScheFreightCostSchemaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CtrLgScheFreightCostSchemaStruct &&
        type == other.type &&
        min == other.min &&
        max == other.max;
  }

  @override
  int get hashCode => const ListEquality().hash([type, min, max]);
}

CtrLgScheFreightCostSchemaStruct createCtrLgScheFreightCostSchemaStruct({
  String? type,
  double? min,
  double? max,
}) =>
    CtrLgScheFreightCostSchemaStruct(
      type: type,
      min: min,
      max: max,
    );
