// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContractSalePurchaseSchemaStruct extends BaseStruct {
  ContractSalePurchaseSchemaStruct({
    String? type,
    String? subType,
    String? contractDate,
    CtrCommoditySchemaStruct? commodity,
    int? grade,
    List<CtrParticipantSchemaStruct>? participants,
    List<CtrPriceScheduleSchemaStruct>? priceSchedule,
    List<CtrLogisticPriceSchemaStruct>? logisticSchedule,
    int? quantity,
    String? measurementUnit,
    String? shippingStartDate,
    String? shippingEndDate,
    int? applicationPriority,
    String? delivered,
    String? transport,
    String? weights,
    String? inspections,
    String? proteins,
    List<CtrRemarkScheduleStruct>? remarks,
    List<CtrNoteSchemaStruct>? notes,
    String? registeredById,
    String? registeredByName,
  })  : _type = type,
        _subType = subType,
        _contractDate = contractDate,
        _commodity = commodity,
        _grade = grade,
        _participants = participants,
        _priceSchedule = priceSchedule,
        _logisticSchedule = logisticSchedule,
        _quantity = quantity,
        _measurementUnit = measurementUnit,
        _shippingStartDate = shippingStartDate,
        _shippingEndDate = shippingEndDate,
        _applicationPriority = applicationPriority,
        _delivered = delivered,
        _transport = transport,
        _weights = weights,
        _inspections = inspections,
        _proteins = proteins,
        _remarks = remarks,
        _notes = notes,
        _registeredById = registeredById,
        _registeredByName = registeredByName;

  // "type" field.
  String? _type;
  String get type => _type ?? 'sale';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "sub_type" field.
  String? _subType;
  String get subType => _subType ?? 'direct';
  set subType(String? val) => _subType = val;

  bool hasSubType() => _subType != null;

  // "contract_date" field.
  String? _contractDate;
  String get contractDate => _contractDate ?? '';
  set contractDate(String? val) => _contractDate = val;

  bool hasContractDate() => _contractDate != null;

  // "commodity" field.
  CtrCommoditySchemaStruct? _commodity;
  CtrCommoditySchemaStruct get commodity =>
      _commodity ?? CtrCommoditySchemaStruct();
  set commodity(CtrCommoditySchemaStruct? val) => _commodity = val;

  void updateCommodity(Function(CtrCommoditySchemaStruct) updateFn) {
    updateFn(_commodity ??= CtrCommoditySchemaStruct());
  }

  bool hasCommodity() => _commodity != null;

  // "grade" field.
  int? _grade;
  int get grade => _grade ?? 0;
  set grade(int? val) => _grade = val;

  void incrementGrade(int amount) => grade = grade + amount;

  bool hasGrade() => _grade != null;

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

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "measurement_unit" field.
  String? _measurementUnit;
  String get measurementUnit => _measurementUnit ?? 'bushel';
  set measurementUnit(String? val) => _measurementUnit = val;

  bool hasMeasurementUnit() => _measurementUnit != null;

  // "shipping_start_date" field.
  String? _shippingStartDate;
  String get shippingStartDate => _shippingStartDate ?? '';
  set shippingStartDate(String? val) => _shippingStartDate = val;

  bool hasShippingStartDate() => _shippingStartDate != null;

  // "shipping_end_date" field.
  String? _shippingEndDate;
  String get shippingEndDate => _shippingEndDate ?? '';
  set shippingEndDate(String? val) => _shippingEndDate = val;

  bool hasShippingEndDate() => _shippingEndDate != null;

  // "application_priority" field.
  int? _applicationPriority;
  int get applicationPriority => _applicationPriority ?? 1;
  set applicationPriority(int? val) => _applicationPriority = val;

  void incrementApplicationPriority(int amount) =>
      applicationPriority = applicationPriority + amount;

  bool hasApplicationPriority() => _applicationPriority != null;

  // "delivered" field.
  String? _delivered;
  String get delivered => _delivered ?? 'At port';
  set delivered(String? val) => _delivered = val;

  bool hasDelivered() => _delivered != null;

  // "transport" field.
  String? _transport;
  String get transport => _transport ?? 'trucks';
  set transport(String? val) => _transport = val;

  bool hasTransport() => _transport != null;

  // "weights" field.
  String? _weights;
  String get weights => _weights ?? 'submitCc';
  set weights(String? val) => _weights = val;

  bool hasWeights() => _weights != null;

  // "inspections" field.
  String? _inspections;
  String get inspections => _inspections ?? 'submitCc';
  set inspections(String? val) => _inspections = val;

  bool hasInspections() => _inspections != null;

  // "proteins" field.
  String? _proteins;
  String get proteins => _proteins ?? 'submitCc';
  set proteins(String? val) => _proteins = val;

  bool hasProteins() => _proteins != null;

  // "remarks" field.
  List<CtrRemarkScheduleStruct>? _remarks;
  List<CtrRemarkScheduleStruct> get remarks => _remarks ?? const [];
  set remarks(List<CtrRemarkScheduleStruct>? val) => _remarks = val;

  void updateRemarks(Function(List<CtrRemarkScheduleStruct>) updateFn) {
    updateFn(_remarks ??= []);
  }

  bool hasRemarks() => _remarks != null;

  // "notes" field.
  List<CtrNoteSchemaStruct>? _notes;
  List<CtrNoteSchemaStruct> get notes => _notes ?? const [];
  set notes(List<CtrNoteSchemaStruct>? val) => _notes = val;

  void updateNotes(Function(List<CtrNoteSchemaStruct>) updateFn) {
    updateFn(_notes ??= []);
  }

  bool hasNotes() => _notes != null;

  // "registered_by_id" field.
  String? _registeredById;
  String get registeredById => _registeredById ?? '';
  set registeredById(String? val) => _registeredById = val;

  bool hasRegisteredById() => _registeredById != null;

  // "registered_by_name" field.
  String? _registeredByName;
  String get registeredByName => _registeredByName ?? '';
  set registeredByName(String? val) => _registeredByName = val;

  bool hasRegisteredByName() => _registeredByName != null;

  static ContractSalePurchaseSchemaStruct fromMap(Map<String, dynamic> data) =>
      ContractSalePurchaseSchemaStruct(
        type: data['type'] as String?,
        subType: data['sub_type'] as String?,
        contractDate: data['contract_date'] as String?,
        commodity: CtrCommoditySchemaStruct.maybeFromMap(data['commodity']),
        grade: castToType<int>(data['grade']),
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
        quantity: castToType<int>(data['quantity']),
        measurementUnit: data['measurement_unit'] as String?,
        shippingStartDate: data['shipping_start_date'] as String?,
        shippingEndDate: data['shipping_end_date'] as String?,
        applicationPriority: castToType<int>(data['application_priority']),
        delivered: data['delivered'] as String?,
        transport: data['transport'] as String?,
        weights: data['weights'] as String?,
        inspections: data['inspections'] as String?,
        proteins: data['proteins'] as String?,
        remarks: getStructList(
          data['remarks'],
          CtrRemarkScheduleStruct.fromMap,
        ),
        notes: getStructList(
          data['notes'],
          CtrNoteSchemaStruct.fromMap,
        ),
        registeredById: data['registered_by_id'] as String?,
        registeredByName: data['registered_by_name'] as String?,
      );

  static ContractSalePurchaseSchemaStruct? maybeFromMap(dynamic data) => data
          is Map
      ? ContractSalePurchaseSchemaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'sub_type': _subType,
        'contract_date': _contractDate,
        'commodity': _commodity?.toMap(),
        'grade': _grade,
        'participants': _participants?.map((e) => e.toMap()).toList(),
        'price_schedule': _priceSchedule?.map((e) => e.toMap()).toList(),
        'logistic_schedule': _logisticSchedule?.map((e) => e.toMap()).toList(),
        'quantity': _quantity,
        'measurement_unit': _measurementUnit,
        'shipping_start_date': _shippingStartDate,
        'shipping_end_date': _shippingEndDate,
        'application_priority': _applicationPriority,
        'delivered': _delivered,
        'transport': _transport,
        'weights': _weights,
        'inspections': _inspections,
        'proteins': _proteins,
        'remarks': _remarks?.map((e) => e.toMap()).toList(),
        'notes': _notes?.map((e) => e.toMap()).toList(),
        'registered_by_id': _registeredById,
        'registered_by_name': _registeredByName,
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
        'contract_date': serializeParam(
          _contractDate,
          ParamType.String,
        ),
        'commodity': serializeParam(
          _commodity,
          ParamType.DataStruct,
        ),
        'grade': serializeParam(
          _grade,
          ParamType.int,
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
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'measurement_unit': serializeParam(
          _measurementUnit,
          ParamType.String,
        ),
        'shipping_start_date': serializeParam(
          _shippingStartDate,
          ParamType.String,
        ),
        'shipping_end_date': serializeParam(
          _shippingEndDate,
          ParamType.String,
        ),
        'application_priority': serializeParam(
          _applicationPriority,
          ParamType.int,
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
        'proteins': serializeParam(
          _proteins,
          ParamType.String,
        ),
        'remarks': serializeParam(
          _remarks,
          ParamType.DataStruct,
          isList: true,
        ),
        'notes': serializeParam(
          _notes,
          ParamType.DataStruct,
          isList: true,
        ),
        'registered_by_id': serializeParam(
          _registeredById,
          ParamType.String,
        ),
        'registered_by_name': serializeParam(
          _registeredByName,
          ParamType.String,
        ),
      }.withoutNulls;

  static ContractSalePurchaseSchemaStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ContractSalePurchaseSchemaStruct(
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
        contractDate: deserializeParam(
          data['contract_date'],
          ParamType.String,
          false,
        ),
        commodity: deserializeStructParam(
          data['commodity'],
          ParamType.DataStruct,
          false,
          structBuilder: CtrCommoditySchemaStruct.fromSerializableMap,
        ),
        grade: deserializeParam(
          data['grade'],
          ParamType.int,
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
        shippingStartDate: deserializeParam(
          data['shipping_start_date'],
          ParamType.String,
          false,
        ),
        shippingEndDate: deserializeParam(
          data['shipping_end_date'],
          ParamType.String,
          false,
        ),
        applicationPriority: deserializeParam(
          data['application_priority'],
          ParamType.int,
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
        proteins: deserializeParam(
          data['proteins'],
          ParamType.String,
          false,
        ),
        remarks: deserializeStructParam<CtrRemarkScheduleStruct>(
          data['remarks'],
          ParamType.DataStruct,
          true,
          structBuilder: CtrRemarkScheduleStruct.fromSerializableMap,
        ),
        notes: deserializeStructParam<CtrNoteSchemaStruct>(
          data['notes'],
          ParamType.DataStruct,
          true,
          structBuilder: CtrNoteSchemaStruct.fromSerializableMap,
        ),
        registeredById: deserializeParam(
          data['registered_by_id'],
          ParamType.String,
          false,
        ),
        registeredByName: deserializeParam(
          data['registered_by_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ContractSalePurchaseSchemaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ContractSalePurchaseSchemaStruct &&
        type == other.type &&
        subType == other.subType &&
        contractDate == other.contractDate &&
        commodity == other.commodity &&
        grade == other.grade &&
        listEquality.equals(participants, other.participants) &&
        listEquality.equals(priceSchedule, other.priceSchedule) &&
        listEquality.equals(logisticSchedule, other.logisticSchedule) &&
        quantity == other.quantity &&
        measurementUnit == other.measurementUnit &&
        shippingStartDate == other.shippingStartDate &&
        shippingEndDate == other.shippingEndDate &&
        applicationPriority == other.applicationPriority &&
        delivered == other.delivered &&
        transport == other.transport &&
        weights == other.weights &&
        inspections == other.inspections &&
        proteins == other.proteins &&
        listEquality.equals(remarks, other.remarks) &&
        listEquality.equals(notes, other.notes) &&
        registeredById == other.registeredById &&
        registeredByName == other.registeredByName;
  }

  @override
  int get hashCode => const ListEquality().hash([
        type,
        subType,
        contractDate,
        commodity,
        grade,
        participants,
        priceSchedule,
        logisticSchedule,
        quantity,
        measurementUnit,
        shippingStartDate,
        shippingEndDate,
        applicationPriority,
        delivered,
        transport,
        weights,
        inspections,
        proteins,
        remarks,
        notes,
        registeredById,
        registeredByName
      ]);
}

ContractSalePurchaseSchemaStruct createContractSalePurchaseSchemaStruct({
  String? type,
  String? subType,
  String? contractDate,
  CtrCommoditySchemaStruct? commodity,
  int? grade,
  int? quantity,
  String? measurementUnit,
  String? shippingStartDate,
  String? shippingEndDate,
  int? applicationPriority,
  String? delivered,
  String? transport,
  String? weights,
  String? inspections,
  String? proteins,
  String? registeredById,
  String? registeredByName,
}) =>
    ContractSalePurchaseSchemaStruct(
      type: type,
      subType: subType,
      contractDate: contractDate,
      commodity: commodity ?? CtrCommoditySchemaStruct(),
      grade: grade,
      quantity: quantity,
      measurementUnit: measurementUnit,
      shippingStartDate: shippingStartDate,
      shippingEndDate: shippingEndDate,
      applicationPriority: applicationPriority,
      delivered: delivered,
      transport: transport,
      weights: weights,
      inspections: inspections,
      proteins: proteins,
      registeredById: registeredById,
      registeredByName: registeredByName,
    );
