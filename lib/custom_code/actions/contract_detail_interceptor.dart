// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:intl/intl.dart';

import '/backend/api_requests/api_interceptor.dart';

class DataRemarks {
  String fob;
  String contact;
  String instructions;
  String shipment;
  String terms;
  String routing;
  String premDisc;

  DataRemarks(
      {required this.fob,
      required this.contact,
      required this.instructions,
      required this.shipment,
      required this.terms,
      required this.routing,
      required this.premDisc});
}

Future<DataRemarks> getRemarks(List<dynamic> items) async {
  DataRemarks result = DataRemarks(
      fob: '-',
      contact: '-',
      instructions: '-',
      shipment: '-',
      terms: '-',
      routing: '-',
      premDisc: '-');

  if (items.length > 0) {
    for (var item in items) {
      if (item.containsKey('title') && item.containsKey('values')) {
        if (item['title'].toLowerCase() == 'fob') {
          result.fob = item['values'].join(', ');
        }
        if (item['title'].toLowerCase() == 'contact') {
          result.contact = item['values'].join(', ');
        }
        if (item['title'].toLowerCase() == 'remarks') {
          result.instructions = item['values'].join('\n');
        }
        if (item['title'].toLowerCase() == 'shipment') {
          result.shipment = item['values'].join('\n');
        }
        if (item['title'].toLowerCase() == 'terms') {
          result.terms = item['values'].join('\n');
        }
        if (item['title'].toLowerCase() == 'routing') {
          result.routing = item['values'].join('\n');
        }
        if (item['title'].toLowerCase() == 'premdisc') {
          result.premDisc = item['values'].join('\n');
        }
      }
    }
  }

  return result;
}

class ContractDetailInterceptor extends FFApiInterceptor {
  @override
  Future<ApiCallOptions> onRequest({
    required ApiCallOptions options,
  }) async {
    // Perform any necessary calls or modifications to the [options] before
    // the API call is made.
    return options;
  }

