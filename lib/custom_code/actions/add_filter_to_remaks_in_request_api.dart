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

Future<String> addFilterToRemaksInRequestApi(
  String search,
  String partitionKey,
  String title,
) async {
  // Add your function code here!

  Map<String, dynamic> filter;

  if (search.isNotEmpty) {
    filter = {
      "_partitionKey": partitionKey.toString(),
      "title": title.trim(),
      "value": {"\$regex": ".*" + search.trim(), "\$options": "i"}
    };
  } else {
    filter = {
      "_partitionKey": partitionKey.toString(),
      "title": title.trim(),
    };
  }
  return jsonEncode(filter);
}
