// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContractsStruct extends BaseStruct {
  ContractsStruct({
    String? id,
    String? folio,
    String? type,
    double? quantity,
    double? price,
    double? basis,
    String? customer,
    String? commodityName,
    String? date,
    String? priceType,
    String? measurementUnit,
    String? sellerName,
    String? buyerName,
    String? shippingStartDate,
    String? shippingEndDate,
    String? commodityId,
  })  : _id = id,
        _folio = folio,
        _type = type,
        _quantity = quantity,
        _price = price,
        _basis = basis,
        _customer = customer,
        _commodityName = commodityName,
        _date = date,
        _priceType = priceType,
        _measurementUnit = measurementUnit,
        _sellerName = sellerName,
        _buyerName = buyerName,
        _shippingStartDate = shippingStartDate,
        _shippingEndDate = shippingEndDate,
        _commodityId = commodityId;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "folio" field.
  String? _folio;
  String get folio => _folio ?? '';
  set folio(String? val) => _folio = val;

  bool hasFolio() => _folio != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  set quantity(double? val) => _quantity = val;

  void incrementQuantity(double amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

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

  // "customer" field.
  String? _customer;
  String get customer => _customer ?? '';
  set customer(String? val) => _customer = val;

  bool hasCustomer() => _customer != null;

  // "commodityName" field.
  String? _commodityName;
  String get commodityName => _commodityName ?? '';
  set commodityName(String? val) => _commodityName = val;

  bool hasCommodityName() => _commodityName != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "priceType" field.
  String? _priceType;
  String get priceType => _priceType ?? '';
  set priceType(String? val) => _priceType = val;

  bool hasPriceType() => _priceType != null;

  // "measurementUnit" field.
  String? _measurementUnit;
  String get measurementUnit => _measurementUnit ?? '';
  set measurementUnit(String? val) => _measurementUnit = val;

  bool hasMeasurementUnit() => _measurementUnit != null;

  // "sellerName" field.
  String? _sellerName;
  String get sellerName => _sellerName ?? '';
  set sellerName(String? val) => _sellerName = val;

  bool hasSellerName() => _sellerName != null;

  // "buyerName" field.
  String? _buyerName;
  String get buyerName => _buyerName ?? '';
  set buyerName(String? val) => _buyerName = val;

  bool hasBuyerName() => _buyerName != null;

  // "shippingStartDate" field.
  String? _shippingStartDate;
  String get shippingStartDate => _shippingStartDate ?? '';
  set shippingStartDate(String? val) => _shippingStartDate = val;

  bool hasShippingStartDate() => _shippingStartDate != null;

  // "shippingEndDate" field.
  String? _shippingEndDate;
  String get shippingEndDate => _shippingEndDate ?? '';
  set shippingEndDate(String? val) => _shippingEndDate = val;

  bool hasShippingEndDate() => _shippingEndDate != null;

  // "commodityId" field.
  String? _commodityId;
  String get commodityId => _commodityId ?? '';
  set commodityId(String? val) => _commodityId = val;

  bool hasCommodityId() => _commodityId != null;

  static ContractsStruct fromMap(Map<String, dynamic> data) => ContractsStruct(
        id: data['id'] as String?,
        folio: data['folio'] as String?,
        type: data['type'] as String?,
        quantity: castToType<double>(data['quantity']),
        price: castToType<double>(data['price']),
        basis: castToType<double>(data['basis']),
        customer: data['customer'] as String?,
        commodityName: data['commodityName'] as String?,
        date: data['date'] as String?,
        priceType: data['priceType'] as String?,
        measurementUnit: data['measurementUnit'] as String?,
        sellerName: data['sellerName'] as String?,
        buyerName: data['buyerName'] as String?,
        shippingStartDate: data['shippingStartDate'] as String?,
        shippingEndDate: data['shippingEndDate'] as String?,
        commodityId: data['commodityId'] as String?,
      );

  static ContractsStruct? maybeFromMap(dynamic data) => data is Map
      ? ContractsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'folio': _folio,
        'type': _type,
        'quantity': _quantity,
        'price': _price,
        'basis': _basis,
        'customer': _customer,
        'commodityName': _commodityName,
        'date': _date,
        'priceType': _priceType,
        'measurementUnit': _measurementUnit,
        'sellerName': _sellerName,
        'buyerName': _buyerName,
        'shippingStartDate': _shippingStartDate,
        'shippingEndDate': _shippingEndDate,
        'commodityId': _commodityId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'folio': serializeParam(
          _folio,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.double,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'basis': serializeParam(
          _basis,
          ParamType.double,
        ),
        'customer': serializeParam(
          _customer,
          ParamType.String,
        ),
        'commodityName': serializeParam(
          _commodityName,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'priceType': serializeParam(
          _priceType,
          ParamType.String,
        ),
        'measurementUnit': serializeParam(
          _measurementUnit,
          ParamType.String,
        ),
        'sellerName': serializeParam(
          _sellerName,
          ParamType.String,
        ),
        'buyerName': serializeParam(
          _buyerName,
          ParamType.String,
        ),
        'shippingStartDate': serializeParam(
          _shippingStartDate,
          ParamType.String,
        ),
        'shippingEndDate': serializeParam(
          _shippingEndDate,
          ParamType.String,
        ),
        'commodityId': serializeParam(
          _commodityId,
          ParamType.String,
        ),
      }.withoutNulls;

  static ContractsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContractsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        folio: deserializeParam(
          data['folio'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.double,
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
        customer: deserializeParam(
          data['customer'],
          ParamType.String,
          false,
        ),
        commodityName: deserializeParam(
          data['commodityName'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        priceType: deserializeParam(
          data['priceType'],
          ParamType.String,
          false,
        ),
        measurementUnit: deserializeParam(
          data['measurementUnit'],
          ParamType.String,
          false,
        ),
        sellerName: deserializeParam(
          data['sellerName'],
          ParamType.String,
          false,
        ),
        buyerName: deserializeParam(
          data['buyerName'],
          ParamType.String,
          false,
        ),
        shippingStartDate: deserializeParam(
          data['shippingStartDate'],
          ParamType.String,
          false,
        ),
        shippingEndDate: deserializeParam(
          data['shippingEndDate'],
          ParamType.String,
          false,
        ),
        commodityId: deserializeParam(
          data['commodityId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ContractsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContractsStruct &&
        id == other.id &&
        folio == other.folio &&
        type == other.type &&
        quantity == other.quantity &&
        price == other.price &&
        basis == other.basis &&
        customer == other.customer &&
        commodityName == other.commodityName &&
        date == other.date &&
        priceType == other.priceType &&
        measurementUnit == other.measurementUnit &&
        sellerName == other.sellerName &&
        buyerName == other.buyerName &&
        shippingStartDate == other.shippingStartDate &&
        shippingEndDate == other.shippingEndDate &&
        commodityId == other.commodityId;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        folio,
        type,
        quantity,
        price,
        basis,
        customer,
        commodityName,
        date,
        priceType,
        measurementUnit,
        sellerName,
        buyerName,
        shippingStartDate,
        shippingEndDate,
        commodityId
      ]);
}

ContractsStruct createContractsStruct({
  String? id,
  String? folio,
  String? type,
  double? quantity,
  double? price,
  double? basis,
  String? customer,
  String? commodityName,
  String? date,
  String? priceType,
  String? measurementUnit,
  String? sellerName,
  String? buyerName,
  String? shippingStartDate,
  String? shippingEndDate,
  String? commodityId,
}) =>
    ContractsStruct(
      id: id,
      folio: folio,
      type: type,
      quantity: quantity,
      price: price,
      basis: basis,
      customer: customer,
      commodityName: commodityName,
      date: date,
      priceType: priceType,
      measurementUnit: measurementUnit,
      sellerName: sellerName,
      buyerName: buyerName,
      shippingStartDate: shippingStartDate,
      shippingEndDate: shippingEndDate,
      commodityId: commodityId,
    );
