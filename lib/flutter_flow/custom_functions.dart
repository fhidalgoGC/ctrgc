import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/custom_auth/auth_util.dart';

double containerBodyWidthRv(double screenWidth) {
  const double navSideWidth = 250;
  const double GCBreakPointSmall = 479;
  const double GCBreakPointLarge = 991;

  double navSide = navSideWidth;
  double paddingContainer = 5 * 2;

  double containerWidth = screenWidth - navSide - paddingContainer;

  if ((screenWidth - navSide - paddingContainer) <= 667) {
    containerWidth = screenWidth - paddingContainer;
    if (containerWidth >= GCBreakPointSmall) {
      containerWidth = GCBreakPointSmall - paddingContainer;
    }
  }

  if ((screenWidth - navSide - paddingContainer) > 667 &&
      (screenWidth - navSide) <= GCBreakPointLarge) {
    containerWidth = screenWidth - navSide - paddingContainer;
  }

  if ((screenWidth - navSide - paddingContainer) > GCBreakPointLarge) {
    containerWidth = 982;
  }

  return containerWidth;
}

double? containerControlWidthRv(
  double screenWidth,
  double containerBodyWidth,
) {
  double bodyPaddingOneSide = 12;
  double wrapSpacingOneSide = 8;
  double controlWidth = 0;
  controlWidth = ((containerBodyWidth -
          (wrapSpacingOneSide * 2) -
          (bodyPaddingOneSide) * 2) /
      2);

  if (containerBodyWidth <= 667) {
    controlWidth = containerBodyWidth;
  }

  if (containerBodyWidth > 667) {
    controlWidth = ((containerBodyWidth / 2) -
        (wrapSpacingOneSide * 2) -
        (bodyPaddingOneSide * 2));
  }

  if (containerBodyWidth >= 982) {
    controlWidth =
        (containerBodyWidth / 2) - wrapSpacingOneSide - bodyPaddingOneSide;
    controlWidth = controlWidth + 12;
  }

  if (containerBodyWidth >= 982 && screenWidth <= 1280) {
    controlWidth = controlWidth - 12;
  }

  return controlWidth;
}

double containerParentPadding(double screenWidth) {
  double navSide = 250;
  if ((screenWidth - navSide) <= 469) {
    return 12;
  }
  return 24;
}

int parseStringWithMaskToInteger(
  String? input,
  String? locate,
  String? mask,
) {
  String locateFormat = 'es_US';
  String maskFormat = '#,##0';
  int rt = 0;

  if (locate != null && locate.trim().isNotEmpty) {
    locateFormat = locate;
  }

  if (mask != null && mask.trim().isNotEmpty) {
    maskFormat = mask;
  }

  if (input == null || input.trim().isEmpty) {
    return 0;
  }

  print('$locateFormat,$maskFormat,$input');

  try {
    NumberFormat formatter = NumberFormat(maskFormat, locateFormat);
    return (formatter.parse(input).toDouble()).toInt();
  } catch (e) {
    return 0;
  }
}

double containerBodyWidth(
  double screenWidth,
  double navSide,
  double paddingRootContaineRight,
  double totalOthersPadding,
) {
  const double GCBreakPointSmall = 479;

  if (screenWidth >= 1536) {
    screenWidth = 1536;
  }

  double containerWidth = screenWidth -
      navSide -
      ((paddingRootContaineRight * 2) - totalOthersPadding);

  if (screenWidth <= 667) {
    containerWidth =
        screenWidth - (paddingRootContaineRight - totalOthersPadding);
  } else if (containerWidth <= 667) {
    containerWidth =
        screenWidth - (paddingRootContaineRight - totalOthersPadding);
    if (containerWidth >= GCBreakPointSmall) {
      containerWidth = screenWidth -
          navSide -
          ((paddingRootContaineRight * 2) - totalOthersPadding);
    }
  }

  return containerWidth;
}

