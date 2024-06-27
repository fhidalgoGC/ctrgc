// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommoditiesStruct extends BaseStruct {
  CommoditiesStruct({
    String? id,
    String? name,
    String? partitionKey,
  })  : _id = id,
        _name = name,
        _partitionKey = partitionKey;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "partitionKey" field.
  String? _partitionKey;
  String get partitionKey => _partitionKey ?? '';
  set partitionKey(String? val) => _partitionKey = val;

  bool hasPartitionKey() => _partitionKey != null;

  static CommoditiesStruct fromMap(Map<String, dynamic> data) =>
      CommoditiesStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        partitionKey: data['partitionKey'] as String?,
      );

  static CommoditiesStruct? maybeFromMap(dynamic data) => data is Map
      ? CommoditiesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'partitionKey': _partitionKey,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'partitionKey': serializeParam(
          _partitionKey,
          ParamType.String,
        ),
      }.withoutNulls;

  static CommoditiesStruct fromSerializableMap(Map<String, dynamic> data) =>
      CommoditiesStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        partitionKey: deserializeParam(
          data['partitionKey'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CommoditiesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CommoditiesStruct &&
        id == other.id &&
        name == other.name &&
        partitionKey == other.partitionKey;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name, partitionKey]);
}

CommoditiesStruct createCommoditiesStruct({
  String? id,
  String? name,
  String? partitionKey,
}) =>
    CommoditiesStruct(
      id: id,
      name: name,
      partitionKey: partitionKey,
    );
