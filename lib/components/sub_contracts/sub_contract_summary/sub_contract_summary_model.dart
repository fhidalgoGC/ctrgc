import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'sub_contract_summary_widget.dart' show SubContractSummaryWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class SubContractSummaryModel
    extends FlutterFlowModel<SubContractSummaryWidget> {
  ///  Local state fields for this component.

  String? pricingType;

  int? subContracts = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (SubContracts)] action in SubContractSummary widget.
  ApiCallResponse? subContractsResult;
  // Stores action output result for [Backend Call - API (CreateSubContract)] action in Button widget.
  ApiCallResponse? createSubContractResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
