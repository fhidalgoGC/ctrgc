// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreateSubContractSchemaStruct extends BaseStruct {
  CreateSubContractSchemaStruct({
    String? contractId,
    String? contractFolio,
    int? quantity,
    String? measurementUnit,
    double? totalPrice,
    String? createdById,
    String? createdByName,
    List<CtrPriceScheduleSchemaStruct>? priceSchedule,
  })  : _contractId = contractId,
        _contractFolio = contractFolio,
        _quantity = quantity,
        _measurementUnit = measurementUnit,
        _totalPrice = totalPrice,
        _createdById = createdById,
        _createdByName = createdByName,
        _priceSchedule = priceSchedule;

  // "contract_id" field.
  String? _contractId;
  String get contractId => _contractId ?? '';
  set contractId(String? val) => _contractId = val;

  bool hasContractId() => _contractId != null;

  // "contract_folio" field.
  String? _contractFolio;
  String get contractFolio => _contractFolio ?? '';
  set contractFolio(String? val) => _contractFolio = val;

  bool hasContractFolio() => _contractFolio != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "measurement_unit" field.
  String? _measurementUnit;
  String get measurementUnit => _measurementUnit ?? '';
  set measurementUnit(String? val) => _measurementUnit = val;

  bool hasMeasurementUnit() => _measurementUnit != null;

  // "total_price" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  set totalPrice(double? val) => _totalPrice = val;

  void incrementTotalPrice(double amount) => totalPrice = totalPrice + amount;

  bool hasTotalPrice() => _totalPrice != null;

  // "created_by_id" field.
  String? _createdById;
  String get createdById => _createdById ?? '';
  set createdById(String? val) => _createdById = val;

  bool hasCreatedById() => _createdById != null;

  // "created_by_name" field.
  String? _createdByName;
  String get createdByName => _createdByName ?? '';
  set createdByName(String? val) => _createdByName = val;

  bool hasCreatedByName() => _createdByName != null;

  // "price_schedule" field.
  List<CtrPriceScheduleSchemaStruct>? _priceSchedule;
  List<CtrPriceScheduleSchemaStruct> get priceSchedule =>
      _priceSchedule ?? const [];
  set priceSchedule(List<CtrPriceScheduleSchemaStruct>? val) =>
      _priceSchedule = val;

  void updatePriceSchedule(
      Function(List<CtrPriceScheduleSchemaStruct>) updateFn) {
    updateFn(_priceSchedule ??= []);
  }

  bool hasPriceSchedule() => _priceSchedule != null;

  static CreateSubContractSchemaStruct fromMap(Map<String, dynamic> data) =>
      CreateSubContractSchemaStruct(
        contractId: data['contract_id'] as String?,
        contractFolio: data['contract_folio'] as String?,
        quantity: castToType<int>(data['quantity']),
        measurementUnit: data['measurement_unit'] as String?,
        totalPrice: castToType<double>(data['total_price']),
        createdById: data['created_by_id'] as String?,
        createdByName: data['created_by_name'] as String?,
        priceSchedule: getStructList(
          data['price_schedule'],
          CtrPriceScheduleSchemaStruct.fromMap,
        ),
      );

  static CreateSubContractSchemaStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? CreateSubContractSchemaStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'contract_id': _contractId,
        'contract_folio': _contractFolio,
        'quantity': _quantity,
        'measurement_unit': _measurementUnit,
        'total_price': _totalPrice,
        'created_by_id': _createdById,
        'created_by_name': _createdByName,
        'price_schedule': _priceSchedule?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'contract_id': serializeParam(
          _contractId,
          ParamType.String,
        ),
        'contract_folio': serializeParam(
          _contractFolio,
          ParamType.String,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'measurement_unit': serializeParam(
          _measurementUnit,
          ParamType.String,
        ),
        'total_price': serializeParam(
          _totalPrice,
          ParamType.double,
        ),
        'created_by_id': serializeParam(
          _createdById,
          ParamType.String,
        ),
        'created_by_name': serializeParam(
          _createdByName,
          ParamType.String,
        ),
        'price_schedule': serializeParam(
          _priceSchedule,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static CreateSubContractSchemaStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CreateSubContractSchemaStruct(
        contractId: deserializeParam(
          data['contract_id'],
          ParamType.String,
          false,
        ),
        contractFolio: deserializeParam(
          data['contract_folio'],
          ParamType.String,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        measurementUnit: deserializeParam(
          data['measurement_unit'],
          ParamType.String,
          false,
        ),
        totalPrice: deserializeParam(
          data['total_price'],
          ParamType.double,
          false,
        ),
        createdById: deserializeParam(
          data['created_by_id'],
          ParamType.String,
          false,
        ),
        createdByName: deserializeParam(
          data['created_by_name'],
          ParamType.String,
          false,
        ),
        priceSchedule: deserializeStructParam<CtrPriceScheduleSchemaStruct>(
          data['price_schedule'],
          ParamType.DataStruct,
          true,
          structBuilder: CtrPriceScheduleSchemaStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CreateSubContractSchemaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CreateSubContractSchemaStruct &&
        contractId == other.contractId &&
        contractFolio == other.contractFolio &&
        quantity == other.quantity &&
        measurementUnit == other.measurementUnit &&
        totalPrice == other.totalPrice &&
        createdById == other.createdById &&
        createdByName == other.createdByName &&
        listEquality.equals(priceSchedule, other.priceSchedule);
  }

  @override
  int get hashCode => const ListEquality().hash([
        contractId,
        contractFolio,
        quantity,
        measurementUnit,
        totalPrice,
        createdById,
        createdByName,
        priceSchedule
      ]);
}

CreateSubContractSchemaStruct createCreateSubContractSchemaStruct({
  String? contractId,
  String? contractFolio,
  int? quantity,
  String? measurementUnit,
  double? totalPrice,
  String? createdById,
  String? createdByName,
}) =>
    CreateSubContractSchemaStruct(
      contractId: contractId,
      contractFolio: contractFolio,
      quantity: quantity,
      measurementUnit: measurementUnit,
      totalPrice: totalPrice,
      createdById: createdById,
      createdByName: createdByName,
    );
