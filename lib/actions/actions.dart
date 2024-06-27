import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future getCommodities(BuildContext context) async {
  ApiCallResponse? commoditiesApiResult;

  commoditiesApiResult = await CRMCommodityGroup.commoditiesCall.call(
    partitionKey: FFAppState().partitionKey,
    authToken: currentAuthenticationToken,
  );

  if ((commoditiesApiResult?.succeeded ?? true)) {
    // UpdateCommoditiesInAppaState
    FFAppState().Commodities = (getJsonField(
      (commoditiesApiResult?.jsonBody ?? ''),
      r'''$.data''',
      true,
    )!
            .toList()
            .map<CommoditiesStruct?>(CommoditiesStruct.maybeFromMap)
            .toList() as Iterable<CommoditiesStruct?>)
        .withoutNulls
        .toList()
        .cast<CommoditiesStruct>();
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'SERVER NOT REACH',
          style: TextStyle(),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).error,
      ),
    );
  }
}

Future resetContractSale(BuildContext context) async {
  // CleanContractSaleSubObjects
  FFAppState().updateContractSaleDataStruct(
    (e) => e
      ..commodity = null
      ..participants = []
      ..priceSchedule = []
      ..logisticSchedule = []
      ..remarks = []
      ..notes = [],
  );
  // CleanContractSale
  FFAppState().ContractSaleData = ContractSalePurchaseSchemaStruct();
  FFAppState().ContractSaleMetadata = ContractSaleMetadataStruct();
  FFAppState().updateContractSaleMetadataStruct(
    (e) => e..idempotence = null,
  );
}

Future resetContractPurchase(BuildContext context) async {
  FFAppState().updateContractPurchaseStruct(
    (e) => e
      ..commodity = null
      ..participants = []
      ..priceSchedule = []
      ..logisticSchedule = []
      ..remarks = []
      ..notes = [],
  );
  FFAppState().updateContractPurchaseMetadataStruct(
    (e) => e..idempotence = null,
  );
  FFAppState().ContractPurchase = ContractSaleSchemaStruct();
  FFAppState().ContractPurchaseMetadata = ContractPurchaseMetadataStruct();
}
