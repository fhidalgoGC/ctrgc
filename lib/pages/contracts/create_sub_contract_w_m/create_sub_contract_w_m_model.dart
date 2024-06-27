import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/base/side_nav/side_nav_widget.dart';
import '/components/base/spinner/spinner_widget.dart';
import '/components/sub_contracts/sub_contract_summary/sub_contract_summary_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_sub_contract_w_m_widget.dart' show CreateSubContractWMWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateSubContractWMModel
    extends FlutterFlowModel<CreateSubContractWMWidget> {
  ///  Local state fields for this page.

  bool spinnerVisible = true;

  String? pricingType;

  double? inventoryOpen = 0.0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Contract Detail)] action in CreateSubContractWM widget.
  ApiCallResponse? contractDetailResult;
  // Stores action output result for [Backend Call - API (IdempotenceSubContract)] action in CreateSubContractWM widget.
  ApiCallResponse? subContractIdempotenceResult;
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for futures widget.
  FocusNode? futuresFocusNode;
  TextEditingController? futuresTextController;
  String? Function(BuildContext, String?)? futuresTextControllerValidator;
  // State field(s) for basisOperation widget.
  String? basisOperationValue;
  FormFieldController<String>? basisOperationValueController;
  // State field(s) for basis widget.
  FocusNode? basisFocusNode;
  TextEditingController? basisTextController;
  String? Function(BuildContext, String?)? basisTextControllerValidator;
  // State field(s) for total_price widget.
  FocusNode? totalPriceFocusNode;
  TextEditingController? totalPriceTextController;
  String? Function(BuildContext, String?)? totalPriceTextControllerValidator;
  // State field(s) for quantity widget.
  FocusNode? quantityFocusNode;
  TextEditingController? quantityTextController;
  String? Function(BuildContext, String?)? quantityTextControllerValidator;
  // State field(s) for type_unit widget.
  String? typeUnitValue;
  FormFieldController<String>? typeUnitValueController;
  // Model for spinner component.
  late SpinnerModel spinnerModel;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    spinnerModel = createModel(context, () => SpinnerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    futuresFocusNode?.dispose();
    futuresTextController?.dispose();

    basisFocusNode?.dispose();
    basisTextController?.dispose();

    totalPriceFocusNode?.dispose();
    totalPriceTextController?.dispose();

    quantityFocusNode?.dispose();
    quantityTextController?.dispose();

    spinnerModel.dispose();
  }
}
