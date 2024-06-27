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

Future<List<PeopleStruct>> parseListPeople(List<dynamic> responseApi) async {
  // Add your function code here!
  List<PeopleStruct> response = [];

  for (var item in responseApi) {
    PeopleStruct obj = new PeopleStruct();
    obj.id = item['_id'];
    obj.fullName = item['full_name'];
    var emails = item['emails'];
    if (emails is List && emails.isNotEmpty) {
      var firstEmail = emails[0];
      obj.email = firstEmail['value'];
    }
    var phones = item['phones'];
    if (phones is List && phones.isNotEmpty) {
      var firstPhone = phones[0];
      obj.phoneNumber = firstPhone['phone_number'];
    }
    response.add(obj);
  }

  return response;
}
