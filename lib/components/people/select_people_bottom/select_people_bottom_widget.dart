import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/people/row_list_view_people/row_list_view_people_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'select_people_bottom_model.dart';
export 'select_people_bottom_model.dart';

class SelectPeopleBottomWidget extends StatefulWidget {
  const SelectPeopleBottomWidget({
    super.key,
    required this.role,
  });

  final Role? role;

  @override
  State<SelectPeopleBottomWidget> createState() =>
      _SelectPeopleBottomWidgetState();
}

class _SelectPeopleBottomWidgetState extends State<SelectPeopleBottomWidget> {
  late SelectPeopleBottomModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectPeopleBottomModel());

    _model.textToSearchTextController ??= TextEditingController();
    _model.textToSearchFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 34.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(34.0, 34.0, 0.0, 34.0),
                  child: Text(
                    'Select Customer',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          fontSize: 28.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 32.0,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1.0,
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
          Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(34.0, 32.0, 34.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _model.textToSearchTextController,
                      focusNode: _model.textToSearchFocusNode,
                      onChanged: (_) => EasyDebounce.debounce(
                        '_model.textToSearchTextController',
                        Duration(milliseconds: 2000),
                        () async {
                          _model.querySearchSeller =
                              await actions.searchInterceptorRequest(
                            _model.textToSearchTextController.text,
                            FFAppState().partitionKey,
                            widget.role!.name,
                          );
                          setState(
                              () => _model.listViewPagingController?.refresh());
                          await _model.waitForOnePageForListView();

                          setState(() {});
                        },
                      ),
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Enter text to search...',
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
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
                        prefixIcon: Icon(
                          Icons.person_search_outlined,
                        ),
                        suffixIcon: _model
                                .textToSearchTextController!.text.isNotEmpty
                            ? InkWell(
                                onTap: () async {
                                  _model.textToSearchTextController?.clear();
                                  _model.querySearchSeller =
                                      await actions.searchInterceptorRequest(
                                    _model.textToSearchTextController.text,
                                    FFAppState().partitionKey,
                                    widget.role!.name,
                                  );
                                  setState(() => _model.listViewPagingController
                                      ?.refresh());
                                  await _model.waitForOnePageForListView();

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
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                      validator: _model.textToSearchTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(34.0, 0.0, 34.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (_model.order == 1) {
                  _model.order = -1;
                  setState(() {});
                } else {
                  _model.order = 1;
                  setState(() {});
                }

                setState(() => _model.listViewPagingController?.refresh());
                await _model.waitForOnePageForListView();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Full Name',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      if (_model.order == 1)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.arrow_upward_sharp,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                        ),
                      if (_model.order == -1)
                        Icon(
                          Icons.arrow_downward,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 20.0,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(34.0, 0.0, 34.0, 0.0),
              child: PagedListView<ApiPagingParams, dynamic>(
                pagingController: _model.setListViewController(
                  (nextPageMarker) => CRMPeopleGroup.peopleTwoCall.call(
                    role: widget.role?.name,
                    all: 'false',
                    page: nextPageMarker.nextPageNumber + 1,
                    limit: 10,
                    partitionKey: FFAppState().partitionKey,
                    authToken: currentAuthenticationToken,
                    filterValue:
                        _model.textToSearchTextController.text != null &&
                                _model.textToSearchTextController.text != ''
                            ? _model.querySearchSeller
                            : functions.returnDefaultQueryFilter(
                                widget.role!.name, FFAppState().partitionKey),
                    order: _model.order,
                  ),
                ),
                padding: EdgeInsets.zero,
                reverse: false,
                scrollDirection: Axis.vertical,
                builderDelegate: PagedChildBuilderDelegate<dynamic>(
                  // Customize what your widget looks like when it's loading the first page.
                  firstPageProgressIndicatorBuilder: (_) => Center(
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
                  // Customize what your widget looks like when it's loading another page.
                  newPageProgressIndicatorBuilder: (_) => Center(
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

                  itemBuilder: (context, _, peopleRowIndex) {
                    final peopleRowItem = _model
                        .listViewPagingController!.itemList![peopleRowIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        Navigator.pop(
                            context,
                            PeopleStruct(
                              id: getJsonField(
                                peopleRowItem,
                                r'''$._id''',
                              ).toString(),
                              fullName: getJsonField(
                                peopleRowItem,
                                r'''$.full_name''',
                              ).toString(),
                              email: getJsonField(
                                peopleRowItem,
                                r'''$.emails[0].value''',
                              ).toString(),
                              phoneNumber: getJsonField(
                                peopleRowItem,
                                r'''$.phones[0].phone_number''',
                              ).toString(),
                            ));
                      },
                      child: RowListViewPeopleWidget(
                        key: Key(
                            'Keykkm_${peopleRowIndex}_of_${_model.listViewPagingController!.itemList!.length}'),
                        peopleRowComponent: PeopleStruct(
                          id: getJsonField(
                            peopleRowItem,
                            r'''$._id''',
                          ).toString(),
                          fullName: getJsonField(
                            peopleRowItem,
                            r'''$.full_name''',
                          ).toString(),
                          email: getJsonField(
                            peopleRowItem,
                            r'''$.emails[0].value''',
                          ).toString(),
                          phoneNumber: getJsonField(
                            peopleRowItem,
                            r'''$.phones[0].phone_number''',
                          ).toString(),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