List<CtrRemarkScheduleStruct> ctrCreateRemarkInList(
  String remark1,
  String remark2,
  String remark3,
  String remark4,
  String remark5,
  String remark6,
) {
  List<CtrRemarkScheduleStruct> list_remarks = [];
  if (!remark1.isEmpty && remark1.trim() != '') {
    list_remarks.add(CtrRemarkScheduleStruct(
        title: 'contact', values: remark1.trim().split('\n')));
  }

  if (!remark2.isEmpty && remark2.trim() != '') {
    list_remarks.add(CtrRemarkScheduleStruct(
        title: 'shipment', values: remark2.trim().split('\n')));
  }

  if (!remark3.isEmpty && remark3.trim() != '') {
    list_remarks.add(CtrRemarkScheduleStruct(
        title: 'routing', values: remark3.trim().split('\n')));
  }

  if (!remark4.isEmpty && remark4.trim() != '') {
    list_remarks.add(CtrRemarkScheduleStruct(
        title: 'premDisc', values: remark4.trim().split('\n')));
  }

  if (!remark5.isEmpty && remark5.trim() != '') {
    list_remarks.add(CtrRemarkScheduleStruct(
        title: 'terms', values: remark5.trim().split('\n')));
  }

  if (!remark6.isEmpty && remark6.trim() != '') {
    list_remarks.add(CtrRemarkScheduleStruct(
        title: 'remarks', values: remark6.trim().split('\n')));
  }

  return list_remarks;
}

double? containerRowsWidth(
  double screenWidth,
  double containerBodyWidth,
  double paddingBody,
  double totalOthersPadding,
  double spaceBetweenRow,
  int cntRows,
) {
  double controlWidth = 0;

  controlWidth = containerBodyWidth - paddingBody - totalOthersPadding;

  if (containerBodyWidth <= 667) {
    controlWidth = containerBodyWidth;
    cntRows = 1;
  }

  if (cntRows == 1) {
    controlWidth = controlWidth;
  } else if (cntRows >= 2) {
    controlWidth = controlWidth / cntRows;
    controlWidth -= spaceBetweenRow;
  }

  if (containerBodyWidth >= 1238) {
    controlWidth -= spaceBetweenRow;
  }

  return controlWidth;
}

String? returnDefaultQueryFilter(
  String role,
  String partitionKey,
) {
  //debugPrint("returnDefaultFilter");

  Map<String, dynamic> filter;

  // DEFAULT FILTER
  filter = {
    "_partitionKey": partitionKey,
    "roles.slug": {
      "\$in": [role]
    }
  };
  return jsonEncode(filter);
}

String formatDateString(
  String date,
  String format,
) {
  DateTime createdAt = DateTime.parse(date);
  return DateFormat(format).format(createdAt);
}

PeopleStruct selectPeopleTable(
  List<PeopleStruct> listPeople,
  List<int> listSelectedIndex,
) {
  PeopleStruct peopleSelected = new PeopleStruct();

  for (int i = 0; i < listSelectedIndex.length; i++) {
    int index = listSelectedIndex[i];
    if (index >= 0 && index < listPeople.length) {
      peopleSelected = listPeople[index];
    }
  }

  return peopleSelected;
}

String? contractCalcFuture(
  String basisStr,
  String priceStr,
  int symbol,
  String locate,
  String mask,
) {
  double total = 0;
  double basis = parseStringWithMaskToDouble(basisStr, locate, mask);
  double price = parseStringWithMaskToDouble(priceStr, locate, mask);

  if (price > 0) {
    total = price - (basis * symbol);
  } else {
    total = 0;
  }
  return formatNumbersQuantity(total, locate, mask);
}

int diffDatesDays(
  String dateInit,
  String dateFinish,
) {
  DateTime startDate = DateTime.parse(dateInit);
  DateTime endDate = DateTime.parse(dateFinish);

  return endDate.difference(startDate).inDays;
}

