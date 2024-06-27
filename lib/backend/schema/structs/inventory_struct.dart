// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InventoryStruct extends BaseStruct {
  InventoryStruct({
    double? total,
    double? open,
    double? fixed,
    double? unsettled,
    double? settled,
  })  : _total = total,
        _open = open,
        _fixed = fixed,
        _unsettled = unsettled,
        _settled = settled;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;

  void incrementTotal(double amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "open" field.
  double? _open;
  double get open => _open ?? 0.0;
  set open(double? val) => _open = val;

  void incrementOpen(double amount) => open = open + amount;

  bool hasOpen() => _open != null;

  // "fixed" field.
  double? _fixed;
  double get fixed => _fixed ?? 0.0;
  set fixed(double? val) => _fixed = val;

  void incrementFixed(double amount) => fixed = fixed + amount;

  bool hasFixed() => _fixed != null;

  // "unsettled" field.
  double? _unsettled;
  double get unsettled => _unsettled ?? 0.0;
  set unsettled(double? val) => _unsettled = val;

  void incrementUnsettled(double amount) => unsettled = unsettled + amount;

  bool hasUnsettled() => _unsettled != null;

  // "settled" field.
  double? _settled;
  double get settled => _settled ?? 0.0;
  set settled(double? val) => _settled = val;

  void incrementSettled(double amount) => settled = settled + amount;

  bool hasSettled() => _settled != null;

  static InventoryStruct fromMap(Map<String, dynamic> data) => InventoryStruct(
        total: castToType<double>(data['total']),
        open: castToType<double>(data['open']),
        fixed: castToType<double>(data['fixed']),
        unsettled: castToType<double>(data['unsettled']),
        settled: castToType<double>(data['settled']),
      );

  static InventoryStruct? maybeFromMap(dynamic data) => data is Map
      ? InventoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'total': _total,
        'open': _open,
        'fixed': _fixed,
        'unsettled': _unsettled,
        'settled': _settled,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
        'open': serializeParam(
          _open,
          ParamType.double,
        ),
        'fixed': serializeParam(
          _fixed,
          ParamType.double,
        ),
        'unsettled': serializeParam(
          _unsettled,
          ParamType.double,
        ),
        'settled': serializeParam(
          _settled,
          ParamType.double,
        ),
      }.withoutNulls;

  static InventoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      InventoryStruct(
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
        open: deserializeParam(
          data['open'],
          ParamType.double,
          false,
        ),
        fixed: deserializeParam(
          data['fixed'],
          ParamType.double,
          false,
        ),
        unsettled: deserializeParam(
          data['unsettled'],
          ParamType.double,
          false,
        ),
        settled: deserializeParam(
          data['settled'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'InventoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InventoryStruct &&
        total == other.total &&
        open == other.open &&
        fixed == other.fixed &&
        unsettled == other.unsettled &&
        settled == other.settled;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([total, open, fixed, unsettled, settled]);
}

InventoryStruct createInventoryStruct({
  double? total,
  double? open,
  double? fixed,
  double? unsettled,
  double? settled,
}) =>
    InventoryStruct(
      total: total,
      open: open,
      fixed: fixed,
      unsettled: unsettled,
      settled: settled,
    );
