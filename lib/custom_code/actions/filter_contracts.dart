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

Future<List<ContractsStruct>> filterContracts(
    List<ContractsStruct> listToSearch,
    String? commodityId,
    String? priceType,
    String? searchText) async {
  List<ContractsStruct> filteredList = [];
  print("============");
  printJson({searchText});
  for (ContractsStruct contract in listToSearch) {
    if (commodityId != null && contract.commodityId != commodityId) {
      continue;
    }

    if (priceType != null && contract.priceType != priceType) {
      continue;
    }

    filteredList.add(contract);
  }
  if (filteredList.length == 0) {
    filteredList = listToSearch;
  }

  if (searchText != null && searchText.length > 0) {
    filteredList = filteredList
        .where((contract) =>
            contract.customer
                .toLowerCase()
                .contains(searchText.toLowerCase()) ||
            contract.folio.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }
  return filteredList;
}
