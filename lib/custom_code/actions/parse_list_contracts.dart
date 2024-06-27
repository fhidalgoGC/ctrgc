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

Future<List<ContractsStruct>> parseListContracts(
    List<dynamic> responseApi, String type) async {
  List<ContractsStruct> response = [];

  int index = 0;
  if (type == "sale") {
    index = 1;
  }

  for (var item in responseApi) {
    var result = await item;
    ContractsStruct obj = new ContractsStruct();
    obj.folio = result['folio'];
    obj.date = result['created_at'];
    obj.quantity = result['quantity'];
    obj.type = result['type'];

    var prices = result['price_schedule'];
    if (prices is List && prices.isNotEmpty) {
      var firstPrice = prices[0];
      obj.price = firstPrice['price'];
      obj.basis = firstPrice['basis'];
      obj.priceType = firstPrice['pricing_type'];
    }

    var commodity = result['commodity'];
    obj.commodityName = commodity['name'];
    obj.commodityId = commodity['commodity_id'];

    var participants = result['participants'];

    if (participants is List &&
        participants.isNotEmpty &&
        participants.length > index) {
      String role = '';

      if (result['type'] == 'purchase') {
        role = 'seller';
      } else if (result['type'] == 'sale') {
        role = 'buyer';
      }
      //print(jsonEncode(participants));
      if (role.length > 0) {
        var participants = item['participants'];
        if (participants is List && participants.isNotEmpty) {
          if (participants.length > index) {
            for (var i = 0; i < participants.length; i++) {
              var participant = participants[i];
              if (participant['role'] == role) {
                obj.customer = participant['name'];
              }
            }
          }
        }
      }
    }
    obj.id = result['_id'];
    obj.measurementUnit = result['measurement_unit'];
    obj.shippingStartDate = result['shipping_start_date'];
    obj.shippingEndDate = result['shipping_end_date'];

    response.add(obj);
  }

  return response;
  // Add your function code here!
}