List<CtrNoteSchemaStruct> ctrCreateNotesInList(
  String peopleId,
  String peopleName,
  String text,
  String date,
) {
  List<CtrNoteSchemaStruct> noteList = [];
  if (!text.isEmpty && text.trim() != '') {
    CtrNoteSchemaStruct note = CtrNoteSchemaStruct();
    note.peopleId = peopleId;
    note.peopleName = peopleName;
    note.text = text;
    note.date = date;
    noteList.add(note);
  }

  return noteList;
}

String getSubStringEnd(
  String chainString,
  int quantity,
) {
  if (quantity > 0 && chainString.length >= quantity) {
    return chainString.substring(chainString.length - quantity);
  }

  return chainString;
}

String dateToString(DateTime currentTime) {
  //DateTime currentTime = DateTime.now();

  String formattedTime =
      DateFormat("yyyy-MM-ddTHH:mm:ss.SSSZ").format(currentTime);

  return formattedTime;
}

List<double> extractValues(
  double contractQuantity,
  List<dynamic> subContracts,
) {
  List<double> values = [];
  List<double> valuesSubContracts = [];

  double quantityNumberPie = contractQuantity / 1000;

  if (subContracts.isNotEmpty) {
    for (var item in subContracts) {
      if (item.containsKey('quantityPie')) {
        valuesSubContracts.add(item['quantityPie']);
        quantityNumberPie -= item['quantityPie'];
      }
    }
  }

  String quantityPieFormat = quantityNumberPie.toStringAsFixed(2);

  values.add(double.parse(quantityPieFormat));

  if (valuesSubContracts.isNotEmpty) values.addAll(valuesSubContracts);

  return values;
}

String getFormatNumber(double numEntry) {
  final formateador = NumberFormat('#,##0.00', 'en_US');
  return formateador.format(numEntry);
}

List<PeopleStruct> sortPeopleColumns(
  List<PeopleStruct> listToSort,
  bool isAsc,
  int? sortColumIndex,
) {
  switch (sortColumIndex) {
    case 0:
      listToSort.sort((a, b) => a.fullName.compareTo(b.fullName));
      break;
    case 1:
      listToSort.sort((a, b) => a.email.compareTo(b.email));
      break;
    case 2:
      listToSort.sort((a, b) => a.phoneNumber.compareTo(b.phoneNumber));
      break;
    default:
      break;
  }
  if (!isAsc) {
    listToSort = listToSort.reversed.toList();
  }
  return listToSort;
}

double getPercentage(
  double total,
  double partialTotal,
) {
  double percentagePartial = 0;

  if (total > 0 && total > partialTotal) {
    percentagePartial = ((partialTotal * 100) / total) / 100;
  }

  if (total > 0 && total == partialTotal) {
    return 1;
  }

  return percentagePartial == 0
      ? percentagePartial
      : double.parse(percentagePartial.toStringAsFixed(2));
}

String formatStringDateToUi(
  String? date,
  String newFormat,
) {
  if (date == null) return '';
  try {
    String format = 'dd/MM/yyyy';
    if (!newFormat.isEmpty && newFormat.trim() != '') {
      format = newFormat;
    }
    DateTime fechaOriginal = DateTime.parse(date);
    String fechaFormateada = DateFormat(format).format(fechaOriginal);
    return fechaFormateada;
  } catch (e) {
    return '';
  }
}

double sumBasisFuture(
  double basis,
  double futures,
) {
  if (basis == null) basis = 0;
  if (futures == null) futures = 0;
  double total = basis + futures;
  return basis + futures;
}

bool checkMinMax(
  double min,
  double max,
) {
  if (min >= max) {
    return false;
  } else {
    return true;
  }
}

bool checkDatesFromTo(
  DateTime dateFrom,
  DateTime dateTo,
) {
  if (dateFrom.isAfter(dateTo)) {
    return false;
  } else if (dateFrom.isBefore(dateTo)) {
    return true;
  } else {
    return false;
  }
}

DateTime formatStringToDatetime(
  String date,
  String format,
) {
  DateFormat formato = DateFormat(format);
  try {
    DateTime fecha = formato.parseStrict(date);
    return fecha;
  } catch (e) {
    return DateTime.now();
  }
}

