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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
Future<String> queryToGetContractListMobile(String search, String type) async {
  Map<String, dynamic> filter;

  filter = {
    "type": type.toString(),
    "\$or": [
      {
        "folio": {"\$regex": ".*" + search, "\$options": "i"}
      },
      {
        "commodity.name": {"\$regex": ".*" + search, "\$options": "i"}
      },
      {
        "participants.name": {"\$regex": ".*" + search, "\$options": "i"}
      },
      {
        "price_schedule.pricing_type": {
          "\$regex": ".*" + search,
          "\$options": "i"
        }
      }
    ]
  };
  return jsonEncode(filter);
}
