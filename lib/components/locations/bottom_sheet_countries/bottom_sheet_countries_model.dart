import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/locations/simple_location_card/simple_location_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'bottom_sheet_countries_widget.dart' show BottomSheetCountriesWidget;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class BottomSheetCountriesModel
    extends FlutterFlowModel<BottomSheetCountriesWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextToSearch widget.
  FocusNode? textToSearchFocusNode;
  TextEditingController? textToSearchTextController;
  String? Function(BuildContext, String?)? textToSearchTextControllerValidator;
  String? _textToSearchTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Mínimo 3 caracteres';
    }
    if (val.length > 20) {
      return 'Máximo 20 caracteres';
    }

    return null;
  }

  // Stores action output result for [Custom Action - searchCountriesInterceptorRequest] action in TextToSearch widget.
  String? countriesSearchFilter;
  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  // Models for SimpleLocationCard dynamic component.
  late FlutterFlowDynamicModels<SimpleLocationCardModel>
      simpleLocationCardModels;

  @override
  void initState(BuildContext context) {
    textToSearchTextControllerValidator = _textToSearchTextControllerValidator;
    simpleLocationCardModels =
        FlutterFlowDynamicModels(() => SimpleLocationCardModel());
  }

  @override
  void dispose() {
    textToSearchFocusNode?.dispose();
    textToSearchTextController?.dispose();

    listViewPagingController?.dispose();
    simpleLocationCardModels.dispose();
  }

  /// Additional helper methods.
  Future waitForOnePageForListView({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewPagingController?.nextPageKey?.nextPageNumber ?? 0) > 0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setListViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall = apiCall;
    return listViewPagingController ??= _createListViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewCountriesPage);
  }

  void listViewCountriesPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewCountriesResponse) {
        final pageItems = (getJsonField(
                  listViewCountriesResponse.jsonBody,
                  r'''$.data''',
                ) ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewCountriesResponse,
                )
              : null,
        );
      });
}