String findRemarkInList(
  List<CtrRemarkScheduleStruct> remarks,
  String title,
) {
  CtrRemarkScheduleStruct? rmk = null;
  String rmkOut = '';
  try {
    for (var item in remarks) {
      if (item.title == title) {
        rmk = item;
        break;
      }
    }

    if (rmk != null) {
      if (!rmk.values.isEmpty) {
        rmkOut = rmk.values.join('\n');
        return rmkOut.trim();
      } else {
        return rmkOut;
      }
    } else {
      return rmkOut;
    }
  } catch (e) {
    return rmkOut;
  }
}

List<String> extractLabels(
  String contractFolio,
  List<dynamic> subContracts,
) {
  List<String> labels = [];
  List<String> labelsSubContracts = [];

  labels.add(contractFolio);

  if (subContracts.isNotEmpty) {
    for (var item in subContracts) {
      if (item.containsKey('folio')) labelsSubContracts.add(item['folio']);
    }
  }

  if (labelsSubContracts.isNotEmpty) labels.addAll(labelsSubContracts);

  return labels;
}

double? getTotalPriceSubContracts(
  double? futures,
  double? basis,
  String? operation,
  String? pricingType,
) {
  // Function that receives as parameter the future,
  // the basis and the operation type and calculateS
  // the total price for a subcontract as a double result

  double effectiveFutures = futures ?? 0.0;
  double effectiveBasis = basis ?? 0.0;

  if (pricingType == 'Fixed') {
    return 0;
  }
  if (operation == 'add') {
    double result = effectiveFutures + effectiveBasis;
    return double.parse(result.toStringAsFixed(2));
  } else if (operation == 'substract') {
    double result = effectiveFutures - effectiveBasis;
    return double.parse(result.toStringAsFixed(2));
  } else {
    throw ArgumentError('Invalid operation');
  }
}

List<double> getChartSubContract(
  double? total,
  double? fixed,
  double? quantity,
) {
  // Function that receives as parameters the total,
  // fixed and quantity from the subctract form and
  // return an array whit the quantities for the contract
  // fixed and the quantity for the new subcontract

  double effectiveTotal = total ?? 0.0;
  double effectiveFixed = fixed ?? 0.0;
  double effectiveQuantity = quantity ?? 0.0;

  double totalInventory = effectiveTotal - effectiveFixed;

  if (effectiveQuantity > totalInventory) {
    return [0.0001, effectiveQuantity];
  }

  double resultInventory = totalInventory - effectiveQuantity;

  if (effectiveQuantity == 0) {
    return [resultInventory, 0.0001];
  }

  if (resultInventory == 0) {
    return [0.0001, effectiveQuantity];
  }

  return [resultInventory, effectiveQuantity];
}

double detailSubContractRowRight(
  double containerBodyWidth,
  double containerRowWidth,
  double paddingBody,
  double totalOthersPadding,
  double spaceBetweenRow,
) {
  print("\n");
  print("detailSubContractRow\n");
  print("containerBodyWidth->$containerBodyWidth");
  containerBodyWidth =
      (containerBodyWidth - paddingBody - totalOthersPadding - spaceBetweenRow);
  double newWidth = containerBodyWidth - containerRowWidth;
  if (newWidth < containerRowWidth) {
    newWidth = containerRowWidth;
  }

  if (containerBodyWidth <= 667) {
    newWidth = containerBodyWidth + (spaceBetweenRow * 2);
  }

  if (containerBodyWidth >= 1194) {
    newWidth -= spaceBetweenRow;
  } else {
    newWidth += spaceBetweenRow;
  }

// print("containerBodyWidth->$containerBodyWidth");
// print("containerRowWidth->$containerRowWidth");
// print("paddingBody->$paddingBody");
// print("totalOthersPadding->$totalOthersPadding");
// print("spaceBetweenRow->$spaceBetweenRow");
// print("newWidth->$newWidth");
// print("detailSubContractRow\n");
// print("\n");

  return newWidth;
}

