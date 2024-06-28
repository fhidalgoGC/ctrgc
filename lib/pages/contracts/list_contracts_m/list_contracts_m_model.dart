import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'list_contracts_m_widget.dart' show ListContractsMWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class ListContractsMModel extends FlutterFlowModel<ListContractsMWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for SearchPurchase widget.
  FocusNode? searchPurchaseFocusNode;
  TextEditingController? searchPurchaseTextController;
  String? Function(BuildContext, String?)?
      searchPurchaseTextControllerValidator;
  // Stores action output result for [Custom Action - queryToGetContractListMobile] action in SearchPurchase widget.
  String? querySearchPurchaseContracts;
  // State field(s) for ListViewPurchaseContracts widget.

  PagingController<ApiPagingParams, dynamic>?
      listViewPurchaseContractsPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewPurchaseContractsApiCall;

  // State field(s) for SearchSale widget.
  FocusNode? searchSaleFocusNode;
  TextEditingController? searchSaleTextController;
  String? Function(BuildContext, String?)? searchSaleTextControllerValidator;
  // Stores action output result for [Custom Action - queryToGetContractListMobile] action in SearchSale widget.
  String? querySearchSaleContracts;
  // State field(s) for ListViewSaleContracts widget.

  PagingController<ApiPagingParams, dynamic>?
      listViewSaleContractsPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewSaleContractsApiCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    searchPurchaseFocusNode?.dispose();
    searchPurchaseTextController?.dispose();

    listViewPurchaseContractsPagingController?.dispose();
    searchSaleFocusNode?.dispose();
    searchSaleTextController?.dispose();

    listViewSaleContractsPagingController?.dispose();
  }

  /// Additional helper methods.
  Future waitForOnePageForListViewPurchaseContracts({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = (listViewPurchaseContractsPagingController
                  ?.nextPageKey?.nextPageNumber ??
              0) >
          0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic>
      setListViewPurchaseContractsController(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewPurchaseContractsApiCall = apiCall;
    return listViewPurchaseContractsPagingController ??=
        _createListViewPurchaseContractsController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic>
      _createListViewPurchaseContractsController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller
      ..addPageRequestListener(listViewPurchaseContractsContractsPage);
  }

  void listViewPurchaseContractsContractsPage(ApiPagingParams nextPageMarker) =>
      listViewPurchaseContractsApiCall!(nextPageMarker)
          .then((listViewPurchaseContractsContractsResponse) {
        final pageItems = (ContractsGroup.contractsCall.data(
                  listViewPurchaseContractsContractsResponse.jsonBody,
                )! ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPurchaseContractsPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewPurchaseContractsContractsResponse,
                )
              : null,
        );
      });

  Future waitForOnePageForListViewSaleContracts({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete =
          (listViewSaleContractsPagingController?.nextPageKey?.nextPageNumber ??
                  0) >
              0;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<ApiPagingParams, dynamic> setListViewSaleContractsController(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewSaleContractsApiCall = apiCall;
    return listViewSaleContractsPagingController ??=
        _createListViewSaleContractsController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic>
      _createListViewSaleContractsController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller
      ..addPageRequestListener(listViewSaleContractsContractsPage);
  }

  void listViewSaleContractsContractsPage(ApiPagingParams nextPageMarker) =>
      listViewSaleContractsApiCall!(nextPageMarker)
          .then((listViewSaleContractsContractsResponse) {
        final pageItems = (ContractsGroup.contractsCall.data(
                  listViewSaleContractsContractsResponse.jsonBody,
                )! ??
                [])
            .toList() as List;
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewSaleContractsPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewSaleContractsContractsResponse,
                )
              : null,
        );
      });
}
