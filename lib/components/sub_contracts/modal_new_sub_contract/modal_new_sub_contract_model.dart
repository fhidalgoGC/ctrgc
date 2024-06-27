import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'modal_new_sub_contract_widget.dart' show ModalNewSubContractWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalNewSubContractModel
    extends FlutterFlowModel<ModalNewSubContractWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for price_month widget.
  String? priceMonthValue;
  FormFieldController<String>? priceMonthValueController;
  // State field(s) for price_year widget.
  String? priceYearValue;
  FormFieldController<String>? priceYearValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
