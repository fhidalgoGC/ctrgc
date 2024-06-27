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
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_sub_contract_w_m_model.dart';
export 'create_sub_contract_w_m_model.dart';

class CreateSubContractWMWidget extends StatefulWidget {
  const CreateSubContractWMWidget({
    super.key,
    required this.contractIdParam,
    required this.typeContract,
  });

  final String? contractIdParam;
  final String? typeContract;

  @override
  State<CreateSubContractWMWidget> createState() =>
      _CreateSubContractWMWidgetState();
}

class _CreateSubContractWMWidgetState extends State<CreateSubContractWMWidget> {
  late CreateSubContractWMModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateSubContractWMModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().createSubContractState = CreateSubContractSchemaStruct();
      FFAppState().updateCreateSubContractStateStruct(
        (e) => e..priceSchedule = [],
      );
      _model.contractDetailResult =
          await ContractsGroup.contractDetailCall.call(
        contractId: widget.contractIdParam,
        partitionKey: FFAppState().partitionKey,
        authToken: currentAuthenticationToken,
      );

      if ((_model.contractDetailResult?.succeeded ?? true)) {
        _model.pricingType = getJsonField(
          (_model.contractDetailResult?.jsonBody ?? ''),
          r'''$.pricingType''',
        ).toString().toString();
        _model.inventoryOpen = getJsonField(
          (_model.contractDetailResult?.jsonBody ?? ''),
          r'''$.inventory.open''',
        );
        setState(() {});
        FFAppState().updateCreateSubContractStateStruct(
          (e) => e
            ..contractId = getJsonField(
              (_model.contractDetailResult?.jsonBody ?? ''),
              r'''$._id''',
            ).toString().toString()
            ..contractFolio = getJsonField(
              (_model.contractDetailResult?.jsonBody ?? ''),
              r'''$.folio''',
            ).toString().toString()
            ..createdById = FFAppState().UserSession.id
            ..createdByName =
                '${FFAppState().UserSession.firstName} ${FFAppState().UserSession.lastName}'
            ..measurementUnit = CtrMeasurementUnitEnum.bushel.name
            ..updatePriceSchedule(
              (e) => e.add(CtrPriceScheduleSchemaStruct(
                pricingType: _model.pricingType,
                basisOperation: getJsonField(
                  (_model.contractDetailResult?.jsonBody ?? ''),
                  r'''$.price_schedule[0].basis_operation''',
                ).toString().toString(),
                optionMonth: getJsonField(
                  (_model.contractDetailResult?.jsonBody ?? ''),
                  r'''$.price_schedule[0].option_month''',
                ).toString().toString(),
                optionYear: getJsonField(
                  (_model.contractDetailResult?.jsonBody ?? ''),
                  r'''$.price_schedule[0].option_year''',
                ),
                paymentCurrency: getJsonField(
                  (_model.contractDetailResult?.jsonBody ?? ''),
                  r'''$.price_schedule[0].payment_currency''',
                ).toString().toString(),
                exchange: getJsonField(
                  (_model.contractDetailResult?.jsonBody ?? ''),
                  r'''$.price_schedule[0].exchange''',
                ).toString().toString(),
                futurePrice: _model.pricingType == 'Basis'
                    ? 0.0
                    : getJsonField(
                        (_model.contractDetailResult?.jsonBody ?? ''),
                        r'''$.price_schedule[0].future_price''',
                      ),
                basis: getJsonField(
                  (_model.contractDetailResult?.jsonBody ?? ''),
                  r'''$.price_schedule[0].basis''',
                ),
                price: _model.pricingType == 'Basis'
                    ? 0.0
                    : functions.getTotalPriceSubContracts(
                        getJsonField(
                          (_model.contractDetailResult?.jsonBody ?? ''),
                          r'''$.price_schedule[0].future_price''',
                        ),
                        getJsonField(
                          (_model.contractDetailResult?.jsonBody ?? ''),
                          r'''$.price_schedule[0].basis''',
                        ),
                        getJsonField(
                          (_model.contractDetailResult?.jsonBody ?? ''),
                          r'''$.price_schedule[0].basis_operation''',
                        ).toString().toString(),
                        _model.pricingType),
              )),
            )
            ..totalPrice = FFAppConstants.zeroValue,
        );
        setState(() {
          _model.futuresTextController?.text = (_model.pricingType == 'Basis'
                  ? 0.0
                  : getJsonField(
                      (_model.contractDetailResult?.jsonBody ?? ''),
                      r'''$.price_schedule[0].future_price''',
                    ))
              .toString();
          _model.futuresTextController?.selection = TextSelection.collapsed(
              offset: _model.futuresTextController!.text.length);
        });
        setState(() {
          _model.basisOperationValueController?.value = getJsonField(
            (_model.contractDetailResult?.jsonBody ?? ''),
            r'''$.price_schedule[0].basis_operation''',
          ).toString().toString();
        });
        setState(() {
          _model.basisTextController?.text = valueOrDefault<String>(
            getJsonField(
              (_model.contractDetailResult?.jsonBody ?? ''),
              r'''$.price_schedule[0].basis''',
            )?.toString()?.toString(),
            '0',
          );
          _model.basisTextController?.selection = TextSelection.collapsed(
              offset: _model.basisTextController!.text.length);
        });
        setState(() {
          _model.typeUnitValueController?.value = getJsonField(
            (_model.contractDetailResult?.jsonBody ?? ''),
            r'''$.measurement_unit''',
          ).toString().toString();
        });
        setState(() {
          _model.totalPriceTextController?.text = getJsonField(
            FFAppState().createSubContractState.toMap(),
            r'''$.price_schedule[0].price''',
          ).toString().toString();
          _model.totalPriceTextController?.selection = TextSelection.collapsed(
              offset: _model.totalPriceTextController!.text.length);
        });
        if (FFAppState().subContractId != null &&
            FFAppState().subContractId != '') {
          _model.spinnerVisible = false;
        } else {
          _model.subContractIdempotenceResult =
              await ContractsGroup.idempotenceSubContractCall.call(
            partitionKey: FFAppState().partitionKey,
            authToken: currentAuthenticationToken,
          );

          if ((_model.subContractIdempotenceResult?.succeeded ?? true)) {
            FFAppState().subContractId = getJsonField(
              (_model.subContractIdempotenceResult?.jsonBody ?? ''),
              r'''$.data.key''',
            ).toString().toString();
            setState(() {});
            _model.spinnerVisible = false;
            return;
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Error getting subcontract idempotence',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).error,
              ),
            );
            _model.spinnerVisible = false;
            return;
          }
        }

        return;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error getting contract detail',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
        _model.spinnerVisible = false;
        return;
      }
    });

    _model.futuresTextController ??= TextEditingController();
    _model.futuresFocusNode ??= FocusNode();
    _model.futuresFocusNode!.addListener(() => setState(() {}));
    _model.basisTextController ??= TextEditingController();
    _model.basisFocusNode ??= FocusNode();
    _model.basisFocusNode!.addListener(() => setState(() {}));
    _model.totalPriceTextController ??= TextEditingController();
    _model.totalPriceFocusNode ??= FocusNode();
    _model.totalPriceFocusNode!.addListener(() => setState(() {}));
    _model.quantityTextController ??= TextEditingController();
    _model.quantityFocusNode ??= FocusNode();
    _model.quantityFocusNode!.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    final chartPieChartColorsList = [
      FlutterFlowTheme.of(context).alternate,
      Color(0xFF234AFF)
    ];
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.sideNavModel,
                    updateCallback: () => setState(() {}),
                    child: SideNavWidget(
                      selectedNav: (String varTypeContract) {
                        return varTypeContract == 'sale' ? true : false;
                      }(widget.typeContract!)
                          ? Pages.sale_contracts
                          : Pages.purchase_contracts,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      constraints: BoxConstraints(
                        minWidth: double.infinity,
                        maxWidth: double.infinity,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                valueOrDefault<double>(
                                  () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return functions.containerParentPadding(
                                          MediaQuery.sizeOf(context).width);
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return functions.containerParentPadding(
                                          MediaQuery.sizeOf(context).width);
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return functions.containerParentPadding(
                                          MediaQuery.sizeOf(context).width);
                                    } else {
                                      return functions.containerParentPadding(
                                          MediaQuery.sizeOf(context).width);
                                    }
                                  }(),
                                  0.0,
                                ),
                                10.0,
                                valueOrDefault<double>(
                                  () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return functions.containerParentPadding(
                                          MediaQuery.sizeOf(context).width);
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return functions.containerParentPadding(
                                          MediaQuery.sizeOf(context).width);
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return functions.containerParentPadding(
                                          MediaQuery.sizeOf(context).width);
                                    } else {
                                      return functions.containerParentPadding(
                                          MediaQuery.sizeOf(context).width);
                                    }
                                  }(),
                                  0.0,
                                ),
                                10.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 11.42,
                              height: double.infinity,
                              constraints: BoxConstraints(
                                minHeight: double.infinity,
                                maxHeight: double.infinity,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: Container(
                                        width: functions.containerBodyWidthRv(
                                            MediaQuery.sizeOf(context).width),
                                        constraints: BoxConstraints(
                                          minWidth: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            } else {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            }
                                          }(),
                                          minHeight: 60.0,
                                          maxWidth: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            } else {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            }
                                          }(),
                                        ),
                                        decoration: BoxDecoration(),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 24.0, 0.0, 8.0),
                                            child: Text(
                                              'New Sub-Contract',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: Container(
                                        width: functions.containerBodyWidthRv(
                                            MediaQuery.sizeOf(context).width),
                                        constraints: BoxConstraints(
                                          minWidth: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            } else {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            }
                                          }(),
                                          maxWidth: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            } else {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            }
                                          }(),
                                          maxHeight: double.infinity,
                                        ),
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Container(
                                              width: 100.0,
                                              height: 24.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 24.0,
                                                                0.0, 8.0),
                                                    child: Text(
                                                      'Contract Number #',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 24.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 24.0,
                                                                0.0, 8.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        getJsonField(
                                                          (_model.contractDetailResult
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.folio''',
                                                        )?.toString(),
                                                        '-',
                                                      ),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 24.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w900,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 58.0,
                                                    height: 35.0,
                                                    decoration: BoxDecoration(
                                                      color: colorFromCssString(
                                                        getJsonField(
                                                          (_model.contractDetailResult
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.pricingColorType''',
                                                        ).toString(),
                                                        defaultColor:
                                                            Color(0xFFB8EBF3),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                6.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                6.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                6.0),
                                                        topRight:
                                                            Radius.circular(
                                                                6.0),
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      getJsonField(
                                                        (_model.contractDetailResult
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.pricingType''',
                                                      ).toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 24.0, 0.0, 8.0),
                                                child: Text(
                                                  'Below are the details of your contract.',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 1201.0,
                                              constraints: BoxConstraints(
                                                minWidth: double.infinity,
                                                maxWidth: double.infinity,
                                                maxHeight: double.infinity,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Wrap(
                                                spacing: 0.0,
                                                runSpacing: 24.0,
                                                alignment:
                                                    WrapAlignment.spaceBetween,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Container(
                                                    width: 551.0,
                                                    constraints: BoxConstraints(
                                                      minWidth: functions.containerControlWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width,
                                                          functions.containerBodyWidthRv(
                                                              MediaQuery.sizeOf(
                                                                      context)
                                                                  .width))!,
                                                      maxWidth: functions.containerControlWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width,
                                                          functions.containerBodyWidthRv(
                                                              MediaQuery.sizeOf(
                                                                      context)
                                                                  .width))!,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0),
                                                      child: Card(
                                                        clipBehavior: Clip
                                                            .antiAliasWithSaveLayer,
                                                        color:
                                                            Color(0xFFE5E5E5),
                                                        elevation: 4.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  15.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Wrap(
                                                                spacing: 0.0,
                                                                runSpacing:
                                                                    17.0,
                                                                alignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    WrapCrossAlignment
                                                                        .start,
                                                                direction: Axis
                                                                    .horizontal,
                                                                runAlignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                verticalDirection:
                                                                    VerticalDirection
                                                                        .down,
                                                                clipBehavior:
                                                                    Clip.none,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        'Purchased Price Contract',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              fontSize: 20.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              lineHeight: 2.0,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Contract Date:',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          getJsonField(
                                                                            (_model.contractDetailResult?.jsonBody ??
                                                                                ''),
                                                                            r'''$.contractDate''',
                                                                          )?.toString(),
                                                                          '-',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Customer Number:',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          getJsonField(
                                                                            (_model.contractDetailResult?.jsonBody ??
                                                                                ''),
                                                                            r'''$.customerNumber''',
                                                                          )?.toString(),
                                                                          '-',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'ID Contract',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        '#${valueOrDefault<String>(
                                                                          getJsonField(
                                                                            (_model.contractDetailResult?.jsonBody ??
                                                                                ''),
                                                                            r'''$._id''',
                                                                          )?.toString(),
                                                                          '-',
                                                                        )}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Reference Number:',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          getJsonField(
                                                                            (_model.contractDetailResult?.jsonBody ??
                                                                                ''),
                                                                            r'''$.referenceNumber''',
                                                                          )?.toString(),
                                                                          '-',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                width: 600.0,
                                                                child: Divider(
                                                                  height: 56.0,
                                                                  thickness:
                                                                      1.0,
                                                                ),
                                                              ),
                                                              Wrap(
                                                                spacing: 0.0,
                                                                runSpacing:
                                                                    17.0,
                                                                alignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    WrapCrossAlignment
                                                                        .start,
                                                                direction: Axis
                                                                    .horizontal,
                                                                runAlignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                verticalDirection:
                                                                    VerticalDirection
                                                                        .down,
                                                                clipBehavior:
                                                                    Clip.none,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        596.0,
                                                                    height:
                                                                        25.0,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      'General Information',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            fontSize:
                                                                                20.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Commodity:',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          getJsonField(
                                                                            (_model.contractDetailResult?.jsonBody ??
                                                                                ''),
                                                                            r'''$.commodity.name''',
                                                                          )?.toString(),
                                                                          '-',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            'Quantity / Units:',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  getJsonField(
                                                                                    (_model.contractDetailResult?.jsonBody ?? ''),
                                                                                    r'''$.quantityUnits''',
                                                                                  )?.toString(),
                                                                                  '-',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: Color(0xFF27A51F),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Price:',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          getJsonField(
                                                                            (_model.contractDetailResult?.jsonBody ??
                                                                                ''),
                                                                            r'''$.contractPrice''',
                                                                          )?.toString(),
                                                                          '-',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: Color(0xFF14840D),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Basis:',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        '${valueOrDefault<String>(
                                                                          getJsonField(
                                                                            (_model.contractDetailResult?.jsonBody ??
                                                                                ''),
                                                                            r'''$.contractBasis''',
                                                                          )?.toString(),
                                                                          '-',
                                                                        )}  ${getJsonField(
                                                                          (_model.contractDetailResult?.jsonBody ??
                                                                              ''),
                                                                          r'''$.price_schedule[0].option_month''',
                                                                        ).toString()}${getJsonField(
                                                                          (_model.contractDetailResult?.jsonBody ??
                                                                              ''),
                                                                          r'''$.price_schedule[0].option_year''',
                                                                        ).toString()}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: Color(0xFF234AFF),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Contact:',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          getJsonField(
                                                                            (_model.contractDetailResult?.jsonBody ??
                                                                                ''),
                                                                            r'''$.contact''',
                                                                          )?.toString(),
                                                                          '-',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            'Shipment Period:',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  getJsonField(
                                                                                    (_model.contractDetailResult?.jsonBody ?? ''),
                                                                                    r'''$.shipmentPeriod''',
                                                                                  )?.toString(),
                                                                                  '-',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 5.0)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        '',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                              lineHeight: 1.0,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 551.0,
                                                    constraints: BoxConstraints(
                                                      minWidth: functions.containerControlWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width,
                                                          functions.containerBodyWidthRv(
                                                              MediaQuery.sizeOf(
                                                                      context)
                                                                  .width))!,
                                                      maxWidth: functions.containerControlWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width,
                                                          functions.containerBodyWidthRv(
                                                              MediaQuery.sizeOf(
                                                                      context)
                                                                  .width))!,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Card(
                                                        clipBehavior: Clip
                                                            .antiAliasWithSaveLayer,
                                                        elevation: 4.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Wrap(
                                                                spacing: 0.0,
                                                                runSpacing:
                                                                    15.0,
                                                                alignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    WrapCrossAlignment
                                                                        .start,
                                                                direction: Axis
                                                                    .horizontal,
                                                                runAlignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                verticalDirection:
                                                                    VerticalDirection
                                                                        .down,
                                                                clipBehavior:
                                                                    Clip.none,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        'Quantity Actual Overview',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              fontSize: 20.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          if (_model.inventoryOpen! >
                                                                              FFAppConstants.zeroValue)
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Container(
                                                                                width: 174.0,
                                                                                height: 168.0,
                                                                                child: FlutterFlowPieChart(
                                                                                  data: FFPieChartData(
                                                                                    values: functions.getChartSubContract(
                                                                                        valueOrDefault<double>(
                                                                                          getJsonField(
                                                                                            (_model.contractDetailResult?.jsonBody ?? ''),
                                                                                            r'''$.inventory.total''',
                                                                                          ),
                                                                                          0.0,
                                                                                        ),
                                                                                        valueOrDefault<double>(
                                                                                          getJsonField(
                                                                                            (_model.contractDetailResult?.jsonBody ?? ''),
                                                                                            r'''$.inventory.fixed''',
                                                                                          ),
                                                                                          0.0,
                                                                                        ),
                                                                                        valueOrDefault<double>(
                                                                                          double.tryParse(_model.quantityTextController.text),
                                                                                          0.0,
                                                                                        )),
                                                                                    colors: chartPieChartColorsList,
                                                                                    radius: [50.0],
                                                                                    borderColor: [
                                                                                      Color(0x00000000)
                                                                                    ],
                                                                                  ),
                                                                                  donutHoleRadius: 30.0,
                                                                                  donutHoleColor: Colors.transparent,
                                                                                  sectionLabelStyle: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if ((_model.inventoryOpen == FFAppConstants.zeroValue) ||
                                                                              (_model.inventoryOpen! < FFAppConstants.zeroValue))
                                                                            Container(
                                                                              width: 1.0,
                                                                              height: 168.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Icon(
                                                                                Icons.circle,
                                                                                color: Color(0xFFE0E3E7),
                                                                                size: 15.0,
                                                                              ),
                                                                              Text(
                                                                                'Contract  #',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: Color(0xFF3E3D4A),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  getJsonField(
                                                                                    (_model.contractDetailResult?.jsonBody ?? ''),
                                                                                    r'''$.folio''',
                                                                                  )?.toString(),
                                                                                  '-',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Inter',
                                                                                      color: Color(0xFF3E3D4A),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  'Inventory open: ${functions.getFormatNumber(getJsonField(
                                                                                        (_model.contractDetailResult?.jsonBody ?? ''),
                                                                                        r'''$.inventory.open''',
                                                                                      ) == null ? 0.0 : getJsonField(
                                                                                      (_model.contractDetailResult?.jsonBody ?? ''),
                                                                                      r'''$.inventory.open''',
                                                                                    ))}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        '${getJsonField(
                                                                          (_model.contractDetailResult?.jsonBody ??
                                                                              ''),
                                                                          r'''$.commodity.name''',
                                                                        ).toString()} ${getJsonField(
                                                                          (_model.contractDetailResult?.jsonBody ??
                                                                              ''),
                                                                          r'''$.price_schedule[0].option_month''',
                                                                        ).toString()} ${getJsonField(
                                                                          (_model.contractDetailResult?.jsonBody ??
                                                                              ''),
                                                                          r'''$.price_schedule[0].option_year''',
                                                                        ).toString()}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w900,
                                                                              lineHeight: 2.0,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.futuresTextController,
                                                                          focusNode:
                                                                              _model.futuresFocusNode,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.futuresTextController',
                                                                            Duration(milliseconds: 2000),
                                                                            () async {
                                                                              if (_model.futuresTextController.text == null || _model.futuresTextController.text == '') {
                                                                                setState(() {
                                                                                  _model.futuresTextController?.text = '0';
                                                                                  _model.futuresTextController?.selection = TextSelection.collapsed(offset: _model.futuresTextController!.text.length);
                                                                                });
                                                                              }
                                                                              FFAppState().updateCreateSubContractStateStruct(
                                                                                (e) => e
                                                                                  ..updatePriceSchedule(
                                                                                    (e) => e[0]
                                                                                      ..futurePrice = double.tryParse(_model.futuresTextController.text)
                                                                                      ..price = functions.getTotalPriceSubContracts(double.tryParse(_model.futuresTextController.text), double.tryParse(_model.basisTextController.text), _model.basisOperationValue, _model.pricingType),
                                                                                  ),
                                                                              );
                                                                              setState(() {});
                                                                              setState(() {
                                                                                _model.totalPriceTextController?.text = getJsonField(
                                                                                  FFAppState().createSubContractState.toMap(),
                                                                                  r'''$.price_schedule[0].price''',
                                                                                ).toString();
                                                                                _model.totalPriceTextController?.selection = TextSelection.collapsed(offset: _model.totalPriceTextController!.text.length);
                                                                              });
                                                                            },
                                                                          ),
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'Futures',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            suffixIcon: _model.futuresTextController!.text.isNotEmpty
                                                                                ? InkWell(
                                                                                    onTap: () async {
                                                                                      _model.futuresTextController?.clear();
                                                                                      if (_model.futuresTextController.text == null || _model.futuresTextController.text == '') {
                                                                                        setState(() {
                                                                                          _model.futuresTextController?.text = '0';
                                                                                          _model.futuresTextController?.selection = TextSelection.collapsed(offset: _model.futuresTextController!.text.length);
                                                                                        });
                                                                                      }
                                                                                      FFAppState().updateCreateSubContractStateStruct(
                                                                                        (e) => e
                                                                                          ..updatePriceSchedule(
                                                                                            (e) => e[0]
                                                                                              ..futurePrice = double.tryParse(_model.futuresTextController.text)
                                                                                              ..price = functions.getTotalPriceSubContracts(double.tryParse(_model.futuresTextController.text), double.tryParse(_model.basisTextController.text), _model.basisOperationValue, _model.pricingType),
                                                                                          ),
                                                                                      );
                                                                                      setState(() {});
                                                                                      setState(() {
                                                                                        _model.totalPriceTextController?.text = getJsonField(
                                                                                          FFAppState().createSubContractState.toMap(),
                                                                                          r'''$.price_schedule[0].price''',
                                                                                        ).toString();
                                                                                        _model.totalPriceTextController?.selection = TextSelection.collapsed(offset: _model.totalPriceTextController!.text.length);
                                                                                      });
                                                                                      setState(() {});
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.clear,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  )
                                                                                : null,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          keyboardType: const TextInputType
                                                                              .numberWithOptions(
                                                                              decimal: true),
                                                                          validator: _model
                                                                              .futuresTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child: FlutterFlowDropDown<
                                                                            String>(
                                                                          controller: _model.basisOperationValueController ??=
                                                                              FormFieldController<String>(
                                                                            _model.basisOperationValue ??=
                                                                                getJsonField(
                                                                              (_model.contractDetailResult?.jsonBody ?? ''),
                                                                              r'''$.price_schedule[0].basis_operation''',
                                                                            ).toString(),
                                                                          ),
                                                                          options:
                                                                              List<String>.from([
                                                                            'add',
                                                                            'substract'
                                                                          ]),
                                                                          optionLabels: [
                                                                            'add',
                                                                            'substract'
                                                                          ],
                                                                          onChanged:
                                                                              (val) async {
                                                                            setState(() =>
                                                                                _model.basisOperationValue = val);
                                                                            FFAppState().updateCreateSubContractStateStruct(
                                                                              (e) => e
                                                                                ..updatePriceSchedule(
                                                                                  (e) => e[0]
                                                                                    ..basisOperation = _model.basisOperationValue
                                                                                    ..price = functions.getTotalPriceSubContracts(
                                                                                        getJsonField(
                                                                                          FFAppState().createSubContractState.toMap(),
                                                                                          r'''$.price_schedule[0].future_price''',
                                                                                        ),
                                                                                        getJsonField(
                                                                                          FFAppState().createSubContractState.toMap(),
                                                                                          r'''$.price_schedule[0].basis''',
                                                                                        ),
                                                                                        getJsonField(
                                                                                          FFAppState().createSubContractState.toMap(),
                                                                                          r'''$.price_schedule[0].basis_operation''',
                                                                                        ).toString(),
                                                                                        _model.pricingType),
                                                                                ),
                                                                            );
                                                                            setState(() {});
                                                                            setState(() {
                                                                              _model.totalPriceTextController?.text = getJsonField(
                                                                                FFAppState().createSubContractState.toMap(),
                                                                                r'''$.price_schedule[0].price''',
                                                                              ).toString();
                                                                              _model.totalPriceTextController?.selection = TextSelection.collapsed(offset: _model.totalPriceTextController!.text.length);
                                                                            });
                                                                          },
                                                                          width:
                                                                              98.0,
                                                                          height:
                                                                              49.0,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          icon:
                                                                              Icon(
                                                                            Icons.keyboard_arrow_down_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          elevation:
                                                                              2.0,
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          borderWidth:
                                                                              2.0,
                                                                          borderRadius:
                                                                              8.0,
                                                                          margin: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              4.0,
                                                                              16.0,
                                                                              4.0),
                                                                          hidesUnderline:
                                                                              true,
                                                                          isOverButton:
                                                                              true,
                                                                          isSearchable:
                                                                              false,
                                                                          isMultiSelect:
                                                                              false,
                                                                          labelText:
                                                                              '',
                                                                          labelTextStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 0.07,
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                _model.basisTextController,
                                                                            focusNode:
                                                                                _model.basisFocusNode,
                                                                            onChanged: (_) =>
                                                                                EasyDebounce.debounce(
                                                                              '_model.basisTextController',
                                                                              Duration(milliseconds: 2000),
                                                                              () async {
                                                                                if (_model.basisTextController.text == null || _model.basisTextController.text == '') {
                                                                                  setState(() {
                                                                                    _model.basisTextController?.text = '0';
                                                                                    _model.basisTextController?.selection = TextSelection.collapsed(offset: _model.basisTextController!.text.length);
                                                                                  });
                                                                                }
                                                                                FFAppState().updateCreateSubContractStateStruct(
                                                                                  (e) => e
                                                                                    ..updatePriceSchedule(
                                                                                      (e) => e[0]
                                                                                        ..basis = double.tryParse(_model.basisTextController.text)
                                                                                        ..price = functions.getTotalPriceSubContracts(double.tryParse(_model.futuresTextController.text), double.tryParse(_model.basisTextController.text), _model.basisOperationValue, _model.pricingType),
                                                                                    ),
                                                                                );
                                                                                setState(() {});
                                                                                setState(() {
                                                                                  _model.totalPriceTextController?.text = getJsonField(
                                                                                    FFAppState().createSubContractState.toMap(),
                                                                                    r'''$.price_schedule[0].price''',
                                                                                  ).toString();
                                                                                  _model.totalPriceTextController?.selection = TextSelection.collapsed(offset: _model.totalPriceTextController!.text.length);
                                                                                });
                                                                              },
                                                                            ),
                                                                            autofocus:
                                                                                true,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              labelText: 'Basis',
                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                              enabledBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  width: 2.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  width: 2.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              errorBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  width: 2.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                borderSide: BorderSide(
                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                  width: 2.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              suffixIcon: _model.basisTextController!.text.isNotEmpty
                                                                                  ? InkWell(
                                                                                      onTap: () async {
                                                                                        _model.basisTextController?.clear();
                                                                                        if (_model.basisTextController.text == null || _model.basisTextController.text == '') {
                                                                                          setState(() {
                                                                                            _model.basisTextController?.text = '0';
                                                                                            _model.basisTextController?.selection = TextSelection.collapsed(offset: _model.basisTextController!.text.length);
                                                                                          });
                                                                                        }
                                                                                        FFAppState().updateCreateSubContractStateStruct(
                                                                                          (e) => e
                                                                                            ..updatePriceSchedule(
                                                                                              (e) => e[0]
                                                                                                ..basis = double.tryParse(_model.basisTextController.text)
                                                                                                ..price = functions.getTotalPriceSubContracts(double.tryParse(_model.futuresTextController.text), double.tryParse(_model.basisTextController.text), _model.basisOperationValue, _model.pricingType),
                                                                                            ),
                                                                                        );
                                                                                        setState(() {});
                                                                                        setState(() {
                                                                                          _model.totalPriceTextController?.text = getJsonField(
                                                                                            FFAppState().createSubContractState.toMap(),
                                                                                            r'''$.price_schedule[0].price''',
                                                                                          ).toString();
                                                                                          _model.totalPriceTextController?.selection = TextSelection.collapsed(offset: _model.totalPriceTextController!.text.length);
                                                                                        });
                                                                                        setState(() {});
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.clear,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    )
                                                                                  : null,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            keyboardType:
                                                                                const TextInputType.numberWithOptions(signed: true, decimal: true),
                                                                            validator:
                                                                                _model.basisTextControllerValidator.asValidator(context),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            15.0)),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        'Total',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w900,
                                                                              lineHeight: 2.0,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.totalPriceTextController,
                                                                          focusNode:
                                                                              _model.totalPriceFocusNode,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.totalPriceTextController',
                                                                            Duration(milliseconds: 2000),
                                                                            () async {
                                                                              FFAppState().updateCreateSubContractStateStruct(
                                                                                (e) => e
                                                                                  ..updatePriceSchedule(
                                                                                    (e) => e[0]
                                                                                      ..futurePrice = double.tryParse(_model.totalPriceTextController.text)
                                                                                      ..basis = FFAppConstants.zeroValue,
                                                                                  ),
                                                                              );
                                                                              setState(() {});
                                                                              setState(() {
                                                                                _model.futuresTextController?.text = _model.totalPriceTextController.text;
                                                                                _model.futuresTextController?.selection = TextSelection.collapsed(offset: _model.futuresTextController!.text.length);
                                                                              });
                                                                              setState(() {
                                                                                _model.basisTextController?.text = FFAppConstants.zeroValue.toString();
                                                                                _model.basisTextController?.selection = TextSelection.collapsed(offset: _model.basisTextController!.text.length);
                                                                              });
                                                                            },
                                                                          ),
                                                                          autofocus:
                                                                              true,
                                                                          textInputAction:
                                                                              TextInputAction.done,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            alignLabelWithHint:
                                                                                false,
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            suffixIcon: _model.totalPriceTextController!.text.isNotEmpty
                                                                                ? InkWell(
                                                                                    onTap: () async {
                                                                                      _model.totalPriceTextController?.clear();
                                                                                      FFAppState().updateCreateSubContractStateStruct(
                                                                                        (e) => e
                                                                                          ..updatePriceSchedule(
                                                                                            (e) => e[0]
                                                                                              ..futurePrice = double.tryParse(_model.totalPriceTextController.text)
                                                                                              ..basis = FFAppConstants.zeroValue,
                                                                                          ),
                                                                                      );
                                                                                      setState(() {});
                                                                                      setState(() {
                                                                                        _model.futuresTextController?.text = _model.totalPriceTextController.text;
                                                                                        _model.futuresTextController?.selection = TextSelection.collapsed(offset: _model.futuresTextController!.text.length);
                                                                                      });
                                                                                      setState(() {
                                                                                        _model.basisTextController?.text = FFAppConstants.zeroValue.toString();
                                                                                        _model.basisTextController?.selection = TextSelection.collapsed(offset: _model.basisTextController!.text.length);
                                                                                      });
                                                                                      setState(() {});
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.clear,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  )
                                                                                : null,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          keyboardType: const TextInputType
                                                                              .numberWithOptions(
                                                                              decimal: true),
                                                                          validator: _model
                                                                              .totalPriceTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              _model.quantityTextController,
                                                                          focusNode:
                                                                              _model.quantityFocusNode,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.quantityTextController',
                                                                            Duration(milliseconds: 2000),
                                                                            () async {
                                                                              FFAppState().updateCreateSubContractStateStruct(
                                                                                (e) => e..quantity = int.tryParse(_model.quantityTextController.text),
                                                                              );
                                                                              setState(() {});
                                                                            },
                                                                          ),
                                                                          autofocus:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'Quantity',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            suffixIcon: _model.quantityTextController!.text.isNotEmpty
                                                                                ? InkWell(
                                                                                    onTap: () async {
                                                                                      _model.quantityTextController?.clear();
                                                                                      FFAppState().updateCreateSubContractStateStruct(
                                                                                        (e) => e..quantity = int.tryParse(_model.quantityTextController.text),
                                                                                      );
                                                                                      setState(() {});
                                                                                      setState(() {});
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.clear,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  )
                                                                                : null,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          keyboardType: const TextInputType
                                                                              .numberWithOptions(
                                                                              decimal: true),
                                                                          validator: _model
                                                                              .quantityTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child: FlutterFlowDropDown<
                                                                            String>(
                                                                          controller: _model.typeUnitValueController ??=
                                                                              FormFieldController<String>(
                                                                            _model.typeUnitValue ??=
                                                                                getJsonField(
                                                                              (_model.contractDetailResult?.jsonBody ?? ''),
                                                                              r'''$.measurement_unit''',
                                                                            ).toString(),
                                                                          ),
                                                                          options:
                                                                              List<String>.from([
                                                                            'bushel',
                                                                            'mt',
                                                                            'cwt'
                                                                          ]),
                                                                          optionLabels: [
                                                                            'bushel',
                                                                            'mt',
                                                                            'cwt'
                                                                          ],
                                                                          onChanged:
                                                                              (val) async {
                                                                            setState(() =>
                                                                                _model.typeUnitValue = val);
                                                                            FFAppState().updateCreateSubContractStateStruct(
                                                                              (e) => e..measurementUnit = _model.typeUnitValue,
                                                                            );
                                                                            setState(() {});
                                                                          },
                                                                          width:
                                                                              98.0,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          hintText:
                                                                              'Unit',
                                                                          icon:
                                                                              Icon(
                                                                            Icons.keyboard_arrow_down_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          elevation:
                                                                              2.0,
                                                                          borderColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          borderWidth:
                                                                              2.0,
                                                                          borderRadius:
                                                                              8.0,
                                                                          margin: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              1.0,
                                                                              16.0,
                                                                              1.0),
                                                                          hidesUnderline:
                                                                              true,
                                                                          isOverButton:
                                                                              true,
                                                                          isSearchable:
                                                                              false,
                                                                          isMultiSelect:
                                                                              false,
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            15.0)),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: Container(
                                        width: functions.containerBodyWidthRv(
                                            MediaQuery.sizeOf(context).width),
                                        height: 100.0,
                                        constraints: BoxConstraints(
                                          minWidth: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            } else {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            }
                                          }(),
                                          minHeight: 60.0,
                                          maxWidth: () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            } else {
                                              return functions
                                                  .containerBodyWidthRv(
                                                      MediaQuery.sizeOf(context)
                                                          .width);
                                            }
                                          }(),
                                        ),
                                        decoration: BoxDecoration(),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 20.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 24.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      FFAppState()
                                                              .createSubContractState =
                                                          CreateSubContractSchemaStruct();
                                                      FFAppState()
                                                          .subContractId = '';
                                                      setState(() {});
                                                      context.pop();
                                                    },
                                                    text: 'Cancel',
                                                    options: FFButtonOptions(
                                                      width: 100.0,
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0xB6FF0010),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                                Builder(
                                                  builder: (context) =>
                                                      FFButtonWidget(
                                                    onPressed: ((_model
                                                                        .futuresTextController.text ==
                                                                    null ||
                                                                _model.futuresTextController.text ==
                                                                    '') ||
                                                            (_model.basisTextController.text ==
                                                                    null ||
                                                                _model
                                                                        .basisTextController.text ==
                                                                    '') ||
                                                            (_model.quantityTextController
                                                                        .text ==
                                                                    null ||
                                                                _model
                                                                        .quantityTextController
                                                                        .text ==
                                                                    '') ||
                                                            (_model.futuresTextController
                                                                    .text ==
                                                                '') ||
                                                            (_model.basisTextController
                                                                    .text ==
                                                                '') ||
                                                            (_model.quantityTextController
                                                                    .text ==
                                                                ''))
                                                        ? null
                                                        : () async {
                                                            FFAppState()
                                                                .updateCreateSubContractStateStruct(
                                                              (e) => e
                                                                ..totalPrice =
                                                                    valueOrDefault<
                                                                        double>(
                                                                  double.parse((double.parse(_model
                                                                              .quantityTextController
                                                                              .text) *
                                                                          FFAppState()
                                                                              .createSubContractState
                                                                              .priceSchedule
                                                                              .first
                                                                              .futurePrice)
                                                                      .toStringAsFixed(
                                                                          2)),
                                                                  0.0,
                                                                )
                                                                ..updatePriceSchedule(
                                                                  (e) => e[0]
                                                                    ..price = functions.getTotalPriceSubContracts(
                                                                        double.tryParse(_model
                                                                            .futuresTextController
                                                                            .text),
                                                                        double.tryParse(_model
                                                                            .basisTextController
                                                                            .text),
                                                                        _model
                                                                            .basisOperationValue,
                                                                        _model
                                                                            .pricingType)
                                                                    ..basisOperation =
                                                                        _model
                                                                            .basisOperationValue
                                                                    ..basis = double
                                                                        .tryParse(_model
                                                                            .basisTextController
                                                                            .text),
                                                                )
                                                                ..quantity = int
                                                                    .tryParse(_model
                                                                        .quantityTextController
                                                                        .text)
                                                                ..measurementUnit =
                                                                    _model
                                                                        .typeUnitValue,
                                                            );
                                                            setState(() {});
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () => _model
                                                                            .unfocusNode
                                                                            .canRequestFocus
                                                                        ? FocusScope.of(context).requestFocus(_model
                                                                            .unfocusNode)
                                                                        : FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        SubContractSummaryWidget(
                                                                      contractIdParam:
                                                                          widget
                                                                              .contractIdParam!,
                                                                      contractDetailResult:
                                                                          (_model.contractDetailResult?.jsonBody ??
                                                                              ''),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          },
                                                    text:
                                                        'Create Sub - Contract',
                                                    options: FFButtonOptions(
                                                      width: 185.0,
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      disabledColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (_model.spinnerVisible)
                wrapWithModel(
                  model: _model.spinnerModel,
                  updateCallback: () => setState(() {}),
                  child: SpinnerWidget(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