String capitalizeText(String text) {
  if (text.isEmpty) {
    return text;
  }
  return text.substring(0, 1).toUpperCase() + text.substring(1).toLowerCase();
}

double detailSubContractRowLeft(
  double containerBodyWidth,
  double containerRowWidth,
  double paddingBody,
  double totalOthersPadding,
  double spaceBetweenRow,
) {
  print("\n");
  print("detailSubContractRowRight\n");
  print("containerBodyWidth->$containerBodyWidth");

  double newWidth = containerRowWidth;
  if (containerBodyWidth <= 667) {
    newWidth = containerBodyWidth + (spaceBetweenRow * 2);
  }

  print("containerBodyWidth->$containerBodyWidth");
  print("containerRowWidth->$containerRowWidth");
  print("paddingBody->$paddingBody");
  print("totalOthersPadding->$totalOthersPadding");
  print("spaceBetweenRow->$spaceBetweenRow");
  print("newWidth->$newWidth");
  print("detailSubContractRowRight\n");
  print("\n");
  return newWidth;
}

String formatNumbersQuantity(
  double number,
  String? locate,
  String? mask,
) {
  //#,##0.00
  String locateFormat = 'es_US';
  String maskFormat = '#,##0';
  if (locate != null && locate.trim().isNotEmpty) {
    locateFormat = locate;
  }

  if (mask != null && mask.trim().isNotEmpty) {
    maskFormat = mask;
  }

  try {
    String formattedNumber =
        NumberFormat(maskFormat, locateFormat).format(number);
    return formattedNumber;
  } catch (e) {
    print(e);
    return '0';
  }
}

String dateShippementRange(
  String startDate,
  String endDate,
) {
  DateTime startDateTime = DateTime.parse(startDate);
  DateTime endDateTime = DateTime.parse(endDate);

  String yearStart = DateFormat('yyyy').format(startDateTime);
  String yearEnd = DateFormat('yyyy').format(endDateTime);

  String monthStart = DateFormat('MMMM').format(startDateTime);
  String monthEnd = DateFormat('MMMM').format(endDateTime);

  String dayStart = DateFormat('d').format(startDateTime);
  String dayEnd = DateFormat('d').format(endDateTime);

  String year = yearEnd == yearStart ? yearEnd : '$yearStart - $yearEnd';
  return '$monthStart $dayStart to $monthEnd $dayEnd, $year';
}

String? formatDateToContractList(
  String startDate,
  String endDate,
) {
  DateTime start = DateTime.parse(startDate);
  DateTime end = DateTime.parse(endDate);

  // Formato para el día y el mes.
  DateFormat monthDayFormat = DateFormat('MMMM d');
  // Formato para el año.
  DateFormat yearFormat = DateFormat('y');

  // Crear las partes del string.
  String startMonthDay = monthDayFormat.format(start);
  String endMonthDay = monthDayFormat.format(end);
  String year = yearFormat.format(end);
  return '$startMonthDay to $endMonthDay, $year';
}

String findCommodityInList(
  List<CommoditiesStruct> commodities,
  String commodityId,
) {
  String commodityName = '';
  for (var item in commodities) {
    if (item.id == commodityId) {
      commodityName = item.name;
      break;
    }
  }
  return commodityName;
}

List<ContractsStruct> sortContractsColumns(
  bool isAsc,
  int? sortColumIndex,
  List<ContractsStruct> listToSort,
) {
  switch (sortColumIndex) {
    case 0:
      listToSort.sort((a, b) => a.folio.compareTo(b.folio));
      break;
    case 1:
      listToSort.sort((a, b) => a.date.compareTo(b.date));
      break;
    case 2:
      listToSort.sort((a, b) => a.type.compareTo(b.type));
      break;
    case 3:
      listToSort.sort((a, b) => a.customer.compareTo(b.customer));
      break;
    case 4:
      listToSort.sort((a, b) => a.commodityName.compareTo(b.commodityName));
      break;
    case 5:
      listToSort.sort((a, b) => a.quantity.compareTo(b.quantity));
      break;
    case 6:
      listToSort.sort((a, b) => a.price.compareTo(b.price));
      break;
    case 7:
      listToSort.sort((a, b) => a.basis.compareTo(b.basis));
      break;
    case 7:
      listToSort.sort((a, b) => a.basis.compareTo(b.basis));
      break;
    default:
      break;
  }
  if (!isAsc) {
    listToSort = listToSort.reversed.toList();
  }
  return listToSort;
}

