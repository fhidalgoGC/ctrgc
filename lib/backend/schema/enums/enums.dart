import 'package:collection/collection.dart';

enum Pages {
  dashboard,
  buyers,
  sellers,
  purchase_contracts,
  sale_contracts,
  close_session,
  more,
  participants,
  contracts,
  detail_contract,
  list_purchase_contract,
  list_sale_contract,
}

enum CtrTypeEnum {
  sale,
  purchase,
  storage,
}

enum CtrSubTypeEnum {
  direct,
  imported,
  importedFreight,
}

enum CtrWeightsEnum {
  destination,
  origin,
  submitCc,
  notAppliance,
  firstCertification,
}

enum CtrInspectionsEnum {
  destination,
  origin,
  submitCc,
  notAppliance,
  firstCertification,
}

enum CtrProteinsEnum {
  destination,
  origin,
  submitCc,
  notAppliance,
  firstCertification,
}

enum CtrLogisticPaymentResponsabilityEnum {
  seller,
  buyer,
  other,
}

enum CtrLogCoordinationResponsabEnum {
  seller,
  buyer,
  other,
  either,
}

enum CtrBasisOperationEnum {
  add,
  substract,
}

enum CtrMeasurementUnitEnum {
  bushel,
  mt,
  cwt,
}

enum CtrLogFreightCostTypeEnum {
  fixed,
  variable,
}

enum CtrPrincingTypeEnum {
  fixed,
  basis,
}

enum CtrCurrencyEnum {
  usd,
  mxn,
}

enum Role {
  seller,
  buyer,
  all,
}

enum CtrOptionMonthEnum {
  January,
  February,
  March,
  April,
  May,
  June,
  July,
  August,
  September,
  October,
  November,
  December,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Pages):
      return Pages.values.deserialize(value) as T?;
    case (CtrTypeEnum):
      return CtrTypeEnum.values.deserialize(value) as T?;
    case (CtrSubTypeEnum):
      return CtrSubTypeEnum.values.deserialize(value) as T?;
    case (CtrWeightsEnum):
      return CtrWeightsEnum.values.deserialize(value) as T?;
    case (CtrInspectionsEnum):
      return CtrInspectionsEnum.values.deserialize(value) as T?;
    case (CtrProteinsEnum):
      return CtrProteinsEnum.values.deserialize(value) as T?;
    case (CtrLogisticPaymentResponsabilityEnum):
      return CtrLogisticPaymentResponsabilityEnum.values.deserialize(value)
          as T?;
    case (CtrLogCoordinationResponsabEnum):
      return CtrLogCoordinationResponsabEnum.values.deserialize(value) as T?;
    case (CtrBasisOperationEnum):
      return CtrBasisOperationEnum.values.deserialize(value) as T?;
    case (CtrMeasurementUnitEnum):
      return CtrMeasurementUnitEnum.values.deserialize(value) as T?;
    case (CtrLogFreightCostTypeEnum):
      return CtrLogFreightCostTypeEnum.values.deserialize(value) as T?;
    case (CtrPrincingTypeEnum):
      return CtrPrincingTypeEnum.values.deserialize(value) as T?;
    case (CtrCurrencyEnum):
      return CtrCurrencyEnum.values.deserialize(value) as T?;
    case (Role):
      return Role.values.deserialize(value) as T?;
    case (CtrOptionMonthEnum):
      return CtrOptionMonthEnum.values.deserialize(value) as T?;
    default:
      return null;
  }
}
