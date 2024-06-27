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

import '/backend/api_requests/api_interceptor.dart';

String getAddressString(dynamic objAddress) {
  String addressPeople = '-';

  if (objAddress.containsKey('address_line_1')) {
    if (objAddress['address_line_1'].isNotEmpty) {
      addressPeople = objAddress['address_line_1'];

      if (objAddress.containsKey('address_line_2')) {
        if (objAddress['address_line_2'].isNotEmpty)
          addressPeople = addressPeople + objAddress['address_line_2'];
      }
    }
  }

  return addressPeople;
}

class addressPeopleInterceptor extends FFApiInterceptor {
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
    // Perform any necessary calls or modifications to the [response] prior
    // to returning it.

    response.jsonBody['addressPeople'] = '-';

    if (response.jsonBody.containsKey('data')) {
      if (response.jsonBody['data'].isNotEmpty) {
        response.jsonBody['addressPeople'] = '-';
        dynamic withOutProductionUnit =
            response.jsonBody['data'].firstWhere((dynamic row) {
          Map<String, dynamic> rowMap = row as Map<String, dynamic>;
          return rowMap['production_units'] == null ||
              rowMap['production_units'].isEmpty;
        }, orElse: () => null);

        if (withOutProductionUnit == null)
          response.jsonBody['addressPeople'] =
              getAddressString(response.jsonBody['data'][0]);
        else
          response.jsonBody['addressPeople'] =
              getAddressString(withOutProductionUnit);
        for (var address in response.jsonBody['data']) {
          if (address.containsKey('country')) if (address['country'].isNotEmpty)
            address['country'] = address['country']
                .split(',')[0]
                .split(':')[1]
                .replaceAll("'", "");
        }
      }
    }
    return response;
  }
}
