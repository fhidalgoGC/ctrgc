// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CtrPriceScheduleSchemaStruct extends BaseStruct {
  CtrPriceScheduleSchemaStruct({
    String? pricingType,
    double? price,
    double? basis,
    double? futurePrice,
    String? basisOperation,
    String? optionMonth,
    int? optionYear,
    String? exchange,
    String? paymentCurrency,
  })  : _pricingType = pricingType,
        _price = price,
        _basis = basis,
        _futurePrice = futurePrice,
        _basisOperation = basisOperation,
        _optionMonth = optionMonth,
        _optionYear = optionYear,
        _exchange = exchange,
        _paymentCurrency = paymentCurrency;

  // "pricing_type" field.
  String? _pricingType;
  String get pricingType => _pricingType ?? 'fixed';
  set pricingType(String? val) => _pricingType = val;

  bool hasPricingType() => _pricingType != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "basis" field.
  double? _basis;
  double get basis => _basis ?? 0.0;
  set basis(double? val) => _basis = val;

  void incrementBasis(double amount) => basis = basis + amount;

  bool hasBasis() => _basis != null;

  // "future_price" field.
  double? _futurePrice;
  double get futurePrice => _futurePrice ?? 0.0;
  set futurePrice(double? val) => _futurePrice = val;

  void incrementFuturePrice(double amount) =>
      futurePrice = futurePrice + amount;

  bool hasFuturePrice() => _futurePrice != null;

  // "basis_operation" field.
  String? _basisOperation;
  String get basisOperation => _basisOperation ?? 'add';
  set basisOperation(String? val) => _basisOperation = val;

  bool hasBasisOperation() => _basisOperation != null;

  // "option_month" field.
  String? _optionMonth;
  String get optionMonth => _optionMonth ?? 'January';
  set optionMonth(String? val) => _optionMonth = val;

  bool hasOptionMonth() => _optionMonth != null;

  // "option_year" field.
  int? _optionYear;
  int get optionYear => _optionYear ?? 2025;
  set optionYear(int? val) => _optionYear = val;

  void incrementOptionYear(int amount) => optionYear = optionYear + amount;

  bool hasOptionYear() => _optionYear != null;

  // "exchange" field.
  String? _exchange;
  String get exchange => _exchange ?? 'Chicago futures trade market';
  set exchange(String? val) => _exchange = val;

  bool hasExchange() => _exchange != null;

  // "payment_currency" field.
  String? _paymentCurrency;
  String get paymentCurrency => _paymentCurrency ?? 'usd';
  set paymentCurrency(String? val) => _paymentCurrency = val;

  bool hasPaymentCurrency() => _paymentCurrency != null;

  static CtrPriceScheduleSchemaStruct fromMap(Map<String, dynamic> data) =>
      CtrPriceScheduleSchemaStruct(
        pricingType: data['pricing_type'] as String?,
        price: castToType<double>(data['price']),
        basis: castToType<double>(data['basis']),
        futurePrice: castToType<double>(data['future_price']),
        basisOperation: data['basis_operation'] as String?,
        optionMonth: data['option_month'] as String?,
        optionYear: castToType<int>(data['option_year']),
        exchange: data['exchange'] as String?,
        paymentCurrency: data['payment_currency'] as String?,
      );

  static CtrPriceScheduleSchemaStruct? maybeFromMap(dynamic data) => data is Map
      ? CtrPriceScheduleSchemaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'pricing_type': _pricingType,
        'price': _price,
        'basis': _basis,
        'future_price': _futurePrice,
        'basis_operation': _basisOperation,
        'option_month': _optionMonth,
        'option_year': _optionYear,
        'exchange': _exchange,
        'payment_currency': _paymentCurrency,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'pricing_type': serializeParam(
          _pricingType,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'basis': serializeParam(
          _basis,
          ParamType.double,
        ),
        'future_price': serializeParam(
          _futurePrice,
          ParamType.double,
        ),
        'basis_operation': serializeParam(
          _basisOperation,
          ParamType.String,
        ),
        'option_month': serializeParam(
          _optionMonth,
          ParamType.String,
        ),
        'option_year': serializeParam(
          _optionYear,
          ParamType.int,
        ),
        'exchange': serializeParam(
          _exchange,
          ParamType.String,
        ),
        'payment_currency': serializeParam(
          _paymentCurrency,
          ParamType.String,
        ),
      }.withoutNulls;

  static CtrPriceScheduleSchemaStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CtrPriceScheduleSchemaStruct(
        pricingType: deserializeParam(
          data['pricing_type'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        basis: deserializeParam(
          data['basis'],
          ParamType.double,
          false,
        ),
        futurePrice: deserializeParam(
          data['future_price'],
          ParamType.double,
          false,
        ),
        basisOperation: deserializeParam(
          data['basis_operation'],
          ParamType.String,
          false,
        ),
        optionMonth: deserializeParam(
          data['option_month'],
          ParamType.String,
          false,
        ),
        optionYear: deserializeParam(
          data['option_year'],
          ParamType.int,
          false,
        ),
        exchange: deserializeParam(
          data['exchange'],
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
  String toString() => 'CtrPriceScheduleSchemaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CtrPriceScheduleSchemaStruct &&
        pricingType == other.pricingType &&
        price == other.price &&
        basis == other.basis &&
        futurePrice == other.futurePrice &&
        basisOperation == other.basisOperation &&
        optionMonth == other.optionMonth &&
        optionYear == other.optionYear &&
        exchange == other.exchange &&
        paymentCurrency == other.paymentCurrency;
  }

  @override
  int get hashCode => const ListEquality().hash([
        pricingType,
        price,
        basis,
        futurePrice,
        basisOperation,
        optionMonth,
        optionYear,
        exchange,
        paymentCurrency
      ]);
}

CtrPriceScheduleSchemaStruct createCtrPriceScheduleSchemaStruct({
  String? pricingType,
  double? price,
  double? basis,
  double? futurePrice,
  String? basisOperation,
  String? optionMonth,
  int? optionYear,
  String? exchange,
  String? paymentCurrency,
}) =>
    CtrPriceScheduleSchemaStruct(
      pricingType: pricingType,
      price: price,
      basis: basis,
      futurePrice: futurePrice,
      basisOperation: basisOperation,
      optionMonth: optionMonth,
      optionYear: optionYear,
      exchange: exchange,
      paymentCurrency: paymentCurrency,
    );
