import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/components/base/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'view_people_details_w_m_model.dart';
export 'view_people_details_w_m_model.dart';

class ViewPeopleDetailsWMWidget extends StatefulWidget {
  const ViewPeopleDetailsWMWidget({
    super.key,
    required this.peopleId,
  });

  final String? peopleId;

  @override
  State<ViewPeopleDetailsWMWidget> createState() =>
      _ViewPeopleDetailsWMWidgetState();
}

class _ViewPeopleDetailsWMWidgetState extends State<ViewPeopleDetailsWMWidget> {
  late ViewPeopleDetailsWMModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewPeopleDetailsWMModel());

    _model.organizationNameFocusNode ??= FocusNode();

    _model.userNameFocusNode ??= FocusNode();

    _model.userLastNameFocusNode ??= FocusNode();

    _model.userEmailAddressFocusNode ??= FocusNode();

    _model.userCallingCodeFocusNode ??= FocusNode();

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
        final viewPeopleDetailsWMPeopleByIdResponse = snapshot.data!;
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
                          selectedNav: Pages.purchase_contracts,
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
                                                      valueOrDefault<String>(
                                                        CRMPeopleGroup
                                                            .peopleByIdCall
                                                            .respRole(
                                                          viewPeopleDetailsWMPeopleByIdResponse
                                                              .jsonBody,
                                                        ),
                                                        'Participant',
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
                                                      'Details',
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
                                                                text:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  CRMPeopleGroup
                                                                      .peopleByIdCall
                                                                      .respOrganizationName(
                                                                    viewPeopleDetailsWMPeopleByIdResponse
                                                                        .jsonBody,
                                                                  ),
                                                                  '--',
                                                                ),
                                                              ),
                                                              focusNode: _model
                                                                  .organizationNameFocusNode,
                                                              onFieldSubmitted:
                                                                  (_) async {
                                                                setState(() {
                                                                  _model.organizationNameTextController
                                                                          ?.text =
                                                                      valueOrDefault<
                                                                          String>(
                                                                    CRMPeopleGroup
                                                                        .peopleByIdCall
                                                                        .respOrganizationName(
                                                                      viewPeopleDetailsWMPeopleByIdResponse
                                                                          .jsonBody,
                                                                    ),
                                                                    '--',
                                                                  );
                                                                });
                                                              },
                                                              autofocus: false,
                                                              readOnly: true,
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
                                                                          ? '--'
                                                                          : firstName;
                                                                    }(
                                                                        _model
                                                                            .organizationNameTextController
                                                                            .text,
                                                                        CRMPeopleGroup
                                                                            .peopleByIdCall
                                                                            .respFirstName(
                                                                          viewPeopleDetailsWMPeopleByIdResponse
                                                                              .jsonBody,
                                                                        )!),
                                                                  ),
                                                                  focusNode: _model
                                                                      .userNameFocusNode,
                                                                  autofocus:
                                                                      false,
                                                                  readOnly:
                                                                      true,
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
                                                                    text: valueOrDefault<
                                                                        String>(
                                                                      CRMPeopleGroup
                                                                          .peopleByIdCall
                                                                          .respLastName(
                                                                        viewPeopleDetailsWMPeopleByIdResponse
                                                                            .jsonBody,
                                                                      ),
                                                                      '--',
                                                                    ),
                                                                  ),
                                                                  focusNode: _model
                                                                      .userLastNameFocusNode,
                                                                  autofocus:
                                                                      true,
                                                                  readOnly:
                                                                      true,
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
                                                                    text: valueOrDefault<
                                                                        String>(
                                                                      CRMPeopleGroup
                                                                          .peopleByIdCall
                                                                          .respEmail(
                                                                        viewPeopleDetailsWMPeopleByIdResponse
                                                                            .jsonBody,
                                                                      ),
                                                                      '--',
                                                                    ),
                                                                  ),
                                                                  focusNode: _model
                                                                      .userEmailAddressFocusNode,
                                                                  autofocus:
                                                                      true,
                                                                  readOnly:
                                                                      true,
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
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          child:
                                                                              TextFormField(
                                                                            controller: _model.userCallingCodeTextController ??=
                                                                                TextEditingController(
                                                                              text: valueOrDefault<String>(
                                                                                CRMPeopleGroup.peopleByIdCall.respCallingCode(
                                                                                  viewPeopleDetailsWMPeopleByIdResponse.jsonBody,
                                                                                ),
                                                                                '--',
                                                                              ),
                                                                            ),
                                                                            focusNode:
                                                                                _model.userCallingCodeFocusNode,
                                                                            autofocus:
                                                                                true,
                                                                            readOnly:
                                                                                true,
                                                                            obscureText:
                                                                                false,
                                                                            decoration:
                                                                                InputDecoration(
                                                                              labelText: 'Calling Code',
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
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  letterSpacing: 0.0,
                                                                                ),
                                                                            validator:
                                                                                _model.userCallingCodeTextControllerValidator.asValidator(context),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 8,
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
                                                                                valueOrDefault<String>(
                                                                              CRMPeopleGroup.peopleByIdCall.respPhoneNumber(
                                                                                viewPeopleDetailsWMPeopleByIdResponse.jsonBody,
                                                                              ),
                                                                              '--',
                                                                            ),
                                                                          ),
                                                                          focusNode:
                                                                              _model.userPhoneNumberFocusNode,
                                                                          autofocus:
                                                                              true,
                                                                          readOnly:
                                                                              true,
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
                                                                              valueOrDefault<String>(
                                                                            getJsonField(
                                                                              rowAddressPeopleResponse.jsonBody,
                                                                              r'''$.data[:].country''',
                                                                            )?.toString(),
                                                                            '--',
                                                                          ),
                                                                        ),
                                                                        focusNode:
                                                                            _model.userCountryFocusNode,
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
                                                                              valueOrDefault<String>(
                                                                            getJsonField(
                                                                              rowAddressPeopleResponse.jsonBody,
                                                                              r'''$.data[:].state''',
                                                                            )?.toString(),
                                                                            '--',
                                                                          ),
                                                                        ),
                                                                        focusNode:
                                                                            _model.userStateFocusNode,
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
                                                                                valueOrDefault<String>(
                                                                              getJsonField(
                                                                                rowAddressPeopleResponse.jsonBody,
                                                                                r'''$.data[:].city''',
                                                                              )?.toString(),
                                                                              '--',
                                                                            ),
                                                                          ),
                                                                          focusNode:
                                                                              _model.userCityFocusNode,
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
                                                                                valueOrDefault<String>(
                                                                              getJsonField(
                                                                                rowAddressPeopleResponse.jsonBody,
                                                                                r'''$.data[:].address_line_1''',
                                                                              )?.toString(),
                                                                              '--',
                                                                            ),
                                                                          ),
                                                                          focusNode:
                                                                              _model.userAddressFocusNode,
                                                                          autofocus:
                                                                              true,
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
                                                    FFButtonWidget(
                                                      onPressed: () async {
                                                        context.safePop();
                                                      },
                                                      text: 'Ok',
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