  @override
  Future<ApiCallResponse> onResponse({
    required ApiCallResponse response,
    required Future<ApiCallResponse> Function() retryFn,
  }) async {
    if (response.jsonBody.containsKey('created_at')) {
      response.jsonBody['contractDate'] =
          formatDateString(response.jsonBody['created_at'], 'M/d/yyyy');
    } else
      response.jsonBody['contractDate'] = '-';

    if (response.jsonBody.containsKey('_id')) {
      response.jsonBody['contractNumber'] = response.jsonBody['_id'];
    } else
      response.jsonBody['contractNumber'] = '-';

    if (response.jsonBody.containsKey('remarks')) {
      DataRemarks responseRemarks =
          await getRemarks(response.jsonBody['remarks']);

      response.jsonBody['fob'] = responseRemarks.fob;
      response.jsonBody['contact'] = responseRemarks.contact;
      response.jsonBody['instructions'] = responseRemarks.instructions;
      response.jsonBody['shipmentPeriod'] = responseRemarks.shipment;
      response.jsonBody['paymentTerms'] = responseRemarks.terms;
      response.jsonBody['routing'] = responseRemarks.routing;
      response.jsonBody['premDisc'] = responseRemarks.premDisc;
    } else {
      response.jsonBody['fob'] = '-';
      response.jsonBody['contact'] = '-';
      response.jsonBody['instructions'] = '-';
      response.jsonBody['shipmentPeriod'] = '-';
      response.jsonBody['paymentTerms'] = '-';
      response.jsonBody['routing'] = '-';
      response.jsonBody['premDisc'] = '-';
    }

    double quantityNumber = response.jsonBody.containsKey('quantity')
        ? response.jsonBody['quantity']
        : 0.00;

    double priceNumber = 0.00;

    double basisNumber = 0.00;

    double futureNumber = 0.00;

    String quantityUnits = getFormatNumber(quantityNumber);

    String measurementUnit = response.jsonBody.containsKey('measurement_unit')
        ? response.jsonBody['measurement_unit']
        : '-';

    String currencyUnit = '-';

    response.jsonBody['pricingType'] = 'Fixed';
    response.jsonBody['pricingColorType'] = '#b8ebf3';
    response.jsonBody['isFixed'] = true;

    bool validIsBasis = false;

    if (response.jsonBody.containsKey('price_schedule')) {
      if (response.jsonBody['price_schedule'].length > 0) {
        currencyUnit =
            response.jsonBody['price_schedule'][0]['payment_currency'] == 'usd'
                ? '\$'
                : response.jsonBody['price_schedule'][0]['payment_currency'];

        priceNumber = response.jsonBody['price_schedule'][0]['price'];
        basisNumber = response.jsonBody['price_schedule'][0]['basis'];
        futureNumber = response.jsonBody['price_schedule'][0]['future_price'];

        if (response.jsonBody['price_schedule'][0]['pricing_type'] != 'fixed') {
          response.jsonBody['pricingType'] = 'Basis';
          response.jsonBody['pricingColorType'] = '#c8bdec';
          response.jsonBody['isFixed'] = false;
          validIsBasis = true;
        }
      }
    }

    response.jsonBody['isBasis'] = validIsBasis;

    response.jsonBody['customerId'] = '-';
    response.jsonBody['customerNumber'] = '-';
    response.jsonBody['referenceNumber'] = '-';
    response.jsonBody['customerName'] = '-';

    response.jsonBody['ownerId'] = '-';
    response.jsonBody['ownerNumber'] = '-';
    response.jsonBody['ownerName'] = '-';

    String typeContract =
        response.jsonBody.containsKey('type') ? response.jsonBody['type'] : '';

    if (response.jsonBody.containsKey('participants')) {
      String rolePeople = '';
      String roleOwner = '';

      if (typeContract == 'purchase') {
        rolePeople = 'seller';
        roleOwner = 'buyer';
      }

      if (typeContract == 'sale') {
        rolePeople = 'buyer';
        roleOwner = 'seller';
      }

      if (rolePeople.length > 0) {
        final Map<String, dynamic>? peopleContract =
            response.jsonBody['participants'].firstWhere(
          (element) => element['role'] == rolePeople,
          orElse: () => null,
        );

        if (peopleContract != null) {
          if (peopleContract.containsKey('people_id')) {
            response.jsonBody['customerId'] = peopleContract['people_id'];
            response.jsonBody['customerNumber'] =
                getSubStringEnd(peopleContract['people_id'], 6);
          }

          if (peopleContract.containsKey('name')) {
            response.jsonBody['customerName'] = peopleContract['name'];
          }
        }
      }

      if (roleOwner.length > 0) {
        final Map<String, dynamic>? ownerContract =
            response.jsonBody['participants'].firstWhere(
          (element) => element['role'] == roleOwner,
          orElse: () => null,
        );

        if (ownerContract != null) {
          if (ownerContract.containsKey('people_id')) {
            response.jsonBody['ownerId'] = ownerContract['people_id'];
            response.jsonBody['ownerNumber'] =
                getSubStringEnd(ownerContract['people_id'], 6);
          }

          if (ownerContract.containsKey('name')) {
            response.jsonBody['ownerName'] = ownerContract['name'];
          }
        }
      }
    }

    String contractPrice = getFormatNumber(priceNumber);
    String contractBasis = getFormatNumber(basisNumber);
    String contractFuture = getFormatNumber(futureNumber);

    response.jsonBody['typeContract'] = typeContract.length > 0
        ? typeContract[0].toUpperCase() + typeContract.substring(1)
        : '-';

    response.jsonBody['quantityUnits'] = '$quantityUnits $measurementUnit';
    response.jsonBody['contractPrice'] = '$currencyUnit $contractPrice';
    response.jsonBody['contractBasis'] = '$currencyUnit $contractBasis';
    response.jsonBody['contractFuture'] = '$currencyUnit $contractFuture';

    double overviewTotalNumber = 0.00;
    double overviewDeliveredNumber = 0.00;
    double overviewOpenNumber = 0.00;
    double overviewSettledNumber = 0.00;
    double overviewUnSettledNumber = 0.00;
    double paymentTotalNumber = 0.00;
    double paymentSettledNumber = 0.00;
    double paymentFixedNumber = 0.00;

    if (response.jsonBody.containsKey('inventory')) {
      if (response.jsonBody['inventory'].containsKey('total'))
        overviewTotalNumber = response.jsonBody['inventory']['total'];
      if (response.jsonBody['inventory'].containsKey('fixed'))
        overviewDeliveredNumber = response.jsonBody['inventory']['fixed'];
      if (response.jsonBody['inventory'].containsKey('open'))
        overviewOpenNumber = response.jsonBody['inventory']['open'];
      if (response.jsonBody['inventory'].containsKey('settled'))
        overviewSettledNumber = response.jsonBody['inventory']['settled'];
      if (response.jsonBody['inventory'].containsKey('unsettled'))
        overviewUnSettledNumber = response.jsonBody['inventory']['unsettled'];
    }

    if (response.jsonBody.containsKey('inventory_value')) {
      if (response.jsonBody['inventory_value'].containsKey('total'))
        paymentTotalNumber = response.jsonBody['inventory_value']['total'];

      if (response.jsonBody['inventory_value'].containsKey('settled'))
        paymentSettledNumber = response.jsonBody['inventory_value']['settled'];

      if (response.jsonBody['inventory_value'].containsKey('fixed'))
        paymentFixedNumber = response.jsonBody['inventory_value']['fixed'];
    }

    String contractOverviewTotal = getFormatNumber(overviewTotalNumber);
    String contractOverviewDelivered = getFormatNumber(overviewDeliveredNumber);
    String contractOverviewOpen = getFormatNumber(overviewOpenNumber);
    String contractOverviewTotalSettled =
        getFormatNumber(overviewSettledNumber);
    String contractOverviewTotalUnSettled =
        getFormatNumber(overviewUnSettledNumber);
    String contractPaymentTotal = getFormatNumber(paymentTotalNumber);
    String contractPaymentSettled = getFormatNumber(paymentSettledNumber);
    String contractFixedSettled = getFormatNumber(paymentFixedNumber);

    response.jsonBody['contractOverviewTotal'] =
        '$contractOverviewTotal $measurementUnit';
    response.jsonBody['contractOverviewDelivered'] =
        '$contractOverviewDelivered $measurementUnit';
    response.jsonBody['contractOverviewOpen'] =
        '$contractOverviewOpen $measurementUnit';
    response.jsonBody['contractOverviewTotalSettled'] =
        '$contractOverviewTotalSettled $measurementUnit';
    response.jsonBody['contractOverviewTotalUnSettled'] =
        '$contractOverviewTotalUnSettled $measurementUnit';
    response.jsonBody['contractPaymentTotal'] =
        '$currencyUnit $contractPaymentTotal';
    response.jsonBody['contractPaymentSettled'] =
        '$currencyUnit $contractPaymentSettled';
    response.jsonBody['contractFixedSettled'] =
        '$currencyUnit $contractFixedSettled';

    response.jsonBody['percentageDelivered'] = validIsBasis == false
        ? 1
        : overviewOpenNumber <= 0
            ? 1
            : getPercentage(overviewTotalNumber, overviewDeliveredNumber);
    response.jsonBody['percentageSettled'] = validIsBasis == false
        ? 1
        : overviewSettledNumber > 0 && overviewUnSettledNumber <= 0
            ? 1
            : getPercentage(overviewTotalNumber, overviewSettledNumber);
    response.jsonBody['percentageFixed'] =
        getPercentage(paymentTotalNumber, paymentFixedNumber);

    return response;
  }
}
