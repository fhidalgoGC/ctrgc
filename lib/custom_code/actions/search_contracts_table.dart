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

Future<List<ContractsStruct>> searchContractsTable(
  List<ContractsStruct> listToSearch,
  String textToSearch,
) async {
  List<ContractsStruct> matchingContract = [];

  // Convertir el texto de búsqueda a minúsculas para una comparación sin distinción entre mayúsculas y minúsculas
  String searchLower = textToSearch.toLowerCase();

  // Dividir el texto de búsqueda en palabras individuales
  List<String> searchWords = searchLower.split(' ');

  // Iterar sobre cada persona en la lista de personas
  for (var item in listToSearch) {
    // Convertir los atributos de la persona a minúsculas para comparación
    String folio = item.folio.toLowerCase();
    String priceType = item.priceType.toLowerCase();
    String custumerName = item.customer.toLowerCase();
    String commodityName = item.commodityName.toLowerCase();

    // Verificar si alguna de las palabras de búsqueda está presente en alguno de los atributos de la persona
    bool matchFound = false;
    for (var word in searchWords) {
      if (folio.contains(word) ||
          priceType.contains(word) ||
          custumerName.contains(word) ||
          commodityName.contains(word)) {
        matchFound = true;
        break; // Si se encuentra una coincidencia, salir del bucle interno
      }
    }

    // Si se encontró coincidencia con al menos una palabra de búsqueda, agregar esta persona a la lista de coincidencias
    if (matchFound) {
      matchingContract.add(item);
    }
  }

  return matchingContract;
  // Add your function code here!
}
