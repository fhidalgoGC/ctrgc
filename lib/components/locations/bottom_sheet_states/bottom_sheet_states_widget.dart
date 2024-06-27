import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/locations/simple_location_card/simple_location_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'bottom_sheet_states_model.dart';
export 'bottom_sheet_states_model.dart';

class BottomSheetStatesWidget extends StatefulWidget {
  const BottomSheetStatesWidget({
    super.key,
    required this.locationSelected,
    required this.countrySlug,
  });

  final Future Function(dynamic selectedItem)? locationSelected;
  final String? countrySlug;

  @override
  State<BottomSheetStatesWidget> createState() =>
      _BottomSheetStatesWidgetState();
}

class _BottomSheetStatesWidgetState extends State<BottomSheetStatesWidget> {
  late BottomSheetStatesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomSheetStatesModel());

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
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3.0,
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(0.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
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
                      'Select State',
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 16.0),
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
                            _model.statesSearchFilter =
                                await actions.searchStatesInterceptorRequest(
                              _model.textToSearchTextController.text,
                              widget.countrySlug!,
                            );
                            setState(() =>
                                _model.listViewPagingController?.refresh());
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
                            Icons.search_sharp,
                          ),
                          suffixIcon: _model
                                  .textToSearchTextController!.text.isNotEmpty
                              ? InkWell(
                                  onTap: () async {
                                    _model.textToSearchTextController?.clear();
                                    _model.statesSearchFilter = await actions
                                        .searchStatesInterceptorRequest(
                                      _model.textToSearchTextController.text,
                                      widget.countrySlug!,
                                    );
                                    setState(() => _model
                                        .listViewPagingController
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
            Flexible(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: RefreshIndicator(
                  onRefresh: () async {
                    setState(() => _model.listViewPagingController?.refresh());
                    await _model.waitForOnePageForListView();
                  },
                  child: PagedListView<ApiPagingParams, dynamic>(
                    pagingController: _model.setListViewController(
                      (nextPageMarker) => CRMLocationsGroup.statesCall.call(
                        partitionKey: FFAppState().partitionKey,
                        authToken: currentAuthenticationToken,
                        countrySlug: widget.countrySlug,
                        page: nextPageMarker.nextPageNumber + 1,
                        filter:
                            _model.textToSearchTextController.text != null &&
                                    _model.textToSearchTextController.text != ''
                                ? _model.statesSearchFilter
                                : ((String countrySlug) {
                                    return "{\"country_slug\":\"" +
                                        countrySlug +
                                        "\"\}";
                                  }(widget.countrySlug!)),
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

                      itemBuilder: (context, _, locationRowItemIndex) {
                        final locationRowItemItem = _model
                            .listViewPagingController!
                            .itemList![locationRowItemIndex];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await widget.locationSelected?.call(
                              locationRowItemItem,
                            );
                            // Close
                            Navigator.pop(context);
                          },
                          child: wrapWithModel(
                            model: _model.simpleLocationCardModels.getModel(
                              getJsonField(
                                locationRowItemItem,
                                r'''$._id''',
                              ).toString(),
                              locationRowItemIndex,
                            ),
                            updateCallback: () => setState(() {}),
                            child: SimpleLocationCardWidget(
                              key: Key(
                                'Keysam_${getJsonField(
                                  locationRowItemItem,
                                  r'''$._id''',
                                ).toString()}',
                              ),
                              inputName: getJsonField(
                                locationRowItemItem,
                                r'''$.name''',
                              ).toString(),
                              inputId: getJsonField(
                                locationRowItemItem,
                                r'''$._id''',
                              ).toString(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(height: 1.0)),
        ),
      ),
    );
  }
}