double parseStringToDouble(String? input) {
  if (input == null) return 0.0;
  if (input.trim().isEmpty) return 0.0;
  try {
    return double.parse(input);
  } catch (e) {
    return 0.0;
  }
}

dynamic printJson(dynamic data) {
  print('json->');
  print(data);
  return data;
}

String printString(String text) {
  print(text);
  return text;
}

dynamic isJsonNull(dynamic json) {
  print('fn:isJsonNull');
  print(json);
  if (json == null) return true;
  return false;
}

dynamic initDefaultJson(dynamic json) {
  print("fn:initDefaultJson -> $json");
  if (json == null) return {};
  return json;
}

bool isArrayNullOrEmpty(List<dynamic>? array) {
  if (array == null || array.isEmpty) {
    return false;
  } else {}
  ;
  return true;
}

List<CtrParticipantSchemaStruct> createParticipantsInList(
  String id,
  String fullName,
  String rol,
) {
  List<CtrParticipantSchemaStruct> peopleInlist = [
    CtrParticipantSchemaStruct(peopleId: id, name: fullName, role: rol)
  ];

  return peopleInlist;
}

double parseStringWithMaskToDouble(
  String? input,
  String? locate,
  String? mask,
) {
  String locateFormat = 'es_US';
  String maskFormat = '#,##0';

  if (locate != null && locate.trim().isNotEmpty) {
    locateFormat = locate;
  }

  if (mask != null && mask.trim().isNotEmpty) {
    maskFormat = mask;
  }

  if (input == null || input.trim().isEmpty) {
    return 0.0;
  }

  print('$locateFormat,$maskFormat,$input');

  try {
    NumberFormat formatter = NumberFormat(maskFormat, locateFormat);
    return formatter.parse(input).toDouble();
  } catch (e) {
    return 0.0;
  }
}

int parseDoubleToInt(double? input) {
  if (input == null) return 0;
  return input.toInt();
}

String? contractCalcBasis(
  String input,
  String locate,
  String? mask,
) {
  return '';
}

int contractSymbolToZero(
  String input,
  String locate,
  String mask,
) {
  double value = parseStringWithMaskToDouble(input, locate, mask);
  if (value >= 0) {
    return 1;
  } else {
    return -1;
  }
}

String formatNumberStringToStringMask(
  String input,
  String locate,
  String mask,
) {
  String rt = "";
  if (input.isNotEmpty) {
    double inputParse = parseStringWithMaskToDouble(input, locate, mask);
    if (inputParse == 0) {
      return rt;
    }
    return formatNumbersQuantity(inputParse, locate, mask);
  }
  return rt;
}

String? returnDefaultQueryFilterRemarks(
  String title,
  String partitionKey,
) {
  Map<String, dynamic> filter;

  // DEFAULT FILTER
  filter = {
    "_partitionKey": partitionKey.trim(),
    "title": title.trim(),
  };
  return jsonEncode(filter);
}

String? formatNumberDoubleToStringMask(
  double input,
  String locate,
  String mask,
) {
  String rt = "";
  if (input != 0) {
    return formatNumbersQuantity(input, locate, mask);
  }
  return rt;
}

int? calculateHeightRow(
  String input,
  int heightPerLine,
) {
  int newHeight = heightPerLine;
  input = input.toString();
  if (input.isNotEmpty) {
    List<String> splitList = input.split('\n');
    newHeight = splitList.length * heightPerLine;
  }
  return newHeight;
}
