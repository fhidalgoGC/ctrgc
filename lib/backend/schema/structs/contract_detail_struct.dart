// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContractDetailStruct extends BaseStruct {
  ContractDetailStruct({
    String? type,
    String? subType,
    String? folio,
    int? grade,
    CtrInventoryStruct? inventory,
    double? quantity,
    String? measurementUnit,
    DateTime? shippingEndDate,
    DateTime? shippingStartDate,
    int? applicationPriority,
    DateTime? shippingStartDateCopy,
    String? delivered,
    String? transport,
    String? weights,
    String? inspections,
    List<CtrParticipantSchemaStruct>? participants,
    List<CtrPriceScheduleSchemaStruct>? priceSchedule,
    List<CtrLogisticPriceSchemaStruct>? logisticSchedule,
    CtrCommoditySchemaStruct? commodity,
  })  : _type = type,
        _subType = subType,
        _folio = folio,
        _grade = grade,
        _inventory = inventory,
        _quantity = quantity,
        _measurementUnit = measurementUnit,
        _shippingEndDate = shippingEndDate,
        _shippingStartDate = shippingStartDate,
        _applicationPriority = applicationPriority,
        _shippingStartDateCopy = shippingStartDateCopy,
        _delivered = delivered,
        _transport = transport,
        _weights = weights,
        _inspections = inspections,
        _participants = participants,
        _priceSchedule = priceSchedule,
        _logisticSchedule = logisticSchedule,
        _commodity = commodity;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "sub_type" field.
  String? _subType;
  String get subType => _subType ?? '';
  set subType(String? val) => _subType = val;

  bool hasSubType() => _subType != null;

  // "folio" field.
  String? _folio;
  String get folio => _folio ?? '';
  set folio(String? val) => _folio = val;

  bool hasFolio() => _folio != null;

  // "grade" field.
  int? _grade;
  int get grade => _grade ?? 0;
  set grade(int? val) => _grade = val;

  void incrementGrade(int amount) => grade = grade + amount;

  bool hasGrade() => _grade != null;

  // "inventory" field.
  CtrInventoryStruct? _inventory;
  CtrInventoryStruct get inventory => _inventory ?? CtrInventoryStruct();
  set inventory(CtrInventoryStruct? val) => _inventory = val;

  void updateInventory(Function(CtrInventoryStruct) updateFn) {
    updateFn(_inventory ??= CtrInventoryStruct());
  }

  bool hasInventory() => _inventory != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  set quantity(double? val) => _quantity = val;

  void incrementQuantity(double amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "measurement_unit" field.
  String? _measurementUnit;
  String get measurementUnit => _measurementUnit ?? '';
  set measurementUnit(String? val) => _measurementUnit = val;

  bool hasMeasurementUnit() => _measurementUnit != null;

  // "shipping_end_date" field.
  DateTime? _shippingEndDate;
  DateTime? get shippingEndDate => _shippingEndDate;
  set shippingEndDate(DateTime? val) => _shippingEndDate = val;

  bool hasShippingEndDate() => _shippingEndDate != null;

  // "shipping_start_date" field.
  DateTime? _shippingStartDate;
  DateTime? get shippingStartDate => _shippingStartDate;
  set shippingStartDate(DateTime? val) => _shippingStartDate = val;

  bool hasShippingStartDate() => _shippingStartDate != null;

  // "application_priority" field.
  int? _applicationPriority;
  int get applicationPriority => _applicationPriority ?? 0;
  set applicationPriority(int? val) => _applicationPriority = val;

  void incrementApplicationPriority(int amount) =>
      applicationPriority = applicationPriority + amount;

  bool hasApplicationPriority() => _applicationPriority != null;

  // "shipping_start_dateCopy" field.
  DateTime? _shippingStartDateCopy;
  DateTime? get shippingStartDateCopy => _shippingStartDateCopy;
  set shippingStartDateCopy(DateTime? val) => _shippingStartDateCopy = val;

  bool hasShippingStartDateCopy() => _shippingStartDateCopy != null;

  // "delivered" field.
  String? _delivered;
  String get delivered => _delivered ?? '';
  set delivered(String? val) => _delivered = val;

  bool hasDelivered() => _delivered != null;

  // "transport" field.
  String? _transport;
  String get transport => _transport ?? '';
  set transport(String? val) => _transport = val;

  bool hasTransport() => _transport != null;

  // "weights" field.
  String? _weights;
  String get weights => _weights ?? '';
  set weights(String? val) => _weights = val;

  bool hasWeights() => _weights != null;

  // "inspections" field.
  String? _inspections;
  String get inspections => _inspections ?? '';
  set inspections(String? val) => _inspections = val;

  bool hasInspections() => _inspections != null;

  // "participants" field.
  List<CtrParticipantSchemaStruct>? _participants;
  List<CtrParticipantSchemaStruct> get participants =>
      _participants ?? const [];
  set participants(List<CtrParticipantSchemaStruct>? val) =>
      _participants = val;

  void updateParticipants(Function(List<CtrParticipantSchemaStruct>) updateFn) {
    updateFn(_participants ??= []);
  }

  bool hasParticipants() => _participants != null;

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

  // "logistic_schedule" field.
  List<CtrLogisticPriceSchemaStruct>? _logisticSchedule;
  List<CtrLogisticPriceSchemaStruct> get logisticSchedule =>
      _logisticSchedule ?? const [];
  set logisticSchedule(List<CtrLogisticPriceSchemaStruct>? val) =>
      _logisticSchedule = val;

  void updateLogisticSchedule(
      Function(List<CtrLogisticPriceSchemaStruct>) updateFn) {
    updateFn(_logisticSchedule ??= []);
  }

  bool hasLogisticSchedule() => _logisticSchedule != null;

  // "commodity" field.
  CtrCommoditySchemaStruct? _commodity;
  CtrCommoditySchemaStruct get commodity =>
      _commodity ?? CtrCommoditySchemaStruct();
  set commodity(CtrCommoditySchemaStruct? val) => _commodity = val;

  void updateCommodity(Function(CtrCommoditySchemaStruct) updateFn) {
    updateFn(_commodity ??= CtrCommoditySchemaStruct());
  }

  bool hasCommodity() => _commodity != null;

  static ContractDetailStruct fromMap(Map<String, dynamic> data) =>
      ContractDetailStruct(
        type: data['type'] as String?,
        subType: data['sub_type'] as String?,
        folio: data['folio'] as String?,
        grade: castToType<int>(data['grade']),
        inventory: CtrInventoryStruct.maybeFromMap(data['inventory']),
        quantity: castToType<double>(data['quantity']),
        measurementUnit: data['measurement_unit'] as String?,
        shippingEndDate: data['shipping_end_date'] as DateTime?,
        shippingStartDate: data['shipping_start_date'] as DateTime?,
        applicationPriority: castToType<int>(data['application_priority']),
        shippingStartDateCopy: data['shipping_start_dateCopy'] as DateTime?,
        delivered: data['delivered'] as String?,
        transport: data['transport'] as String?,
        weights: data['weights'] as String?,
        inspections: data['inspections'] as String?,
        participants: getStructList(
          data['participants'],
          CtrParticipantSchemaStruct.fromMap,
        ),
        priceSchedule: getStructList(
          data['price_schedule'],
          CtrPriceScheduleSchemaStruct.fromMap,
        ),
        logisticSchedule: getStructList(
          data['logistic_schedule'],
          CtrLogisticPriceSchemaStruct.fromMap,
        ),
        commodity: CtrCommoditySchemaStruct.maybeFromMap(data['commodity']),
      );

  static ContractDetailStruct? maybeFromMap(dynamic data) => data is Map
      ? ContractDetailStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'sub_type': _subType,
        'folio': _folio,
        'grade': _grade,
        'inventory': _inventory?.toMap(),
        'quantity': _quantity,
        'measurement_unit': _measurementUnit,
        'shipping_end_date': _shippingEndDate,
        'shipping_start_date': _shippingStartDate,
        'application_priority': _applicationPriority,
        'shipping_start_dateCopy': _shippingStartDateCopy,
        'delivered': _delivered,
        'transport': _transport,
        'weights': _weights,
        'inspections': _inspections,
        'participants': _participants?.map((e) => e.toMap()).toList(),
        'price_schedule': _priceSchedule?.map((e) => e.toMap()).toList(),
        'logistic_schedule': _logisticSchedule?.map((e) => e.toMap()).toList(),
        'commodity': _commodity?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'sub_type': serializeParam(
          _subType,
          ParamType.String,
        ),
        'folio': serializeParam(
          _folio,
          ParamType.String,
        ),
        'grade': serializeParam(
          _grade,
          ParamType.int,
        ),
        'inventory': serializeParam(
          _inventory,
          ParamType.DataStruct,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.double,
        ),
        'measurement_unit': serializeParam(
          _measurementUnit,
          ParamType.String,
        ),
        'shipping_end_date': serializeParam(
          _shippingEndDate,
          ParamType.DateTime,
        ),
        'shipping_start_date': serializeParam(
          _shippingStartDate,
          ParamType.DateTime,
        ),
        'application_priority': serializeParam(
          _applicationPriority,
          ParamType.int,
        ),
        'shipping_start_dateCopy': serializeParam(
          _shippingStartDateCopy,
          ParamType.DateTime,
        ),
        'delivered': serializeParam(
          _delivered,
          ParamType.String,
        ),
        'transport': serializeParam(
          _transport,
          ParamType.String,
        ),
        'weights': serializeParam(
          _weights,
          ParamType.String,
        ),
        'inspections': serializeParam(
          _inspections,
          ParamType.String,
        ),
        'participants': serializeParam(
          _participants,
          ParamType.DataStruct,
          isList: true,
        ),
        'price_schedule': serializeParam(
          _priceSchedule,
          ParamType.DataStruct,
          isList: true,
        ),
        'logistic_schedule': serializeParam(
          _logisticSchedule,
          ParamType.DataStruct,
          isList: true,
        ),
        'commodity': serializeParam(
          _commodity,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ContractDetailStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContractDetailStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        subType: deserializeParam(
          data['sub_type'],
          ParamType.String,
          false,
        ),
        folio: deserializeParam(
          data['folio'],
          ParamType.String,
          false,
        ),
        grade: deserializeParam(
          data['grade'],
          ParamType.int,
          false,
        ),
        inventory: deserializeStructParam(
          data['inventory'],
          ParamType.DataStruct,
          false,
          structBuilder: CtrInventoryStruct.fromSerializableMap,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.double,
          false,
        ),
        measurementUnit: deserializeParam(
          data['measurement_unit'],
          ParamType.String,
          false,
        ),
        shippingEndDate: deserializeParam(
          data['shipping_end_date'],
          ParamType.DateTime,
          false,
        ),
        shippingStartDate: deserializeParam(
          data['shipping_start_date'],
          ParamType.DateTime,
          false,
        ),
        applicationPriority: deserializeParam(
          data['application_priority'],
          ParamType.int,
          false,
        ),
        shippingStartDateCopy: deserializeParam(
          data['shipping_start_dateCopy'],
          ParamType.DateTime,
          false,
        ),
        delivered: deserializeParam(
          data['delivered'],
          ParamType.String,
          false,
        ),
        transport: deserializeParam(
          data['transport'],
          ParamType.String,
          false,
        ),
        weights: deserializeParam(
          data['weights'],
          ParamType.String,
          false,
        ),
        inspections: deserializeParam(
          data['inspections'],
          ParamType.String,
          false,
        ),
        participants: deserializeStructParam<CtrParticipantSchemaStruct>(
          data['participants'],
          ParamType.DataStruct,
          true,
          structBuilder: CtrParticipantSchemaStruct.fromSerializableMap,
        ),
        priceSchedule: deserializeStructParam<CtrPriceScheduleSchemaStruct>(
          data['price_schedule'],
          ParamType.DataStruct,
          true,
          structBuilder: CtrPriceScheduleSchemaStruct.fromSerializableMap,
        ),
        logisticSchedule: deserializeStructParam<CtrLogisticPriceSchemaStruct>(
          data['logistic_schedule'],
          ParamType.DataStruct,
          true,
          structBuilder: CtrLogisticPriceSchemaStruct.fromSerializableMap,
        ),
        commodity: deserializeStructParam(
          data['commodity'],
          ParamType.DataStruct,
          false,
          structBuilder: CtrCommoditySchemaStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ContractDetailStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ContractDetailStruct &&
        type == other.type &&
        subType == other.subType &&
        folio == other.folio &&
        grade == other.grade &&
        inventory == other.inventory &&
        quantity == other.quantity &&
        measurementUnit == other.measurementUnit &&
        shippingEndDate == other.shippingEndDate &&
        shippingStartDate == other.shippingStartDate &&
        applicationPriority == other.applicationPriority &&
        shippingStartDateCopy == other.shippingStartDateCopy &&
        delivered == other.delivered &&
        transport == other.transport &&
        weights == other.weights &&
        inspections == other.inspections &&
        listEquality.equals(participants, other.participants) &&
        listEquality.equals(priceSchedule, other.priceSchedule) &&
        listEquality.equals(logisticSchedule, other.logisticSchedule) &&
        commodity == other.commodity;
  }

  @override
  int get hashCode => const ListEquality().hash([
        type,
        subType,
        folio,
        grade,
        inventory,
        quantity,
        measurementUnit,
        shippingEndDate,
        shippingStartDate,
        applicationPriority,
        shippingStartDateCopy,
        delivered,
        transport,
        weights,
        inspections,
        participants,
        priceSchedule,
        logisticSchedule,
        commodity
      ]);
}

ContractDetailStruct createContractDetailStruct({
  String? type,
  String? subType,
  String? folio,
  int? grade,
  CtrInventoryStruct? inventory,
  double? quantity,
  String? measurementUnit,
  DateTime? shippingEndDate,
  DateTime? shippingStartDate,
  int? applicationPriority,
  DateTime? shippingStartDateCopy,
  String? delivered,
  String? transport,
  String? weights,
  String? inspections,
  CtrCommoditySchemaStruct? commodity,
}) =>
    ContractDetailStruct(
      type: type,
      subType: subType,
      folio: folio,
      grade: grade,
      inventory: inventory ?? CtrInventoryStruct(),
      quantity: quantity,
      measurementUnit: measurementUnit,
      shippingEndDate: shippingEndDate,
      shippingStartDate: shippingStartDate,
      applicationPriority: applicationPriority,
      shippingStartDateCopy: shippingStartDateCopy,
      delivered: delivered,
      transport: transport,
      weights: weights,
      inspections: inspections,
      commodity: commodity ?? CtrCommoditySchemaStruct(),
    );
