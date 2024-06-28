import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/base/side_nav/side_nav_widget.dart';
import '/components/base/spinner/spinner_widget.dart';
import '/components/contracts/pop_over_menu_contract/pop_over_menu_contract_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_sale_contracts_w_model.dart';
export 'list_sale_contracts_w_model.dart';

class ListSaleContractsWWidget extends StatefulWidget {
  const ListSaleContractsWWidget({super.key});

  @override
  State<ListSaleContractsWWidget> createState() =>
      _ListSaleContractsWWidgetState();
}

class _ListSaleContractsWWidgetState extends State<ListSaleContractsWWidget> {
  late ListSaleContractsWModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListSaleContractsWModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        Future(() async {
          _model.responseContracts = await ContractsGroup.contractsCall.call(
            partitionKey: FFAppState().partitionKey,
            authToken: currentAuthenticationToken,
            all: 'true',
            filter: '{\"type\":\"sale\"}',
          );

          if ((_model.responseContracts?.succeeded ?? true)) {
            _model.contractsParsed = await actions.parseListContracts(
              ContractsGroup.contractsCall
                  .data(
                    (_model.responseContracts?.jsonBody ?? ''),
                  )!
                  .toList(),
              'sale',
            );
            _model.listContracts =
                _model.contractsParsed!.toList().cast<ContractsStruct>();
            _model.originalListContracts =
                _model.contractsParsed!.toList().cast<ContractsStruct>();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Ocurrio un error recuperando los registros',
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).error,
              ),
            );
          }
        }),
        Future(() async {
          _model.returnCommoditiesToFilter =
              await ContractsGroup.contractsCommoditiesUsedCall.call(
            partitionKey: FFAppState().partitionKey,
            authToken: currentAuthenticationToken,
            bodyValueJson:
                FFAppState().Commodities.map((e) => e.toMap()).toList(),
            typeValue: 'sale',
          );

          _model.listCommoditiesToFilter =
              ((_model.returnCommoditiesToFilter?.jsonBody ?? '')
                      .toList()
                      .map<CommoditiesStruct?>(CommoditiesStruct.maybeFromMap)
                      .toList() as Iterable<CommoditiesStruct?>)
                  .withoutNulls
                  .toList()
                  .cast<CommoditiesStruct>();
          setState(() {});
        }),
      ]);
      _model.spinnerVisible = false;
      setState(() {});
    });

    _model.textToSearchTextController ??= TextEditingController();
    _model.textToSearchFocusNode ??= FocusNode();

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
                children: [
                  wrapWithModel(
                    model: _model.sideNavModel,
                    updateCallback: () => setState(() {}),
                    child: SideNavWidget(
                      selectedNav: Pages.sale_contracts,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    valueOrDefault<double>(
                                      () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return FFAppConstants
                                              .contentPaddingHorizontalSmall
                                              .toDouble();
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return FFAppConstants
                                              .contentPaddingHorizontalMedium
                                              .toDouble();
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return FFAppConstants
                                              .contentPaddingHorizontalLarge
                                              .toDouble();
                                        } else {
                                          return FFAppConstants
                                              .contentPaddingHorizontalLarge
                                              .toDouble();
                                        }
                                      }(),
                                      20.0,
                                    ),
                                    20.0,
                                    valueOrDefault<double>(
                                      () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return FFAppConstants
                                              .contentPaddingHorizontalSmall
                                              .toDouble();
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return FFAppConstants
                                              .contentPaddingHorizontalMedium
                                              .toDouble();
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return FFAppConstants
                                              .contentPaddingHorizontalLarge
                                              .toDouble();
                                        } else {
                                          return FFAppConstants
                                              .contentPaddingHorizontalLarge
                                              .toDouble();
                                        }
                                      }(),
                                      20.0,
                                    ),
                                    50.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: valueOrDefault<double>(
                                          () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 469.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointMedium) {
                                              return 731.0;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 982.0;
                                            } else {
                                              return 982.0;
                                            }
                                          }(),
                                          982.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 10.0, 0.0),
                                                child: Text(
                                                  'Sales Contracts',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Form(
                                                key: _model.formKey,
                                                autovalidateMode:
                                                    AutovalidateMode.disabled,
                                                child: Wrap(
                                                  spacing: 16.0,
                                                  runSpacing: 16.0,
                                                  alignment: WrapAlignment.end,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            'Lorem Ipsum is simply dummy text of the ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 358.0,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textToSearchTextController,
                                                          focusNode: _model
                                                              .textToSearchFocusNode,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            '_model.textToSearchTextController',
                                                            Duration(
                                                                milliseconds:
                                                                    2000),
                                                            () async {
                                                              if (_model.textToSearchTextController
                                                                          .text ==
                                                                      null ||
                                                                  _model.textToSearchTextController
                                                                          .text ==
                                                                      '') {
                                                                _model.returnListContractSearchEmpty =
                                                                    await actions
                                                                        .filterContracts(
                                                                  _model
                                                                      .originalListContracts
                                                                      .toList(),
                                                                  _model
                                                                      .selectFilterCommodity,
                                                                  _model
                                                                      .filterByType,
                                                                  _model
                                                                      .textToSearchTextController
                                                                      .text,
                                                                );
                                                                _model.isShowFullList =
                                                                    false;
                                                                _model.listContracts = _model
                                                                    .returnListContractSearchEmpty!
                                                                    .toList()
                                                                    .cast<
                                                                        ContractsStruct>();
                                                                setState(() {});
                                                              }

                                                              setState(() {});
                                                            },
                                                          ),
                                                          autofocus: true,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText: 'Search',
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            suffixIcon: _model
                                                                    .textToSearchTextController!
                                                                    .text
                                                                    .isNotEmpty
                                                                ? InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      _model
                                                                          .textToSearchTextController
                                                                          ?.clear();
                                                                      if (_model.textToSearchTextController.text ==
                                                                              null ||
                                                                          _model.textToSearchTextController.text ==
                                                                              '') {
                                                                        _model.returnListContractSearchEmpty =
                                                                            await actions.filterContracts(
                                                                          _model
                                                                              .originalListContracts
                                                                              .toList(),
                                                                          _model
                                                                              .selectFilterCommodity,
                                                                          _model
                                                                              .filterByType,
                                                                          _model
                                                                              .textToSearchTextController
                                                                              .text,
                                                                        );
                                                                        _model.isShowFullList =
                                                                            false;
                                                                        _model.listContracts = _model
                                                                            .returnListContractSearchEmpty!
                                                                            .toList()
                                                                            .cast<ContractsStruct>();
                                                                        setState(
                                                                            () {});
                                                                      }

                                                                      setState(
                                                                          () {});
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .clear,
                                                                      size:
                                                                          22.0,
                                                                    ),
                                                                  )
                                                                : null,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                          validator: _model
                                                              .textToSearchTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        if (_model.formKey
                                                                    .currentState ==
                                                                null ||
                                                            !_model.formKey
                                                                .currentState!
                                                                .validate()) {
                                                          return;
                                                        }
                                                        _model.returnListContractSearchText =
                                                            await actions
                                                                .filterContracts(
                                                          _model
                                                              .originalListContracts
                                                              .toList(),
                                                          _model
                                                              .selectFilterCommodity,
                                                          _model.filterByType,
                                                          _model
                                                              .textToSearchTextController
                                                              .text,
                                                        );
                                                        _model.isShowFullList =
                                                            false;
                                                        _model.listContracts = _model
                                                            .returnListContractSearchText!
                                                            .toList()
                                                            .cast<
                                                                ContractsStruct>();
                                                        setState(() {});

                                                        setState(() {});
                                                      },
                                                      text: 'Search',
                                                      options: FFButtonOptions(
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
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        if (FFAppState()
                                                                .ContractSaleMetadata
                                                                .edit ==
                                                            true) {
                                                          await action_blocks
                                                              .resetContractSale(
                                                                  context);
                                                        }

                                                        context.goNamed(
                                                          'CreateSaleContractWM',
                                                          queryParameters: {
                                                            'backPage':
                                                                serializeParam(
                                                              Pages
                                                                  .list_sale_contract,
                                                              ParamType.Enum,
                                                            ),
                                                            'edit':
                                                                serializeParam(
                                                              false,
                                                              ParamType.bool,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      500),
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      text: '',
                                                      icon: Icon(
                                                        Icons.add,
                                                        size: 25.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    4.0,
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
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 700.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 20.0,
                                                                0.0, 20.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            if (_model
                                                                    .filterByType ==
                                                                'basis') {
                                                              _model.filterByType =
                                                                  null;
                                                              setState(() {});
                                                            } else {
                                                              _model.filterByType =
                                                                  'basis';
                                                              setState(() {});
                                                            }

                                                            _model.returnListContractByTypeBasis =
                                                                await actions
                                                                    .filterContracts(
                                                              _model
                                                                  .originalListContracts
                                                                  .toList(),
                                                              _model
                                                                  .selectFilterCommodity,
                                                              _model
                                                                  .filterByType,
                                                              _model
                                                                  .textToSearchTextController
                                                                  .text,
                                                            );
                                                            _model.listContracts = _model
                                                                .returnListContractByTypeBasis!
                                                                .toList()
                                                                .cast<
                                                                    ContractsStruct>();
                                                            _model.isShowFullList =
                                                                false;
                                                            setState(() {});

                                                            setState(() {});
                                                          },
                                                          text: 'Basis',
                                                          icon: Icon(
                                                            Icons.circle,
                                                            color: Color(
                                                                0xFFC8BDEC),
                                                            size: 15.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.filterByType ==
                                                                      'basis'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .white,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                            ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            if (_model
                                                                    .filterByType ==
                                                                'fixed') {
                                                              _model.filterByType =
                                                                  null;
                                                              setState(() {});
                                                            } else {
                                                              _model.filterByType =
                                                                  'fixed';
                                                              setState(() {});
                                                            }

                                                            _model.returnListContractByTypeFixed =
                                                                await actions
                                                                    .filterContracts(
                                                              _model
                                                                  .originalListContracts
                                                                  .toList(),
                                                              _model
                                                                  .selectFilterCommodity,
                                                              _model
                                                                  .filterByType,
                                                              _model
                                                                  .textToSearchTextController
                                                                  .text,
                                                            );
                                                            _model.listContracts = _model
                                                                .returnListContractByTypeFixed!
                                                                .toList()
                                                                .cast<
                                                                    ContractsStruct>();
                                                            _model.isShowFullList =
                                                                false;
                                                            setState(() {});

                                                            setState(() {});
                                                          },
                                                          text: 'Fixed',
                                                          icon: Icon(
                                                            Icons.circle,
                                                            color: Color(
                                                                0xFFB8EBF3),
                                                            size: 15.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.filterByType ==
                                                                      'fixed'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .white,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .white,
                                                            ),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      final rowCommodities = _model
                                                          .listCommoditiesToFilter
                                                          .toList();
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: List.generate(
                                                            rowCommodities
                                                                .length,
                                                            (rowCommoditiesIndex) {
                                                          final rowCommoditiesItem =
                                                              rowCommodities[
                                                                  rowCommoditiesIndex];
                                                          return Expanded(
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                if (_model
                                                                        .selectFilterCommodity ==
                                                                    rowCommoditiesItem
                                                                        .id) {
                                                                  _model.selectFilterCommodity =
                                                                      null;
                                                                  setState(
                                                                      () {});
                                                                } else {
                                                                  _model.selectFilterCommodity =
                                                                      rowCommoditiesItem
                                                                          .id;
                                                                  setState(
                                                                      () {});
                                                                }

                                                                _model.returnListContractFiltered =
                                                                    await actions
                                                                        .filterContracts(
                                                                  _model
                                                                      .originalListContracts
                                                                      .toList(),
                                                                  _model
                                                                      .selectFilterCommodity,
                                                                  _model
                                                                      .filterByType,
                                                                  _model
                                                                      .textToSearchTextController
                                                                      .text,
                                                                );
                                                                _model.listContracts = _model
                                                                    .returnListContractFiltered!
                                                                    .toList()
                                                                    .cast<
                                                                        ContractsStruct>();
                                                                _model.isShowFullList =
                                                                    false;
                                                                setState(() {});

                                                                setState(() {});
                                                              },
                                                              text:
                                                                  rowCommoditiesItem
                                                                      .name,
                                                              options:
                                                                  FFButtonOptions(
                                                                width: double
                                                                    .infinity,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: _model
                                                                            .selectFilterCommodity ==
                                                                        rowCommoditiesItem
                                                                            .id
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate
                                                                    : (_model.selectFilterCommodity ==
                                                                            'null'
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .white
                                                                        : FlutterFlowTheme.of(context)
                                                                            .white),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                          );
                                                        }).divide(SizedBox(
                                                            width: 10.0)),
                                                      );
                                                    },
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  20.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final contractRow =
                                                              _model
                                                                  .listContracts
                                                                  .toList();
                                                          return FlutterFlowDataTable<
                                                              ContractsStruct>(
                                                            controller: _model
                                                                .paginatedDataTableController,
                                                            data: contractRow,
                                                            columnsBuilder:
                                                                (onSortChanged) =>
                                                                    [
                                                              DataColumn2(
                                                                label:
                                                                    DefaultTextStyle
                                                                        .merge(
                                                                  softWrap:
                                                                      true,
                                                                  child: Text(
                                                                    'Customer',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                                fixedWidth:
                                                                    180.0,
                                                                onSort:
                                                                    onSortChanged,
                                                              ),
                                                              DataColumn2(
                                                                label:
                                                                    DefaultTextStyle
                                                                        .merge(
                                                                  softWrap:
                                                                      true,
                                                                  child: Text(
                                                                    'Date',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                                fixedWidth:
                                                                    140.0,
                                                                onSort:
                                                                    onSortChanged,
                                                              ),
                                                              DataColumn2(
                                                                label:
                                                                    DefaultTextStyle
                                                                        .merge(
                                                                  softWrap:
                                                                      true,
                                                                  child: Text(
                                                                    'Quantity',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                                fixedWidth:
                                                                    150.0,
                                                                onSort:
                                                                    onSortChanged,
                                                              ),
                                                              DataColumn2(
                                                                label:
                                                                    DefaultTextStyle
                                                                        .merge(
                                                                  softWrap:
                                                                      true,
                                                                  child: Text(
                                                                    'Price',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                                fixedWidth:
                                                                    150.0,
                                                                onSort:
                                                                    onSortChanged,
                                                              ),
                                                              DataColumn2(
                                                                label:
                                                                    DefaultTextStyle
                                                                        .merge(
                                                                  softWrap:
                                                                      true,
                                                                  child: Text(
                                                                    'Basis',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                                fixedWidth:
                                                                    100.0,
                                                                onSort:
                                                                    onSortChanged,
                                                              ),
                                                              DataColumn2(
                                                                label:
                                                                    DefaultTextStyle
                                                                        .merge(
                                                                  softWrap:
                                                                      true,
                                                                  child: Text(
                                                                    'Id',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                                fixedWidth:
                                                                    150.0,
                                                                onSort:
                                                                    onSortChanged,
                                                              ),
                                                              DataColumn2(
                                                                label:
                                                                    DefaultTextStyle
                                                                        .merge(
                                                                  softWrap:
                                                                      true,
                                                                  child: Text(
                                                                    'Action',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          fontSize:
                                                                              12.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                            dataRowBuilder:
                                                                (contractRowItem,
                                                                        contractRowIndex,
                                                                        selected,
                                                                        onSelectChanged) =>
                                                                    DataRow(
                                                              color:
                                                                  MaterialStateProperty
                                                                      .all(
                                                                contractRowIndex %
                                                                            2 ==
                                                                        0
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .white
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .white,
                                                              ),
                                                              cells: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .circle_sharp,
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          contractRowItem.priceType == 'basis'
                                                                              ? Color(0xFFC8BDEC)
                                                                              : Color(0xFFB8EBF3),
                                                                          Color(
                                                                              0xFFB8EBF3),
                                                                        ),
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Text(
                                                                        contractRowItem
                                                                            .customer
                                                                            .maybeHandleOverflow(
                                                                          maxChars:
                                                                              12,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              color: Color(0xFF484857),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    functions.formatDateString(
                                                                        contractRowItem
                                                                            .date,
                                                                        'M/d/yyyy'),
                                                                    '- -',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: Color(
                                                                            0xFF484857),
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  (String quantity,
                                                                          String
                                                                              unit) {
                                                                    return '$quantity $unit.';
                                                                  }(
                                                                      functions.formatNumbersQuantity(
                                                                          contractRowItem
                                                                              .quantity,
                                                                          'es_ES',
                                                                          '#,##0.00'),
                                                                      contractRowItem
                                                                          .measurementUnit),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  (String simbol,
                                                                          String
                                                                              price) {
                                                                    return '$simbol $price';
                                                                  }('\$', contractRowItem.price.toString())
                                                                      .maybeHandleOverflow(
                                                                    maxChars:
                                                                        15,
                                                                    replacement:
                                                                        '…',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  (String simbol,
                                                                          String
                                                                              basis) {
                                                                    return '$simbol $basis';
                                                                  }('\$', contractRowItem.basis.toString())
                                                                      .maybeHandleOverflow(
                                                                    maxChars:
                                                                        15,
                                                                    replacement:
                                                                        '…',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: Color(
                                                                            0xFF234AFF),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Flexible(
                                                                        child:
                                                                            Text(
                                                                          contractRowItem
                                                                              .folio,
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                color: Color(0xFF484857),
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            4.0)),
                                                                  ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        20.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        40.0,
                                                                    icon:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .ellipsisV,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      await showAlignedDialog(
                                                                        context:
                                                                            context,
                                                                        isGlobal:
                                                                            false,
                                                                        avoidOverflow:
                                                                            false,
                                                                        targetAnchor:
                                                                            AlignmentDirectional(1.0, -1.0).resolve(Directionality.of(context)),
                                                                        followerAnchor:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        builder:
                                                                            (dialogContext) {
                                                                          return Material(
                                                                            color:
                                                                                Colors.transparent,
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                              child: PopOverMenuContractWidget(
                                                                                contractId: contractRowItem.id,
                                                                                contractType: contractRowItem.type,
                                                                                pricingType: contractRowItem.priceType,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          setState(
                                                                              () {}));
                                                                    },
                                                                  ),
                                                                ),
                                                              ]
                                                                  .map((c) =>
                                                                      DataCell(
                                                                          c))
                                                                  .toList(),
                                                            ),
                                                            onSortChanged:
                                                                (columnIndex,
                                                                    ascending) async {
                                                              _model.listContracts = functions
                                                                  .sortContractsColumns(
                                                                      ascending,
                                                                      columnIndex,
                                                                      _model
                                                                          .listContracts
                                                                          .toList())
                                                                  .toList()
                                                                  .cast<
                                                                      ContractsStruct>();
                                                              setState(() {});
                                                            },
                                                            paginated: true,
                                                            selectable: false,
                                                            hidePaginator:
                                                                false,
                                                            showFirstLastButtons:
                                                                true,
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            headingRowHeight:
                                                                56.0,
                                                            dataRowHeight: 64.0,
                                                            columnSpacing: 30.0,
                                                            headingRowColor:
                                                                Color(
                                                                    0xFFF0F4F8),
                                                            sortIconColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            addHorizontalDivider:
                                                                true,
                                                            addTopAndBottomDivider:
                                                                false,
                                                            hideDefaultHorizontalDivider:
                                                                true,
                                                            horizontalDividerColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                            horizontalDividerThickness:
                                                                1.0,
                                                            addVerticalDivider:
                                                                false,
                                                          );
                                                        },
                                                      ),
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (_model.spinnerVisible)
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: wrapWithModel(
                    model: _model.spinnerModel,
                    updateCallback: () => setState(() {}),
                    child: SpinnerWidget(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
