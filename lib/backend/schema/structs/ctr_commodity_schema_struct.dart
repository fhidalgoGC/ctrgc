// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CtrCommoditySchemaStruct extends BaseStruct {
  CtrCommoditySchemaStruct({
    String? commodityId,
    String? name,
  })  : _commodityId = commodityId,
        _name = name;

  // "commodity_id" field.
  String? _commodityId;
  String get commodityId => _commodityId ?? '';
  set commodityId(String? val) => _commodityId = val;

  bool hasCommodityId() => _commodityId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static CtrCommoditySchemaStruct fromMap(Map<String, dynamic> data) =>
      CtrCommoditySchemaStruct(
        commodityId: data['commodity_id'] as String?,
        name: data['name'] as String?,
      );

  static CtrCommoditySchemaStruct? maybeFromMap(dynamic data) => data is Map
      ? CtrCommoditySchemaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'commodity_id': _commodityId,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'commodity_id': serializeParam(
          _commodityId,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static CtrCommoditySchemaStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CtrCommoditySchemaStruct(
        commodityId: deserializeParam(
          data['commodity_id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CtrCommoditySchemaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CtrCommoditySchemaStruct &&
        commodityId == other.commodityId &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([commodityId, name]);
}

CtrCommoditySchemaStruct createCtrCommoditySchemaStruct({
  String? commodityId,
  String? name,
}) =>
    CtrCommoditySchemaStruct(
      commodityId: commodityId,
      name: name,
    );
