// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CtrLogisticPriceSchemaStruct extends BaseStruct {
  CtrLogisticPriceSchemaStruct({
    String? logisticPaymentResponsability,
    String? logisticCoordinationResponsability,
    CtrLgScheFreightCostSchemaStruct? freightCost,
    String? freightCostMeasurementUnit,
    String? paymentCurrency,
  })  : _logisticPaymentResponsability = logisticPaymentResponsability,
        _logisticCoordinationResponsability =
            logisticCoordinationResponsability,
        _freightCost = freightCost,
        _freightCostMeasurementUnit = freightCostMeasurementUnit,
        _paymentCurrency = paymentCurrency;

  // "logistic_payment_responsability" field.
  String? _logisticPaymentResponsability;
  String get logisticPaymentResponsability =>
      _logisticPaymentResponsability ?? 'seller';
  set logisticPaymentResponsability(String? val) =>
      _logisticPaymentResponsability = val;

  bool hasLogisticPaymentResponsability() =>
      _logisticPaymentResponsability != null;

  // "logistic_coordination_responsability" field.
  String? _logisticCoordinationResponsability;
  String get logisticCoordinationResponsability =>
      _logisticCoordinationResponsability ?? 'seller';
  set logisticCoordinationResponsability(String? val) =>
      _logisticCoordinationResponsability = val;

  bool hasLogisticCoordinationResponsability() =>
      _logisticCoordinationResponsability != null;

  // "freight_cost" field.
  CtrLgScheFreightCostSchemaStruct? _freightCost;
  CtrLgScheFreightCostSchemaStruct get freightCost =>
      _freightCost ?? CtrLgScheFreightCostSchemaStruct();
  set freightCost(CtrLgScheFreightCostSchemaStruct? val) => _freightCost = val;

  void updateFreightCost(Function(CtrLgScheFreightCostSchemaStruct) updateFn) {
    updateFn(_freightCost ??= CtrLgScheFreightCostSchemaStruct());
  }

  bool hasFreightCost() => _freightCost != null;

  // "freight_cost_measurement_unit" field.
  String? _freightCostMeasurementUnit;
  String get freightCostMeasurementUnit => _freightCostMeasurementUnit ?? '';
  set freightCostMeasurementUnit(String? val) =>
      _freightCostMeasurementUnit = val;

  bool hasFreightCostMeasurementUnit() => _freightCostMeasurementUnit != null;

  // "payment_currency" field.
  String? _paymentCurrency;
  String get paymentCurrency => _paymentCurrency ?? 'usd';
  set paymentCurrency(String? val) => _paymentCurrency = val;

  bool hasPaymentCurrency() => _paymentCurrency != null;

  static CtrLogisticPriceSchemaStruct fromMap(Map<String, dynamic> data) =>
      CtrLogisticPriceSchemaStruct(
        logisticPaymentResponsability:
            data['logistic_payment_responsability'] as String?,
        logisticCoordinationResponsability:
            data['logistic_coordination_responsability'] as String?,
        freightCost:
            CtrLgScheFreightCostSchemaStruct.maybeFromMap(data['freight_cost']),
        freightCostMeasurementUnit:
            data['freight_cost_measurement_unit'] as String?,
        paymentCurrency: data['payment_currency'] as String?,
      );

  static CtrLogisticPriceSchemaStruct? maybeFromMap(dynamic data) => data is Map
      ? CtrLogisticPriceSchemaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'logistic_payment_responsability': _logisticPaymentResponsability,
        'logistic_coordination_responsability':
            _logisticCoordinationResponsability,
        'freight_cost': _freightCost?.toMap(),
        'freight_cost_measurement_unit': _freightCostMeasurementUnit,
        'payment_currency': _paymentCurrency,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'logistic_payment_responsability': serializeParam(
          _logisticPaymentResponsability,
          ParamType.String,
        ),
        'logistic_coordination_responsability': serializeParam(
          _logisticCoordinationResponsability,
          ParamType.String,
        ),
        'freight_cost': serializeParam(
          _freightCost,
          ParamType.DataStruct,
        ),
        'freight_cost_measurement_unit': serializeParam(
          _freightCostMeasurementUnit,
          ParamType.String,
        ),
        'payment_currency': serializeParam(
          _paymentCurrency,
          ParamType.String,
        ),
      }.withoutNulls;

  static CtrLogisticPriceSchemaStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CtrLogisticPriceSchemaStruct(
        logisticPaymentResponsability: deserializeParam(
          data['logistic_payment_responsability'],
          ParamType.String,
          false,
        ),
        logisticCoordinationResponsability: deserializeParam(
          data['logistic_coordination_responsability'],
          ParamType.String,
          false,
        ),
        freightCost: deserializeStructParam(
          data['freight_cost'],
          ParamType.DataStruct,
          false,
          structBuilder: CtrLgScheFreightCostSchemaStruct.fromSerializableMap,
        ),
        freightCostMeasurementUnit: deserializeParam(
          data['freight_cost_measurement_unit'],
          ParamType.String,
          false,
        ),
        paymentCurrency: deserializeParam(
          data['payment_currency'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CtrLogisticPriceSchemaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CtrLogisticPriceSchemaStruct &&
        logisticPaymentResponsability == other.logisticPaymentResponsability &&
        logisticCoordinationResponsability ==
            other.logisticCoordinationResponsability &&
        freightCost == other.freightCost &&
        freightCostMeasurementUnit == other.freightCostMeasurementUnit &&
        paymentCurrency == other.paymentCurrency;
  }

  @override
  int get hashCode => const ListEquality().hash([
        logisticPaymentResponsability,
        logisticCoordinationResponsability,
        freightCost,
        freightCostMeasurementUnit,
        paymentCurrency
      ]);
}

CtrLogisticPriceSchemaStruct createCtrLogisticPriceSchemaStruct({
  String? logisticPaymentResponsability,
  String? logisticCoordinationResponsability,
  CtrLgScheFreightCostSchemaStruct? freightCost,
  String? freightCostMeasurementUnit,
  String? paymentCurrency,
}) =>
    CtrLogisticPriceSchemaStruct(
      logisticPaymentResponsability: logisticPaymentResponsability,
      logisticCoordinationResponsability: logisticCoordinationResponsability,
      freightCost: freightCost ?? CtrLgScheFreightCostSchemaStruct(),
      freightCostMeasurementUnit: freightCostMeasurementUnit,
      paymentCurrency: paymentCurrency,
    );
