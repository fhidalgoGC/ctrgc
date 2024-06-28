import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/base/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'detail_contract_w_m_model.dart';
export 'detail_contract_w_m_model.dart';

class DetailContractWMWidget extends StatefulWidget {
  const DetailContractWMWidget({
    super.key,
    String? contractIdParam,
  }) : this.contractIdParam = contractIdParam ?? '6646413a17b0191018296d37';

  final String contractIdParam;

  @override
  State<DetailContractWMWidget> createState() => _DetailContractWMWidgetState();
}

class _DetailContractWMWidgetState extends State<DetailContractWMWidget>
    with TickerProviderStateMixin {
  late DetailContractWMModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailContractWMModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 100.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
      Color(0xFFC3C6C9),
      Color(0xFF13BDD6),
      Color(0xFFFF1FCB),
      Color(0xFF8900FF),
      Color(0xFF28A51E),
      Color(0xFF1EEBC1),
      Color(0xFF224AFF),
      Color(0xFFF25605),
      Color(0xFFBE72FF),
      Color(0xFFF59B09),
      Color(0xFF2692FF)
    ];
    return FutureBuilder<ApiCallResponse>(
      future: ContractsGroup.contractDetailCall.call(
        contractId: widget.contractIdParam,
        partitionKey: FFAppState().partitionKey,
        authToken: currentAuthenticationToken,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final detailContractWMContractDetailResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.sideNavModel,
                    updateCallback: () => setState(() {}),
                    child: SideNavWidget(
                      selectedNav: (String varTypeContract) {
                        return varTypeContract == 'sale' ? true : false;
                      }(getJsonField(
                        detailContractWMContractDetailResponse.jsonBody,
                        r'''$.type''',
                      ).toString())
                          ? Pages.sale_contracts
                          : Pages.purchase_contracts,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsets.all(valueOrDefault<double>(
                              FFAppConstants.paddingParentAndBody.toDouble(),
                              0.0,
                            )),
                            child: Container(
                              width: 1238.0,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          valueOrDefault<double>(
                                            FFAppConstants.paddingParentAndBody
                                                .toDouble(),
                                            0.0,
                                          ),
                                          0.0,
                                          valueOrDefault<double>(
                                            FFAppConstants.paddingParentAndBody
                                                .toDouble(),
                                            0.0,
                                          ),
                                          0.0),
                                      child: Container(
                                        width: 1262.0,
                                        constraints: BoxConstraints(
                                          minWidth:
                                              functions.containerBodyWidth(
                                                  MediaQuery.sizeOf(context)
                                                      .width,
                                                  250.0,
                                                  FFAppConstants
                                                      .paddingParentAndBody
                                                      .toDouble(),
                                                  0.0),
                                          minHeight: 60.0,
                                          maxWidth:
                                              functions.containerBodyWidth(
                                                  MediaQuery.sizeOf(context)
                                                      .width,
                                                  250.0,
                                                  FFAppConstants
                                                      .paddingParentAndBody
                                                      .toDouble(),
                                                  0.0),
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
                                              '${getJsonField(
                                                detailContractWMContractDetailResponse
                                                    .jsonBody,
                                                r'''$.typeContract''',
                                              ).toString()} Contract Detail',
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
                                          valueOrDefault<double>(
                                            FFAppConstants.paddingParentAndBody
                                                .toDouble(),
                                            0.0,
                                          ),
                                          0.0,
                                          valueOrDefault<double>(
                                            FFAppConstants.paddingParentAndBody
                                                .toDouble(),
                                            0.0,
                                          ),
                                          0.0),
                                      child: Container(
                                        width: 1262.0,
                                        constraints: BoxConstraints(
                                          minWidth:
                                              functions.containerBodyWidth(
                                                  MediaQuery.sizeOf(context)
                                                      .width,
                                                  250.0,
                                                  FFAppConstants
                                                      .paddingParentAndBody
                                                      .toDouble(),
                                                  0.0),
                                          minHeight: 200.0,
                                          maxWidth:
                                              functions.containerBodyWidth(
                                                  MediaQuery.sizeOf(context)
                                                      .width,
                                                  250.0,
                                                  FFAppConstants
                                                      .paddingParentAndBody
                                                      .toDouble(),
                                                  0.0),
                                        ),
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
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
                                                    width: 570.0,
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
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'ID Contract #',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          fontSize:
                                                                              22.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      detailContractWMContractDetailResponse
                                                                          .jsonBody,
                                                                      r'''$.folio''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          fontSize:
                                                                              22.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 58.0,
                                                                  height: 35.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color:
                                                                        colorFromCssString(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        getJsonField(
                                                                          detailContractWMContractDetailResponse
                                                                              .jsonBody,
                                                                          r'''$.pricingColorType''',
                                                                        )?.toString(),
                                                                        '#b8ebf3',
                                                                      ),
                                                                      defaultColor:
                                                                          Color(
                                                                              0xFFB8EBF3),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              6.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              6.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              6.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              6.0),
                                                                    ),
                                                                  ),
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      detailContractWMContractDetailResponse
                                                                          .jsonBody,
                                                                      r'''$.pricingType''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
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
                                                  Container(
                                                    width: 540.0,
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
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Container(
                                                                width: 150.0,
                                                                height: 35.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            14.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            14.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            14.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            14.0),
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'Pending Payment',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: Color(
                                                                            0xFF3E3D4A),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderRadius:
                                                                    0.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                icon: Icon(
                                                                  Icons
                                                                      .edit_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  size: 24.0,
                                                                ),
                                                                showLoadingIndicator:
                                                                    true,
                                                                onPressed:
                                                                    () async {
                                                                  _model.purchaseOneContractViewApiResultV3 =
                                                                      await ContractsGroup
                                                                          .oneContractViewCall
                                                                          .call(
                                                                    contractId:
                                                                        widget
                                                                            .contractIdParam,
                                                                    authToken:
                                                                        currentAuthenticationToken,
                                                                    partitionKey:
                                                                        FFAppState()
                                                                            .partitionKey,
                                                                  );

                                                                  if ((_model
                                                                          .purchaseOneContractViewApiResultV3
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    if (!((String
                                                                        var1) {
                                                                      return var1 ==
                                                                              'sale'
                                                                          ? true
                                                                          : false;
                                                                    }(getJsonField(
                                                                      detailContractWMContractDetailResponse
                                                                          .jsonBody,
                                                                      r'''$.type''',
                                                                    ).toString()))) {
                                                                      // SetIdepotence
                                                                      FFAppState()
                                                                          .updateContractPurchaseMetadataStruct(
                                                                        (e) => e
                                                                          ..idempotence =
                                                                              widget.contractIdParam
                                                                          ..edit =
                                                                              true
                                                                          ..loadAppState =
                                                                              true,
                                                                      );
                                                                      FFAppState()
                                                                              .ContractPurchase =
                                                                          ContractSaleSchemaStruct.maybeFromMap(
                                                                              getJsonField(
                                                                        (_model.purchaseOneContractViewApiResultV3?.jsonBody ??
                                                                            ''),
                                                                        r'''$''',
                                                                      ))!;
                                                                      FFAppState()
                                                                          .updateContractPurchaseMetadataStruct(
                                                                        (e) => e
                                                                          ..loadAppState =
                                                                              true
                                                                          ..incomplete =
                                                                              true
                                                                          ..edit =
                                                                              true,
                                                                      );
                                                                      await Future.delayed(const Duration(
                                                                          milliseconds:
                                                                              500));

                                                                      context
                                                                          .goNamed(
                                                                        'CreatePurchaseContractWM',
                                                                        queryParameters:
                                                                            {
                                                                          'contractId':
                                                                              serializeParam(
                                                                            widget.contractIdParam,
                                                                            ParamType.String,
                                                                          ),
                                                                          'backPage':
                                                                              serializeParam(
                                                                            Pages.detail_contract,
                                                                            ParamType.Enum,
                                                                          ),
                                                                          'edit':
                                                                              serializeParam(
                                                                            true,
                                                                            ParamType.bool,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    } else {
                                                                      // SetIdepotence
                                                                      FFAppState()
                                                                          .updateContractSaleMetadataStruct(
                                                                        (e) => e
                                                                          ..idempotence =
                                                                              widget.contractIdParam
                                                                          ..loadAppState =
                                                                              true
                                                                          ..edit =
                                                                              true,
                                                                      );
                                                                      FFAppState()
                                                                              .ContractSaleData =
                                                                          ContractSalePurchaseSchemaStruct.maybeFromMap(
                                                                              getJsonField(
                                                                        (_model.purchaseOneContractViewApiResultV3?.jsonBody ??
                                                                            ''),
                                                                        r'''$''',
                                                                      ))!;
                                                                      FFAppState()
                                                                          .updateContractSaleMetadataStruct(
                                                                        (e) => e
                                                                          ..loadAppState =
                                                                              true
                                                                          ..incomplete =
                                                                              true
                                                                          ..edit =
                                                                              true,
                                                                      );
                                                                      await Future.delayed(const Duration(
                                                                          milliseconds:
                                                                              500));

                                                                      context
                                                                          .goNamed(
                                                                        'CreateSaleContractWM',
                                                                        queryParameters:
                                                                            {
                                                                          'contractId':
                                                                              serializeParam(
                                                                            widget.contractIdParam,
                                                                            ParamType.String,
                                                                          ),
                                                                          'backPage':
                                                                              serializeParam(
                                                                            Pages.detail_contract,
                                                                            ParamType.Enum,
                                                                          ),
                                                                          'edit':
                                                                              serializeParam(
                                                                            true,
                                                                            ParamType.bool,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    }
                                                                  }

                                                                  setState(
                                                                      () {});
                                                                },
                                                              ),
                                                            ),
                                                            FlutterFlowIconButton(
                                                              borderRadius: 0.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor: Color(
                                                                  0xB6FF0010),
                                                              icon: Icon(
                                                                Icons
                                                                    .delete_forever_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                size: 24.0,
                                                              ),
                                                              onPressed: () {
                                                                print(
                                                                    'IconButton pressed ...');
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 100.0,
                                              height: 24.0,
                                              decoration: BoxDecoration(),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 20.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(16.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Text(
                                                          '${getJsonField(
                                                            detailContractWMContractDetailResponse
                                                                .jsonBody,
                                                            r'''$.typeContract''',
                                                          ).toString()} Form:',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        Divider(
                                                          height: 32.0,
                                                          thickness: 2.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      12.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Wrap(
                                                            spacing: 0.0,
                                                            runSpacing: 24.0,
                                                            alignment:
                                                                WrapAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                WrapCrossAlignment
                                                                    .center,
                                                            direction:
                                                                Axis.horizontal,
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
                                                                width: 571.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minWidth: functions.containerRowsWidth(
                                                                      MediaQuery.sizeOf(
                                                                              context)
                                                                          .width,
                                                                      functions.containerBodyWidth(
                                                                          MediaQuery.sizeOf(context)
                                                                              .width,
                                                                          250.0,
                                                                          FFAppConstants
                                                                              .paddingParentAndBody
                                                                              .toDouble(),
                                                                          0.0),
                                                                      24.0,
                                                                      32.0,
                                                                      12.0,
                                                                      2)!,
                                                                  maxWidth: functions.containerRowsWidth(
                                                                      MediaQuery.sizeOf(
                                                                              context)
                                                                          .height,
                                                                      functions.containerBodyWidth(
                                                                          MediaQuery.sizeOf(context)
                                                                              .width,
                                                                          250.0,
                                                                          FFAppConstants
                                                                              .paddingParentAndBody
                                                                              .toDouble(),
                                                                          0.0),
                                                                      24.0,
                                                                      32.0,
                                                                      12.0,
                                                                      2)!,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
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
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            detailContractWMContractDetailResponse.jsonBody,
                                                                            r'''$.contractDate''',
                                                                          ).toString(),
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 14.0,
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
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            detailContractWMContractDetailResponse.jsonBody,
                                                                            r'''$._id''',
                                                                          ).toString(),
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 571.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minWidth: functions.containerRowsWidth(
                                                                      MediaQuery.sizeOf(
                                                                              context)
                                                                          .width,
                                                                      functions.containerBodyWidth(
                                                                          MediaQuery.sizeOf(context)
                                                                              .width,
                                                                          250.0,
                                                                          FFAppConstants
                                                                              .paddingParentAndBody
                                                                              .toDouble(),
                                                                          0.0),
                                                                      24.0,
                                                                      32.0,
                                                                      12.0,
                                                                      2)!,
                                                                  maxWidth: functions.containerRowsWidth(
                                                                      MediaQuery.sizeOf(
                                                                              context)
                                                                          .width,
                                                                      functions.containerBodyWidth(
                                                                          MediaQuery.sizeOf(context)
                                                                              .width,
                                                                          250.0,
                                                                          FFAppConstants
                                                                              .paddingParentAndBody
                                                                              .toDouble(),
                                                                          0.0),
                                                                      24.0,
                                                                      32.0,
                                                                      12.0,
                                                                      2)!,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFFDDDDE0),
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                detailContractWMContractDetailResponse.jsonBody,
                                                                                r'''$.customerName''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    lineHeight: 1.5,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                AutoSizeText(
                                                                              getJsonField(
                                                                                detailContractWMContractDetailResponse.jsonBody,
                                                                                r'''$.customerId''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    lineHeight: 1.14,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                FutureBuilder<ApiCallResponse>(
                                                                              future: CRMLocationsGroup.addressPeopleCall.call(
                                                                                ownerId: getJsonField(
                                                                                  detailContractWMContractDetailResponse.jsonBody,
                                                                                  r'''$.customerId''',
                                                                                ).toString(),
                                                                                partitionKey: FFAppState().partitionKey,
                                                                                authToken: currentAuthenticationToken,
                                                                              ),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      child: CircularProgressIndicator(
                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                final textAddressPeopleResponse = snapshot.data!;
                                                                                return AutoSizeText(
                                                                                  getJsonField(
                                                                                    textAddressPeopleResponse.jsonBody,
                                                                                    r'''$.addressPeople''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: Color(0xFF0C4F08),
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                        lineHeight: 1.14,
                                                                                      ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Divider(
                                                                    height:
                                                                        32.0,
                                                                    thickness:
                                                                        2.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      12.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Wrap(
                                                            spacing: 0.0,
                                                            runSpacing: 24.0,
                                                            alignment:
                                                                WrapAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                WrapCrossAlignment
                                                                    .center,
                                                            direction:
                                                                Axis.horizontal,
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
                                                                width: 570.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minWidth: functions.containerRowsWidth(
                                                                      MediaQuery.sizeOf(
                                                                              context)
                                                                          .width,
                                                                      functions.containerBodyWidth(
                                                                          MediaQuery.sizeOf(context)
                                                                              .width,
                                                                          250.0,
                                                                          FFAppConstants
                                                                              .paddingParentAndBody
                                                                              .toDouble(),
                                                                          0.0),
                                                                      24.0,
                                                                      32.0,
                                                                      12.0,
                                                                      2)!,
                                                                  maxWidth: functions.containerRowsWidth(
                                                                      MediaQuery.sizeOf(
                                                                              context)
                                                                          .width,
                                                                      functions.containerBodyWidth(
                                                                          MediaQuery.sizeOf(context)
                                                                              .width,
                                                                          250.0,
                                                                          FFAppConstants
                                                                              .paddingParentAndBody
                                                                              .toDouble(),
                                                                          0.0),
                                                                      24.0,
                                                                      32.0,
                                                                      12.0,
                                                                      2)!,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'General Information',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                lineHeight: 1.5,
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
                                                                          'Commodity:',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                lineHeight: 1.7,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            detailContractWMContractDetailResponse.jsonBody,
                                                                            r'''$.commodity.name''',
                                                                          ).toString().maybeHandleOverflow(
                                                                                maxChars: 21,
                                                                                replacement: '…',
                                                                              ),
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                lineHeight: 1.5,
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
                                                                          'Quantity / Units:',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                lineHeight: 1.7,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            detailContractWMContractDetailResponse.jsonBody,
                                                                            r'''$.quantityUnits''',
                                                                          ).toString(),
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                lineHeight: 1.5,
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
                                                                          'Price:',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                lineHeight: 1.7,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            detailContractWMContractDetailResponse.jsonBody,
                                                                            r'''$.contractPrice''',
                                                                          ).toString(),
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                lineHeight: 1.5,
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
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                lineHeight: 1.7,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            detailContractWMContractDetailResponse.jsonBody,
                                                                            r'''$.contractBasis''',
                                                                          ).toString(),
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: Color(0xFF234AFF),
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                lineHeight: 1.5,
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
                                                                          'Future:',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                lineHeight: 1.7,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            detailContractWMContractDetailResponse.jsonBody,
                                                                            r'''$.contractFuture''',
                                                                          ).toString(),
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                lineHeight: 1.5,
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
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                lineHeight: 1.7,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            detailContractWMContractDetailResponse.jsonBody,
                                                                            r'''$.contact''',
                                                                          ).toString(),
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                lineHeight: 1.5,
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
                                                                          'Shipment:',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                lineHeight: 1.7,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            detailContractWMContractDetailResponse.jsonBody,
                                                                            r'''$.shipmentPeriod''',
                                                                          ).toString(),
                                                                          maxLines:
                                                                              5,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                lineHeight: 1.5,
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
                                                                          'Payment Terms:',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                lineHeight: 1.7,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            detailContractWMContractDetailResponse.jsonBody,
                                                                            r'''$.paymentTerms''',
                                                                          ).toString(),
                                                                          maxLines:
                                                                              5,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                lineHeight: 1.5,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 570.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minWidth: functions.containerRowsWidth(
                                                                      MediaQuery.sizeOf(
                                                                              context)
                                                                          .width,
                                                                      functions.containerBodyWidth(
                                                                          MediaQuery.sizeOf(context)
                                                                              .width,
                                                                          250.0,
                                                                          FFAppConstants
                                                                              .paddingParentAndBody
                                                                              .toDouble(),
                                                                          0.0),
                                                                      24.0,
                                                                      32.0,
                                                                      12.0,
                                                                      2)!,
                                                                  maxWidth: functions.containerRowsWidth(
                                                                      MediaQuery.sizeOf(
                                                                              context)
                                                                          .width,
                                                                      functions.containerBodyWidth(
                                                                          MediaQuery.sizeOf(context)
                                                                              .width,
                                                                          250.0,
                                                                          FFAppConstants
                                                                              .paddingParentAndBody
                                                                              .toDouble(),
                                                                          0.0),
                                                                      24.0,
                                                                      32.0,
                                                                      12.0,
                                                                      2)!,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFFDDDDE0),
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          8.0,
                                                                          12.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              'Quantity Overview',
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    lineHeight: 1.5,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              'Fixed',
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    lineHeight: 1.5,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              'Open',
                                                                              textAlign: TextAlign.end,
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    fontFamily: 'Inter',
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    lineHeight: 1.5,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              getJsonField(
                                                                                detailContractWMContractDetailResponse.jsonBody,
                                                                                r'''$.contractOverviewDelivered''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    color: colorFromCssString(
                                                                                      (double percDelivered) {
                                                                                        return percDelivered >= 1 ? '#14840d' : '#234aff';
                                                                                      }(valueOrDefault<double>(
                                                                                        getJsonField(
                                                                                          detailContractWMContractDetailResponse.jsonBody,
                                                                                          r'''$.percentageDelivered''',
                                                                                        ),
                                                                                        0.0,
                                                                                      )),
                                                                                      defaultColor: Color(0xFF234AFF),
                                                                                    ),
                                                                                    fontSize: 18.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    lineHeight: 1.5,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              getJsonField(
                                                                                detailContractWMContractDetailResponse.jsonBody,
                                                                                r'''$.contractOverviewOpen''',
                                                                              ).toString(),
                                                                              textAlign: TextAlign.end,
                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                    fontFamily: 'Inter',
                                                                                    fontSize: 18.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    lineHeight: 1.5,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 12.0),
                                                                              child: LinearPercentIndicator(
                                                                                percent: getJsonField(
                                                                                  detailContractWMContractDetailResponse.jsonBody,
                                                                                  r'''$.percentageDelivered''',
                                                                                ),
                                                                                lineHeight: 12.0,
                                                                                animation: true,
                                                                                animateFromLastPercent: true,
                                                                                progressColor: colorFromCssString(
                                                                                  (double percDelivered) {
                                                                                    return percDelivered >= 1 ? '#14840d' : '#234aff';
                                                                                  }(valueOrDefault<double>(
                                                                                    getJsonField(
                                                                                      detailContractWMContractDetailResponse.jsonBody,
                                                                                      r'''$.percentageDelivered''',
                                                                                    ),
                                                                                    0.0,
                                                                                  )),
                                                                                  defaultColor: Color(0xFF234AFF),
                                                                                ),
                                                                                backgroundColor: Color(0xFFE8E8EA),
                                                                                barRadius: Radius.circular(16.0),
                                                                                padding: EdgeInsets.zero,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      if (getJsonField(
                                                                        detailContractWMContractDetailResponse
                                                                            .jsonBody,
                                                                        r'''$.isBasis''',
                                                                      ))
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                'Sub-Contracts',
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Outfit',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      lineHeight: 1.5,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      if (getJsonField(
                                                                        detailContractWMContractDetailResponse
                                                                            .jsonBody,
                                                                        r'''$.isBasis''',
                                                                      ))
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                'Settled',
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Outfit',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      lineHeight: 1.5,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                'Unsettled',
                                                                                textAlign: TextAlign.end,
                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                      fontFamily: 'Inter',
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      lineHeight: 1.5,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      if (getJsonField(
                                                                        detailContractWMContractDetailResponse
                                                                            .jsonBody,
                                                                        r'''$.isBasis''',
                                                                      ))
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                getJsonField(
                                                                                  detailContractWMContractDetailResponse.jsonBody,
                                                                                  r'''$.contractOverviewTotalSettled''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Outfit',
                                                                                      color: colorFromCssString(
                                                                                        (double percSettled) {
                                                                                          return percSettled >= 1 ? '#14840d' : '#234aff';
                                                                                        }(valueOrDefault<double>(
                                                                                          getJsonField(
                                                                                            detailContractWMContractDetailResponse.jsonBody,
                                                                                            r'''$.percentageSettled''',
                                                                                          ),
                                                                                          0.0,
                                                                                        )),
                                                                                        defaultColor: Color(0xFF234AFF),
                                                                                      ),
                                                                                      fontSize: 18.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      lineHeight: 1.5,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                getJsonField(
                                                                                  detailContractWMContractDetailResponse.jsonBody,
                                                                                  r'''$.contractOverviewTotalUnSettled''',
                                                                                ).toString(),
                                                                                textAlign: TextAlign.end,
                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                      fontFamily: 'Inter',
                                                                                      fontSize: 18.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      lineHeight: 1.5,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      if (getJsonField(
                                                                        detailContractWMContractDetailResponse
                                                                            .jsonBody,
                                                                        r'''$.isBasis''',
                                                                      ))
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 12.0),
                                                                                child: LinearPercentIndicator(
                                                                                  percent: getJsonField(
                                                                                    detailContractWMContractDetailResponse.jsonBody,
                                                                                    r'''$.percentageSettled''',
                                                                                  ),
                                                                                  lineHeight: 12.0,
                                                                                  animation: true,
                                                                                  animateFromLastPercent: true,
                                                                                  progressColor: colorFromCssString(
                                                                                    (double percSettled) {
                                                                                      return percSettled >= 1 ? '#14840d' : '#234aff';
                                                                                    }(valueOrDefault<double>(
                                                                                      getJsonField(
                                                                                        detailContractWMContractDetailResponse.jsonBody,
                                                                                        r'''$.percentageSettled''',
                                                                                      ),
                                                                                      0.0,
                                                                                    )),
                                                                                    defaultColor: Color(0xFF234AFF),
                                                                                  ),
                                                                                  backgroundColor: Color(0xFFE8E8EA),
                                                                                  barRadius: Radius.circular(16.0),
                                                                                  padding: EdgeInsets.zero,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Divider(
                                                          height: 32.0,
                                                          thickness: 2.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                        Container(
                                                          constraints:
                                                              BoxConstraints(
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
                                                          decoration:
                                                              BoxDecoration(),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .stretch,
                                                            children: [
                                                              SingleChildScrollView(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'Special Instructions / Remarks:',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            lineHeight:
                                                                                1.5,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SingleChildScrollView(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      getJsonField(
                                                                        detailContractWMContractDetailResponse
                                                                            .jsonBody,
                                                                        r'''$.instructions''',
                                                                      ).toString(),
                                                                      maxLines:
                                                                          5,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            lineHeight:
                                                                                1.5,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (getJsonField(
                                              detailContractWMContractDetailResponse
                                                  .jsonBody,
                                              r'''$.isBasis''',
                                            ))
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 20.0),
                                                  child: FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: ContractsGroup
                                                        .subContractsCall
                                                        .call(
                                                      contractId: widget
                                                          .contractIdParam,
                                                      partitionKey: FFAppState()
                                                          .partitionKey,
                                                      authToken:
                                                          currentAuthenticationToken,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final containerSubContractsResponse =
                                                          snapshot.data!;
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                0.0,
                                                                2.0,
                                                              ),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      16.0,
                                                                      16.0,
                                                                      16.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'Sub-contracts (${valueOrDefault<String>(
                                                                        getJsonField(
                                                                          containerSubContractsResponse
                                                                              .jsonBody,
                                                                          r'''$.subContractsQuantity''',
                                                                        )?.toString(),
                                                                        '0',
                                                                      )})  ',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
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
                                                                    if ((double
                                                                        percDelivered) {
                                                                      return percDelivered <
                                                                              1
                                                                          ? true
                                                                          : false;
                                                                    }(valueOrDefault<
                                                                        double>(
                                                                      getJsonField(
                                                                        detailContractWMContractDetailResponse
                                                                            .jsonBody,
                                                                        r'''$.percentageDelivered''',
                                                                      ),
                                                                      0.0,
                                                                    )))
                                                                      Flexible(
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            context.pushNamed(
                                                                              'CreateSubContractWM',
                                                                              queryParameters: {
                                                                                'contractIdParam': serializeParam(
                                                                                  widget.contractIdParam,
                                                                                  ParamType.String,
                                                                                ),
                                                                                'typeContract': serializeParam(
                                                                                  getJsonField(
                                                                                    detailContractWMContractDetailResponse.jsonBody,
                                                                                    r'''$.type''',
                                                                                  ).toString(),
                                                                                  ParamType.String,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          text:
                                                                              '+ New Sub-Contract',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                40.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                Color(0xFFB9DAB6),
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: Color(0xFF083505),
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                ),
                                                                            elevation:
                                                                                3.0,
                                                                            borderSide:
                                                                                BorderSide(
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Divider(
                                                                height: 32.0,
                                                                thickness: 2.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                              ),
                                                              Wrap(
                                                                spacing: 0.0,
                                                                runSpacing:
                                                                    24.0,
                                                                alignment:
                                                                    WrapAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    WrapCrossAlignment
                                                                        .center,
                                                                direction: Axis
                                                                    .horizontal,
                                                                runAlignment:
                                                                    WrapAlignment
                                                                        .center,
                                                                verticalDirection:
                                                                    VerticalDirection
                                                                        .down,
                                                                clipBehavior:
                                                                    Clip.none,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        320.0,
                                                                    height:
                                                                        340.0,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      minWidth: functions.detailSubContractRowLeft(
                                                                          functions.containerBodyWidth(
                                                                              MediaQuery.sizeOf(context).width,
                                                                              250.0,
                                                                              FFAppConstants.paddingParentAndBody.toDouble(),
                                                                              0.0),
                                                                          320.0,
                                                                          24.0,
                                                                          32.0,
                                                                          12.0),
                                                                      maxWidth: functions.detailSubContractRowLeft(
                                                                          functions.containerBodyWidth(
                                                                              MediaQuery.sizeOf(context).width,
                                                                              250.0,
                                                                              FFAppConstants.paddingParentAndBody.toDouble(),
                                                                              0.0),
                                                                          320.0,
                                                                          24.0,
                                                                          32.0,
                                                                          12.0),
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'Position',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                              ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -1.0),
                                                                            child:
                                                                                Stack(
                                                                              children: [
                                                                                FlutterFlowPieChart(
                                                                                  data: FFPieChartData(
                                                                                    values: functions.extractValues(
                                                                                        getJsonField(
                                                                                          detailContractWMContractDetailResponse.jsonBody,
                                                                                          r'''$.quantity''',
                                                                                        ),
                                                                                        getJsonField(
                                                                                          containerSubContractsResponse.jsonBody,
                                                                                          r'''$.subContracts''',
                                                                                          true,
                                                                                        )!),
                                                                                    colors: chartPieChartColorsList,
                                                                                    radius: [40.0],
                                                                                    borderColor: [
                                                                                      Color(0x00000000)
                                                                                    ],
                                                                                  ),
                                                                                  donutHoleRadius: 19.0,
                                                                                  donutHoleColor: Colors.transparent,
                                                                                  sectionLabelType: PieChartSectionLabelType.value,
                                                                                  sectionLabelStyle: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                        fontFamily: 'Inter',
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                  child: FlutterFlowChartLegendWidget(
                                                                                    entries: functions
                                                                                        .extractLabels(
                                                                                            getJsonField(
                                                                                              detailContractWMContractDetailResponse.jsonBody,
                                                                                              r'''$.folio''',
                                                                                            ).toString(),
                                                                                            getJsonField(
                                                                                              containerSubContractsResponse.jsonBody,
                                                                                              r'''$.subContracts''',
                                                                                              true,
                                                                                            )!)
                                                                                        .asMap()
                                                                                        .entries
                                                                                        .map(
                                                                                          (label) => LegendEntry(
                                                                                            chartPieChartColorsList[label.key % chartPieChartColorsList.length],
                                                                                            label.value,
                                                                                          ),
                                                                                        )
                                                                                        .toList(),
                                                                                    width: 250.0,
                                                                                    height: 100.0,
                                                                                    textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: 'Inter',
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    textPadding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                    borderWidth: 0.0,
                                                                                    borderColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    indicatorSize: 10.0,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Builder(
                                                                    builder:
                                                                        (context) {
                                                                      if (getJsonField(
                                                                        containerSubContractsResponse
                                                                            .jsonBody,
                                                                        r'''$.isIterable''',
                                                                      )) {
                                                                        return Container(
                                                                          width:
                                                                              860.0,
                                                                          height:
                                                                              340.0,
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            minWidth: functions.detailSubContractRowRight(
                                                                                functions.containerBodyWidth(MediaQuery.sizeOf(context).width, 250.0, FFAppConstants.paddingParentAndBody.toDouble(), 0.0),
                                                                                320.0,
                                                                                24.0,
                                                                                32.0,
                                                                                12.0),
                                                                            maxWidth: functions.detailSubContractRowRight(
                                                                                functions.containerBodyWidth(MediaQuery.sizeOf(context).width, 250.0, FFAppConstants.paddingParentAndBody.toDouble(), 0.0),
                                                                                320.0,
                                                                                24.0,
                                                                                32.0,
                                                                                12.0),
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final dataSubContracts = getJsonField(
                                                                                containerSubContractsResponse.jsonBody,
                                                                                r'''$.subContracts''',
                                                                              ).toList();
                                                                              return ListView.separated(
                                                                                padding: EdgeInsets.zero,
                                                                                primary: false,
                                                                                scrollDirection: Axis.horizontal,
                                                                                itemCount: dataSubContracts.length,
                                                                                separatorBuilder: (_, __) => SizedBox(width: 6.0),
                                                                                itemBuilder: (context, dataSubContractsIndex) {
                                                                                  final dataSubContractsItem = dataSubContracts[dataSubContractsIndex];
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                    child: Container(
                                                                                      width: 280.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        boxShadow: [
                                                                                          BoxShadow(
                                                                                            blurRadius: 0.0,
                                                                                            color: Color(0xFFE0E3E7),
                                                                                            offset: Offset(
                                                                                              0.0,
                                                                                              1.0,
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                        border: Border.all(
                                                                                          color: Color(0xFFDDDDE0),
                                                                                        ),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(8.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                                                                                                          child: Container(
                                                                                                            width: 12.0,
                                                                                                            height: 12.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: colorFromCssString(
                                                                                                                valueOrDefault<String>(
                                                                                                                  getJsonField(
                                                                                                                    dataSubContractsItem,
                                                                                                                    r'''$.cardColor''',
                                                                                                                  )?.toString(),
                                                                                                                  '#b8ebf3',
                                                                                                                ),
                                                                                                                defaultColor: Color(0xFFB8EBF3),
                                                                                                              ),
                                                                                                              shape: BoxShape.circle,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          'ID Contract#',
                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                fontFamily: 'Outfit',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                lineHeight: 1.5,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          getJsonField(
                                                                                                            dataSubContractsItem,
                                                                                                            r'''$.folio''',
                                                                                                          ).toString(),
                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                fontFamily: 'Outfit',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                lineHeight: 1.5,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Quantity / Units:',
                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                fontFamily: 'Outfit',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                lineHeight: 1.5,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          'Basis',
                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                fontFamily: 'Outfit',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                lineHeight: 1.5,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          getJsonField(
                                                                                                            dataSubContractsItem,
                                                                                                            r'''$.quantityUnits''',
                                                                                                          ).toString(),
                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                fontFamily: 'Outfit',
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                lineHeight: 1.5,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          getJsonField(
                                                                                                            dataSubContractsItem,
                                                                                                            r'''$.contractBasis''',
                                                                                                          ).toString(),
                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                fontFamily: 'Outfit',
                                                                                                                color: Color(0xFF234AFF),
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                lineHeight: 1.5,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Price:',
                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                fontFamily: 'Outfit',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                lineHeight: 1.5,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          getJsonField(
                                                                                                            dataSubContractsItem,
                                                                                                            r'''$.contractPrice''',
                                                                                                          ).toString(),
                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                fontFamily: 'Outfit',
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                lineHeight: 1.5,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Delivered',
                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                fontFamily: 'Outfit',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                lineHeight: 1.5,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          'Your Balance',
                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                fontFamily: 'Outfit',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                lineHeight: 1.5,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          getJsonField(
                                                                                                            dataSubContractsItem,
                                                                                                            r'''$.deliveredUnits''',
                                                                                                          ).toString(),
                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                fontFamily: 'Outfit',
                                                                                                                color: Color(0xFF234AFF),
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                lineHeight: 1.5,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          getJsonField(
                                                                                                            dataSubContractsItem,
                                                                                                            r'''$.quantityUnits''',
                                                                                                          ).toString(),
                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                fontFamily: 'Outfit',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                lineHeight: 1.5,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Expanded(
                                                                                                      child: LinearPercentIndicator(
                                                                                                        percent: getJsonField(
                                                                                                          dataSubContractsItem,
                                                                                                          r'''$.percentageDelivered''',
                                                                                                        ),
                                                                                                        lineHeight: 12.0,
                                                                                                        animation: true,
                                                                                                        animateFromLastPercent: true,
                                                                                                        progressColor: Color(0xFF234AFF),
                                                                                                        backgroundColor: Color(0xFFE8E8EA),
                                                                                                        barRadius: Radius.circular(16.0),
                                                                                                        padding: EdgeInsets.zero,
                                                                                                      ),
                                                                                                    ),
                                                                                                    Divider(
                                                                                                      height: 20.0,
                                                                                                      thickness: 1.0,
                                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Total Payment',
                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                fontFamily: 'Outfit',
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 14.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                lineHeight: 1.5,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          getJsonField(
                                                                                                            dataSubContractsItem,
                                                                                                            r'''$.totalPayment''',
                                                                                                          ).toString(),
                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                fontFamily: 'Outfit',
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                fontSize: 18.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                lineHeight: 1.5,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      children: [
                                                                                                        if ((String subContractStatus) {
                                                                                                          return subContractStatus == 'created' ? true : false;
                                                                                                        }(valueOrDefault<String>(
                                                                                                          getJsonField(
                                                                                                            dataSubContractsItem,
                                                                                                            r'''$.subContractStatus''',
                                                                                                          )?.toString(),
                                                                                                          'settled',
                                                                                                        )))
                                                                                                          Flexible(
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                                                                                                              child: FFButtonWidget(
                                                                                                                onPressed: () async {
                                                                                                                  var _shouldSetState = false;
                                                                                                                  var confirmDialogResponse = await showDialog<bool>(
                                                                                                                        context: context,
                                                                                                                        builder: (alertDialogContext) {
                                                                                                                          return AlertDialog(
                                                                                                                            title: Text('Settled Sub-Contract'),
                                                                                                                            content: Text('Do you want to settled the sub-contract #${getJsonField(
                                                                                                                              dataSubContractsItem,
                                                                                                                              r'''$.folio''',
                                                                                                                            ).toString()}'),
                                                                                                                            actions: [
                                                                                                                              TextButton(
                                                                                                                                onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                                child: Text('Cancel'),
                                                                                                                              ),
                                                                                                                              TextButton(
                                                                                                                                onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                                child: Text('Yes, settled it'),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          );
                                                                                                                        },
                                                                                                                      ) ??
                                                                                                                      false;
                                                                                                                  if (confirmDialogResponse) {
                                                                                                                    FFAppState().updateSettledSubContractStateStruct(
                                                                                                                      (e) => e
                                                                                                                        ..createdByName = '${FFAppState().UserSession.firstName} ${FFAppState().UserSession.lastName}'
                                                                                                                        ..createdById = FFAppState().UserSession.id,
                                                                                                                    );
                                                                                                                    setState(() {});
                                                                                                                    _model.apiResultu8c = await ContractsGroup.settledSubContractCall.call(
                                                                                                                      dataBodyJson: FFAppState().SettledSubContractState.toMap(),
                                                                                                                      subContractId: getJsonField(
                                                                                                                        dataSubContractsItem,
                                                                                                                        r'''$.subContractId''',
                                                                                                                      ).toString(),
                                                                                                                      partitionKey: FFAppState().partitionKey,
                                                                                                                      authToken: currentAuthenticationToken,
                                                                                                                    );

                                                                                                                    _shouldSetState = true;
                                                                                                                    if ((_model.apiResultu8c?.succeeded ?? true)) {
                                                                                                                      if (_shouldSetState) setState(() {});
                                                                                                                      return;
                                                                                                                    }

                                                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                      SnackBar(
                                                                                                                        content: Text(
                                                                                                                          getJsonField(
                                                                                                                            (_model.apiResultu8c?.jsonBody ?? ''),
                                                                                                                            r'''$.message''',
                                                                                                                          ).toString(),
                                                                                                                          style: TextStyle(
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        duration: Duration(milliseconds: 4000),
                                                                                                                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                                      ),
                                                                                                                    );
                                                                                                                    if (_shouldSetState) setState(() {});
                                                                                                                    return;
                                                                                                                  } else {
                                                                                                                    if (_shouldSetState) setState(() {});
                                                                                                                    return;
                                                                                                                  }

                                                                                                                  if (_shouldSetState) setState(() {});
                                                                                                                },
                                                                                                                text: 'Settled',
                                                                                                                options: FFButtonOptions(
                                                                                                                  height: 30.0,
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                  color: Color(0xFFE98F51),
                                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                        fontFamily: 'Inter',
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                        fontSize: 12.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                      ),
                                                                                                                  elevation: 3.0,
                                                                                                                  borderSide: BorderSide(
                                                                                                                    color: Color(0xFFE98F51),
                                                                                                                    width: 0.0,
                                                                                                                  ),
                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        if ((String subContractStatus) {
                                                                                                          return subContractStatus == 'created' ? false : true;
                                                                                                        }(valueOrDefault<String>(
                                                                                                          getJsonField(
                                                                                                            dataSubContractsItem,
                                                                                                            r'''$.subContractStatus''',
                                                                                                          )?.toString(),
                                                                                                          'settled',
                                                                                                        )))
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: 12.0,
                                                                                                              height: 30.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                shape: BoxShape.rectangle,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        return Container(
                                                                          width:
                                                                              860.0,
                                                                          height:
                                                                              300.0,
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            minWidth: functions.detailSubContractRowRight(
                                                                                functions.containerBodyWidth(MediaQuery.sizeOf(context).width, 250.0, FFAppConstants.paddingParentAndBody.toDouble(), 0.0),
                                                                                320.0,
                                                                                24.0,
                                                                                32.0,
                                                                                12.0),
                                                                            maxWidth: functions.detailSubContractRowRight(
                                                                                functions.containerBodyWidth(MediaQuery.sizeOf(context).width, 250.0, FFAppConstants.paddingParentAndBody.toDouble(), 0.0),
                                                                                320.0,
                                                                                24.0,
                                                                                32.0,
                                                                                12.0),
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Image.asset(
                                                                                      'assets/images/subcontracts-empty.png',
                                                                                      width: 250.0,
                                                                                      height: 200.0,
                                                                                      fit: BoxFit.fill,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  'No Sub-Contract created',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        fontSize: 20.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  'Create a new contract by clicking on\nthe “+ New Sub-Contract” button.',
                                                                                  textAlign: TextAlign.center,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Inter',
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          valueOrDefault<double>(
                                            FFAppConstants.paddingParentAndBody
                                                .toDouble(),
                                            0.0,
                                          ),
                                          0.0,
                                          valueOrDefault<double>(
                                            FFAppConstants.paddingParentAndBody
                                                .toDouble(),
                                            0.0,
                                          ),
                                          0.0),
                                      child: Container(
                                        width: 1262.0,
                                        constraints: BoxConstraints(
                                          minWidth:
                                              functions.containerBodyWidth(
                                                  MediaQuery.sizeOf(context)
                                                      .width,
                                                  250.0,
                                                  FFAppConstants
                                                      .paddingParentAndBody
                                                      .toDouble(),
                                                  0.0),
                                          maxWidth:
                                              functions.containerBodyWidth(
                                                  MediaQuery.sizeOf(context)
                                                      .width,
                                                  250.0,
                                                  FFAppConstants
                                                      .paddingParentAndBody
                                                      .toDouble(),
                                                  0.0),
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 30.0),
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
                                                    if ((String
                                                        varConditionalType) {
                                                      return varConditionalType ==
                                                              'sale'
                                                          ? true
                                                          : false;
                                                    }(getJsonField(
                                                      detailContractWMContractDetailResponse
                                                          .jsonBody,
                                                      r'''$.type''',
                                                    ).toString())) {
                                                      context.pushNamed(
                                                          'ListSaleContractsW');
                                                    } else {
                                                      context.pushNamed(
                                                          'ListPurshaseContractsW');
                                                    }
                                                  },
                                                  text: 'Back to List',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    if (detailContractWMContractDetailResponse
                                                            .jsonBody !=
                                                        null) {
                                                      _model.pdfResult =
                                                          await InvoicePdfCall
                                                              .call(
                                                        dataReportJson:
                                                            detailContractWMContractDetailResponse
                                                                .jsonBody,
                                                      );

                                                      if ((_model.pdfResult
                                                              ?.succeeded ??
                                                          true)) {
                                                        await launchURL(
                                                            getJsonField(
                                                          (_model.pdfResult
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.file''',
                                                        ).toString());
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Error loading pdf',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                          ),
                                                        );
                                                      }
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Error loading contract details',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );
                                                    }

                                                    setState(() {});
                                                  },
                                                  text: 'Print Contract',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 100.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
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
            ),
          ),
        );
      },
    );
  }
}
