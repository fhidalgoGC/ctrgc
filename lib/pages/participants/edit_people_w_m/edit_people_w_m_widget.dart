import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/base/side_nav/side_nav_widget.dart';
import '/components/locations/bottom_sheet_cities/bottom_sheet_cities_widget.dart';
import '/components/locations/bottom_sheet_countries/bottom_sheet_countries_widget.dart';
import '/components/locations/bottom_sheet_states/bottom_sheet_states_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_people_w_m_model.dart';
export 'edit_people_w_m_model.dart';

class EditPeopleWMWidget extends StatefulWidget {
  const EditPeopleWMWidget({
    super.key,
    required this.peopleRole,
    required this.peopleId,
  });

  final String? peopleRole;
  final String? peopleId;

  @override
  State<EditPeopleWMWidget> createState() => _EditPeopleWMWidgetState();
}

class _EditPeopleWMWidgetState extends State<EditPeopleWMWidget> {
  late EditPeopleWMModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditPeopleWMModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiPeopleResults = await CRMPeopleGroup.peopleByIdCall.call(
        partitionKey: FFAppState().partitionKey,
        authToken: currentAuthenticationToken,
        peopleId: widget.peopleId,
      );

      if ((_model.apiPeopleResults?.statusCode ?? 200) == 200) {
        _model.apiAddressResult =
            await CRMLocationsGroup.addressPeopleCall.call(
          partitionKey: FFAppState().partitionKey,
          authToken: currentAuthenticationToken,
          ownerId: widget.peopleId,
        );

        if ((_model.apiAddressResult?.statusCode ?? 200) == 200) {
          _model.editPeopleState = PeopleCreateStruct(
            idempotenceId: widget.peopleId,
            name: CRMPeopleGroup.peopleByIdCall.respFirstName(
              (_model.apiPeopleResults?.jsonBody ?? ''),
            ),
            lastName: CRMPeopleGroup.peopleByIdCall.respLastName(
              (_model.apiPeopleResults?.jsonBody ?? ''),
            ),
            fullName: (String firstName, String lastName) {
              return firstName + ' ' + lastName;
            }(
                CRMPeopleGroup.peopleByIdCall.respFirstName(
                  (_model.apiPeopleResults?.jsonBody ?? ''),
                )!,
                CRMPeopleGroup.peopleByIdCall.respLastName(
                  (_model.apiPeopleResults?.jsonBody ?? ''),
                )!),
            role: widget.peopleRole,
            email: CRMPeopleGroup.peopleByIdCall.respEmail(
              (_model.apiPeopleResults?.jsonBody ?? ''),
            ),
            callingCode: CRMPeopleGroup.peopleByIdCall.respCallingCode(
              (_model.apiPeopleResults?.jsonBody ?? ''),
            ),
            phoneNumber: CRMPeopleGroup.peopleByIdCall.respPhoneNumber(
              (_model.apiPeopleResults?.jsonBody ?? ''),
            ),
            countryId: getJsonField(
              (_model.apiAddressResult?.jsonBody ?? ''),
              r'''$.data[:].country_id''',
            ).toString().toString(),
            country: getJsonField(
              (_model.apiAddressResult?.jsonBody ?? ''),
              r'''$.data[:].country''',
            ).toString().toString(),
            stateId: getJsonField(
              (_model.apiAddressResult?.jsonBody ?? ''),
              r'''$.data[:].state_id''',
            ).toString().toString(),
            state: getJsonField(
              (_model.apiAddressResult?.jsonBody ?? ''),
              r'''$.data[:].state''',
            ).toString().toString(),
            cityId: getJsonField(
              (_model.apiAddressResult?.jsonBody ?? ''),
              r'''$.data[:].city_id''',
            ).toString().toString(),
            city: getJsonField(
              (_model.apiAddressResult?.jsonBody ?? ''),
              r'''$.data[:].city''',
            ).toString().toString(),
            addressLine1: getJsonField(
              (_model.apiAddressResult?.jsonBody ?? ''),
              r'''$.data[:].address_line_1''',
            ).toString().toString(),
          );
          setState(() {});
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Error geting address information',
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).error,
            ),
          );
          context.safePop();
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error geting participant information',
              style: TextStyle(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
        context.safePop();
      }
    });

    _model.organizationNameFocusNode ??= FocusNode();

    _model.userNameFocusNode ??= FocusNode();

    _model.userLastNameFocusNode ??= FocusNode();

    _model.userEmailAddressFocusNode ??= FocusNode();

    _model.userPhoneNumberFocusNode ??= FocusNode();

    _model.userCountryFocusNode ??= FocusNode();

    _model.userStateFocusNode ??= FocusNode();

    _model.userCityFocusNode ??= FocusNode();

    _model.userAddressFocusNode ??= FocusNode();

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

    return FutureBuilder<ApiCallResponse>(
      future: CRMPeopleGroup.peopleByIdCall.call(
        partitionKey: FFAppState().partitionKey,
        authToken: currentAuthenticationToken,
        peopleId: widget.peopleId,
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
        final editPeopleWMPeopleByIdResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: FutureBuilder<ApiCallResponse>(
                future: CRMLocationsGroup.addressPeopleCall.call(
                  partitionKey: FFAppState().partitionKey,
                  authToken: currentAuthenticationToken,
                  ownerId: widget.peopleId,
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
                  final rowAddressPeopleResponse = snapshot.data!;
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wrapWithModel(
                        model: _model.sideNavModel,
                        updateCallback: () => setState(() {}),
                        child: SideNavWidget(
                          selectedNav: widget.peopleRole == 'buyer'
                              ? Pages.buyers
                              : Pages.sellers,
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
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    valueOrDefault<double>(
                                      () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return functions
                                              .containerParentPadding(
                                                  MediaQuery.sizeOf(context)
                                                      .width);
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return functions
                                              .containerParentPadding(
                                                  MediaQuery.sizeOf(context)
                                                      .width);
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return functions
                                              .containerParentPadding(
                                                  MediaQuery.sizeOf(context)
                                                      .width);
                                        } else {
                                          return functions
                                              .containerParentPadding(
                                                  MediaQuery.sizeOf(context)
                                                      .width);
                                        }
                                      }(),
                                      0.0,
                                    ),
                                    10.0,
                                    valueOrDefault<double>(
                                      () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return functions
                                              .containerParentPadding(
                                                  MediaQuery.sizeOf(context)
                                                      .width);
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return functions
                                              .containerParentPadding(
                                                  MediaQuery.sizeOf(context)
                                                      .width);
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return functions
                                              .containerParentPadding(
                                                  MediaQuery.sizeOf(context)
                                                      .width);
                                        } else {
                                          return functions
                                              .containerParentPadding(
                                                  MediaQuery.sizeOf(context)
                                                      .width);
                                        }
                                      }(),
                                      0.0,
                                    ),
                                    10.0),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 11.42,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          child: Container(
                                            width:
                                                functions.containerBodyWidthRv(
                                                    MediaQuery.sizeOf(context)
                                                        .width),
                                            constraints: BoxConstraints(
                                              minWidth: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return functions
                                                      .containerBodyWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width);
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return functions
                                                      .containerBodyWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width);
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return functions
                                                      .containerBodyWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width);
                                                } else {
                                                  return functions
                                                      .containerBodyWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
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
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width);
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return functions
                                                      .containerBodyWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width);
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return functions
                                                      .containerBodyWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width);
                                                } else {
                                                  return functions
                                                      .containerBodyWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width);
                                                }
                                              }(),
                                            ),
                                            decoration: BoxDecoration(),
                                            child: Row(
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
                                                      'Edit',
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
                                                                FontWeight.w600,
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
                                                        widget.peopleRole,
                                                        'Seller',
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
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 10.0)),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          child: Container(
                                            width:
                                                functions.containerBodyWidthRv(
                                                    MediaQuery.sizeOf(context)
                                                        .width),
                                            constraints: BoxConstraints(
                                              minWidth: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return functions
                                                      .containerBodyWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width);
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return functions
                                                      .containerBodyWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width);
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return functions
                                                      .containerBodyWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width);
                                                } else {
                                                  return functions
                                                      .containerBodyWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width);
                                                }
                                              }(),
                                              minHeight: 200.0,
                                              maxWidth: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return functions
                                                      .containerBodyWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width);
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return functions
                                                      .containerBodyWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width);
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return functions
                                                      .containerBodyWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width);
                                                } else {
                                                  return functions
                                                      .containerBodyWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width);
                                                }
                                              }(),
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Text(
                                                          'Please fill the user basic information form to create it',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
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
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 60.0,
                                                          constraints:
                                                              BoxConstraints(
                                                            minWidth: functions
                                                                .containerBodyWidthRv(
                                                                    MediaQuery.sizeOf(
                                                                            context)
                                                                        .width),
                                                            maxWidth: functions
                                                                .containerBodyWidthRv(
                                                                    MediaQuery.sizeOf(
                                                                            context)
                                                                        .width),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(),
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                      .organizationNameTextController ??=
                                                                  TextEditingController(
                                                                text: CRMPeopleGroup
                                                                    .peopleByIdCall
                                                                    .respOrganizationName(
                                                                  editPeopleWMPeopleByIdResponse
                                                                      .jsonBody,
                                                                ),
                                                              ),
                                                              focusNode: _model
                                                                  .organizationNameFocusNode,
                                                              onChanged: (_) =>
                                                                  EasyDebounce
                                                                      .debounce(
                                                                '_model.organizationNameTextController',
                                                                Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                () async {
                                                                  // peopleChanged
                                                                  _model.peopleEdited =
                                                                      true;
                                                                  setState(
                                                                      () {});
                                                                },
                                                              ),
                                                              onFieldSubmitted:
                                                                  (_) async {
                                                                setState(() {
                                                                  _model.organizationNameTextController
                                                                          ?.text =
                                                                      CRMPeopleGroup
                                                                          .peopleByIdCall
                                                                          .respOrganizationName(
                                                                    editPeopleWMPeopleByIdResponse
                                                                        .jsonBody,
                                                                  )!;
                                                                });
                                                              },
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Organization Name',
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                hintStyle: FlutterFlowTheme.of(
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
                                                                              4.0),
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
                                                                              4.0),
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
                                                                              4.0),
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
                                                                              4.0),
                                                                ),
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
                                                                  .organizationNameTextControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
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
                                                              width: 551.0,
                                                              height: 70.0,
                                                              constraints:
                                                                  BoxConstraints(
                                                                minWidth: functions.containerControlWidthRv(
                                                                    MediaQuery.sizeOf(
                                                                            context)
                                                                        .width,
                                                                    functions.containerBodyWidthRv(
                                                                        MediaQuery.sizeOf(context)
                                                                            .width))!,
                                                                maxWidth: functions.containerControlWidthRv(
                                                                    MediaQuery.sizeOf(
                                                                            context)
                                                                        .width,
                                                                    functions.containerBodyWidthRv(
                                                                        MediaQuery.sizeOf(context)
                                                                            .width))!,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                          .userNameTextController ??=
                                                                      TextEditingController(
                                                                    text: (String?
                                                                                orgName,
                                                                            String
                                                                                firstName) {
                                                                      return orgName ==
                                                                              firstName
                                                                          ? ''
                                                                          : firstName;
                                                                    }(
                                                                        CRMPeopleGroup
                                                                            .peopleByIdCall
                                                                            .respOrganizationName(
                                                                          editPeopleWMPeopleByIdResponse
                                                                              .jsonBody,
                                                                        ),
                                                                        CRMPeopleGroup
                                                                            .peopleByIdCall
                                                                            .respFirstName(
                                                                          editPeopleWMPeopleByIdResponse
                                                                              .jsonBody,
                                                                        )!),
                                                                  ),
                                                                  focusNode: _model
                                                                      .userNameFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.userNameTextController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    () async {
                                                                      // peopleChanged
                                                                      _model.peopleEdited =
                                                                          true;
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                  ),
                                                                  autofocus:
                                                                      false,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Name',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  validator: _model
                                                                      .userNameTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 551.0,
                                                              height: 70.0,
                                                              constraints:
                                                                  BoxConstraints(
                                                                minWidth: functions.containerControlWidthRv(
                                                                    MediaQuery.sizeOf(
                                                                            context)
                                                                        .width,
                                                                    functions.containerBodyWidthRv(
                                                                        MediaQuery.sizeOf(context)
                                                                            .width))!,
                                                                maxWidth: functions.containerControlWidthRv(
                                                                    MediaQuery.sizeOf(
                                                                            context)
                                                                        .width,
                                                                    functions.containerBodyWidthRv(
                                                                        MediaQuery.sizeOf(context)
                                                                            .width))!,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                          .userLastNameTextController ??=
                                                                      TextEditingController(
                                                                    text: CRMPeopleGroup
                                                                        .peopleByIdCall
                                                                        .respLastName(
                                                                      editPeopleWMPeopleByIdResponse
                                                                          .jsonBody,
                                                                    ),
                                                                  ),
                                                                  focusNode: _model
                                                                      .userLastNameFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.userLastNameTextController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    () async {
                                                                      // peopleChanged
                                                                      _model.peopleEdited =
                                                                          true;
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                  ),
                                                                  autofocus:
                                                                      false,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Last name',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  validator: _model
                                                                      .userLastNameTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
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
                                                              width: 551.0,
                                                              height: 60.0,
                                                              constraints:
                                                                  BoxConstraints(
                                                                minWidth: functions.containerControlWidthRv(
                                                                    MediaQuery.sizeOf(
                                                                            context)
                                                                        .width,
                                                                    functions.containerBodyWidthRv(
                                                                        MediaQuery.sizeOf(context)
                                                                            .width))!,
                                                                maxWidth: functions.containerControlWidthRv(
                                                                    MediaQuery.sizeOf(
                                                                            context)
                                                                        .width,
                                                                    functions.containerBodyWidthRv(
                                                                        MediaQuery.sizeOf(context)
                                                                            .width))!,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                          .userEmailAddressTextController ??=
                                                                      TextEditingController(
                                                                    text: CRMPeopleGroup
                                                                        .peopleByIdCall
                                                                        .respEmail(
                                                                      editPeopleWMPeopleByIdResponse
                                                                          .jsonBody,
                                                                    ),
                                                                  ),
                                                                  focusNode: _model
                                                                      .userEmailAddressFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.userEmailAddressTextController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    () async {
                                                                      // peopleChanged
                                                                      _model.peopleEdited =
                                                                          true;
                                                                      setState(
                                                                          () {});
                                                                    },
                                                                  ),
                                                                  autofocus:
                                                                      false,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Email',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    suffixIcon:
                                                                        Icon(
                                                                      Icons
                                                                          .email_outlined,
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  validator: _model
                                                                      .userEmailAddressTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 551.0,
                                                              height: 60.0,
                                                              constraints:
                                                                  BoxConstraints(
                                                                minWidth: functions.containerControlWidthRv(
                                                                    MediaQuery.sizeOf(
                                                                            context)
                                                                        .width,
                                                                    functions.containerBodyWidthRv(
                                                                        MediaQuery.sizeOf(context)
                                                                            .width))!,
                                                                maxWidth: functions.containerControlWidthRv(
                                                                    MediaQuery.sizeOf(
                                                                            context)
                                                                        .width,
                                                                    functions.containerBodyWidthRv(
                                                                        MediaQuery.sizeOf(context)
                                                                            .width))!,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child: FlutterFlowDropDown<
                                                                            String>(
                                                                          controller: _model.callingCodeValueController ??=
                                                                              FormFieldController<String>(
                                                                            _model.callingCodeValue ??=
                                                                                CRMPeopleGroup.peopleByIdCall.respCallingCode(
                                                                              editPeopleWMPeopleByIdResponse.jsonBody,
                                                                            ),
                                                                          ),
                                                                          options:
                                                                              List<String>.from([
                                                                            '+1',
                                                                            '+52'
                                                                          ]),
                                                                          optionLabels: [
                                                                            '+1',
                                                                            '+52'
                                                                          ],
                                                                          onChanged:
                                                                              (val) async {
                                                                            setState(() =>
                                                                                _model.callingCodeValue = val); // peopleChanged
                                                                            _model.peopleEdited =
                                                                                true;
                                                                            setState(() {});
                                                                          },
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              double.infinity,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          hintText:
                                                                              'Select',
                                                                          icon:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.sortDown,
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
                                                                              false,
                                                                          isSearchable:
                                                                              false,
                                                                          isMultiSelect:
                                                                              false,
                                                                          labelText:
                                                                              'Calling code',
                                                                          labelTextStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 6,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.userPhoneNumberTextController ??=
                                                                              TextEditingController(
                                                                            text:
                                                                                CRMPeopleGroup.peopleByIdCall.respPhoneNumber(
                                                                              editPeopleWMPeopleByIdResponse.jsonBody,
                                                                            ),
                                                                          ),
                                                                          focusNode:
                                                                              _model.userPhoneNumberFocusNode,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.userPhoneNumberTextController',
                                                                            Duration(milliseconds: 2000),
                                                                            () async {
                                                                              // peopleChanged
                                                                              _model.peopleEdited = true;
                                                                              setState(() {});
                                                                            },
                                                                          ),
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'Phone number',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelLarge.override(
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
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            suffixIcon:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.phoneAlt,
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .userPhoneNumberTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
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
                                                              width: 551.0,
                                                              height: 70.0,
                                                              constraints:
                                                                  BoxConstraints(
                                                                minWidth: functions.containerControlWidthRv(
                                                                    MediaQuery.sizeOf(
                                                                            context)
                                                                        .width,
                                                                    functions.containerBodyWidthRv(
                                                                        MediaQuery.sizeOf(context)
                                                                            .width))!,
                                                                maxWidth: functions.containerControlWidthRv(
                                                                    MediaQuery.sizeOf(
                                                                            context)
                                                                        .width,
                                                                    functions.containerBodyWidthRv(
                                                                        MediaQuery.sizeOf(context)
                                                                            .width))!,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.userCountryTextController ??=
                                                                                TextEditingController(
                                                                          text:
                                                                              getJsonField(
                                                                            rowAddressPeopleResponse.jsonBody,
                                                                            r'''$.data[:].country''',
                                                                          ).toString(),
                                                                        ),
                                                                        focusNode:
                                                                            _model.userCountryFocusNode,
                                                                        onChanged:
                                                                            (_) =>
                                                                                EasyDebounce.debounce(
                                                                          '_model.userCountryTextController',
                                                                          Duration(
                                                                              milliseconds: 2000),
                                                                          () async {
                                                                            // peopleChanged
                                                                            _model.addressEdited =
                                                                                true;
                                                                            setState(() {});
                                                                          },
                                                                        ),
                                                                        autofocus:
                                                                            false,
                                                                        readOnly:
                                                                            true,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelText:
                                                                              'Select Country',
                                                                          labelStyle: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        validator: _model
                                                                            .userCountryTextControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                  ))
                                                                    Builder(
                                                                      builder:
                                                                          (context) =>
                                                                              Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            FlutterFlowIconButton(
                                                                          borderRadius:
                                                                              8.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              40.0,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.edit_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            if (isWeb ==
                                                                                true) {
                                                                              await showDialog(
                                                                                barrierColor: Color(0x19FFFFFF),
                                                                                context: context,
                                                                                builder: (dialogContext) {
                                                                                  return Dialog(
                                                                                    elevation: 0,
                                                                                    insetPadding: EdgeInsets.zero,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                    child: GestureDetector(
                                                                                      onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                      child: Container(
                                                                                        height: 600.0,
                                                                                        width: 400.0,
                                                                                        child: BottomSheetCountriesWidget(
                                                                                          locationSelected: (selectedItem) async {
                                                                                            setState(() {
                                                                                              _model.userCountryTextController?.text = getJsonField(
                                                                                                selectedItem,
                                                                                                r'''$.name''',
                                                                                              ).toString();
                                                                                              _model.userCountryTextController?.selection = TextSelection.collapsed(offset: _model.userCountryTextController!.text.length);
                                                                                            });
                                                                                            setState(() {
                                                                                              _model.userStateTextController?.clear();
                                                                                              _model.userCityTextController?.clear();
                                                                                            });
                                                                                            _model.updateEditPeopleStateStruct(
                                                                                              (e) => e
                                                                                                ..country = _model.userCountryTextController.text
                                                                                                ..countryId = getJsonField(
                                                                                                  selectedItem,
                                                                                                  r'''$._id''',
                                                                                                ).toString()
                                                                                                ..countrySlug = getJsonField(
                                                                                                  selectedItem,
                                                                                                  r'''$.slug''',
                                                                                                ).toString(),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => setState(() {}));
                                                                            } else {
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                backgroundColor: Color(0x19FFFFFF),
                                                                                enableDrag: false,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return GestureDetector(
                                                                                    onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                    child: Padding(
                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                      child: Container(
                                                                                        height: 400.0,
                                                                                        child: BottomSheetCountriesWidget(
                                                                                          locationSelected: (selectedItem) async {
                                                                                            setState(() {
                                                                                              _model.userCountryTextController?.text = getJsonField(
                                                                                                selectedItem,
                                                                                                r'''$.name''',
                                                                                              ).toString();
                                                                                              _model.userCountryTextController?.selection = TextSelection.collapsed(offset: _model.userCountryTextController!.text.length);
                                                                                            });
                                                                                            setState(() {
                                                                                              _model.userStateTextController?.clear();
                                                                                              _model.userCityTextController?.clear();
                                                                                            });
                                                                                            _model.updateEditPeopleStateStruct(
                                                                                              (e) => e
                                                                                                ..country = getJsonField(
                                                                                                  selectedItem,
                                                                                                  r'''$.name''',
                                                                                                ).toString()
                                                                                                ..countryId = getJsonField(
                                                                                                  selectedItem,
                                                                                                  r'''$._id''',
                                                                                                ).toString()
                                                                                                ..countrySlug = getJsonField(
                                                                                                  selectedItem,
                                                                                                  r'''$.slug''',
                                                                                                ).toString(),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => safeSetState(() {}));
                                                                            }
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 551.0,
                                                              height: 70.0,
                                                              constraints:
                                                                  BoxConstraints(
                                                                minWidth: functions.containerControlWidthRv(
                                                                    MediaQuery.sizeOf(
                                                                            context)
                                                                        .width,
                                                                    functions.containerBodyWidthRv(
                                                                        MediaQuery.sizeOf(context)
                                                                            .width))!,
                                                                maxWidth: functions.containerControlWidthRv(
                                                                    MediaQuery.sizeOf(
                                                                            context)
                                                                        .width,
                                                                    functions.containerBodyWidthRv(
                                                                        MediaQuery.sizeOf(context)
                                                                            .width))!,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.userStateTextController ??=
                                                                                TextEditingController(
                                                                          text:
                                                                              getJsonField(
                                                                            rowAddressPeopleResponse.jsonBody,
                                                                            r'''$.data[:].state''',
                                                                          ).toString(),
                                                                        ),
                                                                        focusNode:
                                                                            _model.userStateFocusNode,
                                                                        onChanged:
                                                                            (_) =>
                                                                                EasyDebounce.debounce(
                                                                          '_model.userStateTextController',
                                                                          Duration(
                                                                              milliseconds: 2000),
                                                                          () async {
                                                                            // peopleChanged
                                                                            _model.addressEdited =
                                                                                true;
                                                                            setState(() {});
                                                                          },
                                                                        ),
                                                                        autofocus:
                                                                            false,
                                                                        readOnly:
                                                                            true,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelText:
                                                                              'Select State',
                                                                          labelStyle: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          enabledBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                          focusedBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                          errorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: FlutterFlowTheme.of(context).error,
                                                                              width: 2.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                        validator: _model
                                                                            .userStateTextControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            8.0,
                                                                        borderWidth:
                                                                            1.0,
                                                                        buttonSize:
                                                                            40.0,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        disabledColor:
                                                                            Color(0x6314840D),
                                                                        disabledIconColor:
                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .edit_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        onPressed: (_model.userCountryTextController.text == null ||
                                                                                _model.userCountryTextController.text == '')
                                                                            ? null
                                                                            : () async {
                                                                                if (isWeb == false) {
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Color(0x19FFFFFF),
                                                                                    enableDrag: false,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return GestureDetector(
                                                                                        onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                          child: Container(
                                                                                            height: 500.0,
                                                                                            child: BottomSheetStatesWidget(
                                                                                              countrySlug: _model.editPeopleState!.countrySlug,
                                                                                              locationSelected: (selectedItem) async {
                                                                                                setState(() {
                                                                                                  _model.userStateTextController?.text = getJsonField(
                                                                                                    selectedItem,
                                                                                                    r'''$.name''',
                                                                                                  ).toString();
                                                                                                  _model.userStateTextController?.selection = TextSelection.collapsed(offset: _model.userStateTextController!.text.length);
                                                                                                });
                                                                                                setState(() {
                                                                                                  _model.userCityTextController?.clear();
                                                                                                });
                                                                                                _model.updateEditPeopleStateStruct(
                                                                                                  (e) => e
                                                                                                    ..stateId = getJsonField(
                                                                                                      selectedItem,
                                                                                                      r'''$._id''',
                                                                                                    ).toString()
                                                                                                    ..state = getJsonField(
                                                                                                      selectedItem,
                                                                                                      r'''$.name''',
                                                                                                    ).toString(),
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => safeSetState(() {}));
                                                                                } else {
                                                                                  await showDialog(
                                                                                    barrierColor: Color(0x1AFFFFFF),
                                                                                    context: context,
                                                                                    builder: (dialogContext) {
                                                                                      return Dialog(
                                                                                        elevation: 0,
                                                                                        insetPadding: EdgeInsets.zero,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                        child: GestureDetector(
                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                          child: Container(
                                                                                            height: 600.0,
                                                                                            width: 400.0,
                                                                                            child: BottomSheetStatesWidget(
                                                                                              countrySlug: _model.editPeopleState!.countrySlug,
                                                                                              locationSelected: (selectedItem) async {
                                                                                                setState(() {
                                                                                                  _model.userStateTextController?.text = getJsonField(
                                                                                                    selectedItem,
                                                                                                    r'''$.name''',
                                                                                                  ).toString();
                                                                                                  _model.userStateTextController?.selection = TextSelection.collapsed(offset: _model.userStateTextController!.text.length);
                                                                                                });
                                                                                                setState(() {
                                                                                                  _model.userCityTextController?.clear();
                                                                                                });
                                                                                                _model.updateEditPeopleStateStruct(
                                                                                                  (e) => e
                                                                                                    ..state = getJsonField(
                                                                                                      selectedItem,
                                                                                                      r'''$.name''',
                                                                                                    ).toString()
                                                                                                    ..stateId = getJsonField(
                                                                                                      selectedItem,
                                                                                                      r'''$._id''',
                                                                                                    ).toString(),
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => setState(() {}));
                                                                                }
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
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          5.0),
                                                              child: Container(
                                                                width: 551.0,
                                                                height: 60.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minWidth: functions.containerControlWidthRv(
                                                                      MediaQuery.sizeOf(
                                                                              context)
                                                                          .width,
                                                                      functions.containerBodyWidthRv(
                                                                          MediaQuery.sizeOf(context)
                                                                              .width))!,
                                                                  maxWidth: functions.containerControlWidthRv(
                                                                      MediaQuery.sizeOf(
                                                                              context)
                                                                          .width,
                                                                      functions.containerBodyWidthRv(
                                                                          MediaQuery.sizeOf(context)
                                                                              .width))!,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.userCityTextController ??=
                                                                              TextEditingController(
                                                                            text:
                                                                                getJsonField(
                                                                              rowAddressPeopleResponse.jsonBody,
                                                                              r'''$.data[:].city''',
                                                                            ).toString(),
                                                                          ),
                                                                          focusNode:
                                                                              _model.userCityFocusNode,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.userCityTextController',
                                                                            Duration(milliseconds: 2000),
                                                                            () async {
                                                                              // peopleChanged
                                                                              _model.addressEdited = true;
                                                                              setState(() {});
                                                                            },
                                                                          ),
                                                                          autofocus:
                                                                              false,
                                                                          readOnly:
                                                                              true,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'Select City',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelLarge.override(
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
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .userCityTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Builder(
                                                                      builder:
                                                                          (context) =>
                                                                              Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              8.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              40.0,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          disabledColor:
                                                                              Color(0x6314840D),
                                                                          disabledIconColor:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.edit_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          onPressed: (_model.userStateTextController.text == null || _model.userStateTextController.text == '')
                                                                              ? null
                                                                              : () async {
                                                                                  if (isWeb == false) {
                                                                                    await showModalBottomSheet(
                                                                                      isScrollControlled: true,
                                                                                      backgroundColor: Color(0x1AFFFFFF),
                                                                                      enableDrag: false,
                                                                                      context: context,
                                                                                      builder: (context) {
                                                                                        return GestureDetector(
                                                                                          onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: Container(
                                                                                              height: 400.0,
                                                                                              child: BottomSheetCitiesWidget(
                                                                                                countrySlug: _model.editPeopleState!.countrySlug,
                                                                                                stateId: _model.editPeopleState!.stateId,
                                                                                                locationSelected: (selectedItem) async {
                                                                                                  setState(() {
                                                                                                    _model.userCityTextController?.text = getJsonField(
                                                                                                      selectedItem,
                                                                                                      r'''$.name''',
                                                                                                    ).toString();
                                                                                                    _model.userCityTextController?.selection = TextSelection.collapsed(offset: _model.userCityTextController!.text.length);
                                                                                                  });
                                                                                                  _model.updateEditPeopleStateStruct(
                                                                                                    (e) => e
                                                                                                      ..city = getJsonField(
                                                                                                        selectedItem,
                                                                                                        r'''$.name''',
                                                                                                      ).toString()
                                                                                                      ..cityId = getJsonField(
                                                                                                        selectedItem,
                                                                                                        r'''$._id''',
                                                                                                      ).toString(),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => safeSetState(() {}));
                                                                                  } else {
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (dialogContext) {
                                                                                        return Dialog(
                                                                                          elevation: 0,
                                                                                          insetPadding: EdgeInsets.zero,
                                                                                          backgroundColor: Colors.transparent,
                                                                                          alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                          child: GestureDetector(
                                                                                            onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                            child: Container(
                                                                                              height: 600.0,
                                                                                              width: 400.0,
                                                                                              child: BottomSheetCitiesWidget(
                                                                                                stateId: _model.editPeopleState!.stateId,
                                                                                                countrySlug: _model.editPeopleState!.countrySlug,
                                                                                                locationSelected: (selectedItem) async {
                                                                                                  setState(() {
                                                                                                    _model.userCityTextController?.text = getJsonField(
                                                                                                      selectedItem,
                                                                                                      r'''$.name''',
                                                                                                    ).toString();
                                                                                                    _model.userCityTextController?.selection = TextSelection.collapsed(offset: _model.userCityTextController!.text.length);
                                                                                                  });
                                                                                                  _model.updateEditPeopleStateStruct(
                                                                                                    (e) => e
                                                                                                      ..city = getJsonField(
                                                                                                        selectedItem,
                                                                                                        r'''$.name''',
                                                                                                      ).toString()
                                                                                                      ..cityId = getJsonField(
                                                                                                        selectedItem,
                                                                                                        r'''$._id''',
                                                                                                      ).toString(),
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => setState(() {}));
                                                                                  }
                                                                                },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          5.0),
                                                              child: Container(
                                                                width: 551.0,
                                                                height: 60.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minWidth: functions.containerControlWidthRv(
                                                                      MediaQuery.sizeOf(
                                                                              context)
                                                                          .width,
                                                                      functions.containerBodyWidthRv(
                                                                          MediaQuery.sizeOf(context)
                                                                              .width))!,
                                                                  maxWidth: functions.containerControlWidthRv(
                                                                      MediaQuery.sizeOf(
                                                                              context)
                                                                          .width,
                                                                      functions.containerBodyWidthRv(
                                                                          MediaQuery.sizeOf(context)
                                                                              .width))!,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.userAddressTextController ??=
                                                                              TextEditingController(
                                                                            text:
                                                                                getJsonField(
                                                                              rowAddressPeopleResponse.jsonBody,
                                                                              r'''$.data[:].address_line_1''',
                                                                            ).toString(),
                                                                          ),
                                                                          focusNode:
                                                                              _model.userAddressFocusNode,
                                                                          onChanged: (_) =>
                                                                              EasyDebounce.debounce(
                                                                            '_model.userAddressTextController',
                                                                            Duration(milliseconds: 2000),
                                                                            () async {
                                                                              // peopleChanged
                                                                              _model.addressEdited = true;
                                                                              setState(() {});
                                                                            },
                                                                          ),
                                                                          autofocus:
                                                                              false,
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            labelText:
                                                                                'Address',
                                                                            labelStyle: FlutterFlowTheme.of(context).labelLarge.override(
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
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                width: 2.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Inter',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                          validator: _model
                                                                              .userAddressTextControllerValidator
                                                                              .asValidator(context),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          20.0)),
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
                                                  width: 100.0,
                                                  height: 24.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          child: Container(
                                            width:
                                                functions.containerBodyWidthRv(
                                                    MediaQuery.sizeOf(context)
                                                        .width),
                                            constraints: BoxConstraints(
                                              minWidth: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return functions
                                                      .containerBodyWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width);
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return functions
                                                      .containerBodyWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width);
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return functions
                                                      .containerBodyWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width);
                                                } else {
                                                  return functions
                                                      .containerBodyWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width);
                                                }
                                              }(),
                                              minHeight: 50.0,
                                              maxWidth: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return functions
                                                      .containerBodyWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width);
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointMedium) {
                                                  return functions
                                                      .containerBodyWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width);
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    kBreakpointLarge) {
                                                  return functions
                                                      .containerBodyWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width);
                                                } else {
                                                  return functions
                                                      .containerBodyWidthRv(
                                                          MediaQuery.sizeOf(
                                                                  context)
                                                              .width);
                                                }
                                              }(),
                                            ),
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 20.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          context.safePop();
                                                        },
                                                        text: 'Cancel',
                                                        options:
                                                            FFButtonOptions(
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
                                                          color:
                                                              Color(0xB6FF0010),
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
                                                    ),
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        _model
                                                            .updateEditPeopleStateStruct(
                                                          (e) => e
                                                            ..name = _model
                                                                .userNameTextController
                                                                .text
                                                            ..lastName = _model
                                                                .userLastNameTextController
                                                                .text
                                                            ..email = _model
                                                                .userEmailAddressTextController
                                                                .text
                                                            ..callingCode = _model
                                                                .callingCodeValue
                                                            ..phoneNumber = _model
                                                                .userPhoneNumberTextController
                                                                .text
                                                            ..addressLine1 = _model
                                                                .userAddressTextController
                                                                .text,
                                                        );
                                                        setState(() {});
                                                        if ((_model.userNameTextController
                                                                        .text ==
                                                                    null ||
                                                                _model.userNameTextController
                                                                        .text ==
                                                                    '') &&
                                                            (_model.organizationNameTextController
                                                                        .text !=
                                                                    null &&
                                                                _model.organizationNameTextController
                                                                        .text !=
                                                                    '')) {
                                                          _model
                                                              .updateEditPeopleStateStruct(
                                                            (e) => e
                                                              ..name = _model
                                                                  .organizationNameTextController
                                                                  .text
                                                              ..fullName = _model
                                                                  .organizationNameTextController
                                                                  .text,
                                                          );
                                                          setState(() {});
                                                          setState(() {
                                                            _model.userNameTextController
                                                                    ?.text =
                                                                _model
                                                                    .organizationNameTextController
                                                                    .text;
                                                            _model.userNameTextController
                                                                    ?.selection =
                                                                TextSelection.collapsed(
                                                                    offset: _model
                                                                        .userNameTextController!
                                                                        .text
                                                                        .length);
                                                          });
                                                        }
                                                        await Future.wait([
                                                          Future(() async {
                                                            if (_model
                                                                    .peopleEdited ==
                                                                true) {
                                                              _model.apiPeoplePutResult =
                                                                  await CRMPeopleGroup
                                                                      .createPeopleCall
                                                                      .call(
                                                                idempotenceId:
                                                                    widget
                                                                        .peopleId,
                                                                bodyName: _model
                                                                    .editPeopleState
                                                                    ?.name,
                                                                bodyLastName: _model
                                                                    .editPeopleState
                                                                    ?.lastName,
                                                                bodyRole: _model
                                                                    .editPeopleState
                                                                    ?.role,
                                                                bodyEmail: _model
                                                                    .editPeopleState
                                                                    ?.email,
                                                                bodyCallingCode: _model
                                                                    .editPeopleState
                                                                    ?.callingCode,
                                                                bodyPhoneNumber: _model
                                                                    .editPeopleState
                                                                    ?.phoneNumber,
                                                                fullName: _model.organizationNameTextController.text !=
                                                                            null &&
                                                                        _model.organizationNameTextController.text !=
                                                                            ''
                                                                    ? _model
                                                                        .organizationNameTextController
                                                                        .text
                                                                    : ((String firstName,
                                                                            String
                                                                                lastName) {
                                                                        return firstName +
                                                                            ' ' +
                                                                            lastName;
                                                                      }(
                                                                        _model
                                                                            .userNameTextController
                                                                            .text,
                                                                        _model
                                                                            .userLastNameTextController
                                                                            .text)),
                                                                partitionKey:
                                                                    FFAppState()
                                                                        .partitionKey,
                                                                authToken:
                                                                    currentAuthenticationToken,
                                                                organizationName:
                                                                    _model
                                                                        .organizationNameTextController
                                                                        .text,
                                                              );

                                                              if ((_model.apiPeoplePutResult
                                                                          ?.statusCode ??
                                                                      200) ==
                                                                  200) {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .clearSnackBars();
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Participant Updated',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .success,
                                                                  ),
                                                                );
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .clearSnackBars();
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Error Updating Participant Info',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                  ),
                                                                );
                                                              }
                                                            }
                                                          }),
                                                          Future(() async {
                                                            if (_model
                                                                    .addressEdited ==
                                                                true) {
                                                              _model.apiAddresPutResult =
                                                                  await CRMLocationsGroup
                                                                      .addressUpdateCall
                                                                      .call(
                                                                addressId:
                                                                    getJsonField(
                                                                  rowAddressPeopleResponse
                                                                      .jsonBody,
                                                                  r'''$.data[0]._id''',
                                                                ).toString(),
                                                                ownerId: _model
                                                                    .editPeopleState
                                                                    ?.idempotenceId,
                                                                countryId: _model
                                                                    .editPeopleState
                                                                    ?.countryId,
                                                                countryName: _model
                                                                    .editPeopleState
                                                                    ?.country,
                                                                stateId: _model
                                                                    .editPeopleState
                                                                    ?.stateId,
                                                                stateName: _model
                                                                    .editPeopleState
                                                                    ?.state,
                                                                cityId: _model
                                                                    .editPeopleState
                                                                    ?.cityId,
                                                                cityName: _model
                                                                    .editPeopleState
                                                                    ?.city,
                                                                addressLine1: _model
                                                                    .editPeopleState
                                                                    ?.addressLine1,
                                                                partitionKey:
                                                                    FFAppState()
                                                                        .partitionKey,
                                                                authToken:
                                                                    currentAuthenticationToken,
                                                              );

                                                              if ((_model.apiAddresPutResult
                                                                          ?.statusCode ??
                                                                      200) ==
                                                                  200) {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .clearSnackBars();
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Participant Updated',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .success,
                                                                  ),
                                                                );
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .clearSnackBars();
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Error Updating Participant Address Info',
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            4000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                  ),
                                                                );
                                                              }
                                                            }
                                                          }),
                                                        ]);
                                                        if (widget.peopleRole ==
                                                            'seller') {
                                                          context.pushNamed(
                                                              'ListSellersW');
                                                        } else {
                                                          context.pushNamed(
                                                              'ListBuyersW');
                                                        }

                                                        setState(() {});
                                                      },
                                                      text: 'Update',
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
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
