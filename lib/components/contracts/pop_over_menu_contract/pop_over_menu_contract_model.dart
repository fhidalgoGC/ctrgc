import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pop_over_menu_contract_widget.dart' show PopOverMenuContractWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PopOverMenuContractModel
    extends FlutterFlowModel<PopOverMenuContractWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Contract Detail)] action in Row widget.
  ApiCallResponse? contractBodyResult;
  // Stores action output result for [Backend Call - API (InvoicePdf)] action in Row widget.
  ApiCallResponse? pdfResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
