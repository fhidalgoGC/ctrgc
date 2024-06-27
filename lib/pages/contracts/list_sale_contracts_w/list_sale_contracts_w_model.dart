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
import 'list_sale_contracts_w_widget.dart' show ListSaleContractsWWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListSaleContractsWModel
    extends FlutterFlowModel<ListSaleContractsWWidget> {
  ///  Local state fields for this page.

  int? totalElements;

  int? index;

  bool isShowFullList = true;

  List<ContractsStruct> originalListContracts = [];
  void addToOriginalListContracts(ContractsStruct item) =>
      originalListContracts.add(item);
  void removeFromOriginalListContracts(ContractsStruct item) =>
      originalListContracts.remove(item);
  void removeAtIndexFromOriginalListContracts(int index) =>
      originalListContracts.removeAt(index);
  void insertAtIndexInOriginalListContracts(int index, ContractsStruct item) =>
      originalListContracts.insert(index, item);
  void updateOriginalListContractsAtIndex(
          int index, Function(ContractsStruct) updateFn) =>
      originalListContracts[index] = updateFn(originalListContracts[index]);

  List<ContractsStruct> listContracts = [];
  void addToListContracts(ContractsStruct item) => listContracts.add(item);
  void removeFromListContracts(ContractsStruct item) =>
      listContracts.remove(item);
  void removeAtIndexFromListContracts(int index) =>
      listContracts.removeAt(index);
  void insertAtIndexInListContracts(int index, ContractsStruct item) =>
      listContracts.insert(index, item);
  void updateListContractsAtIndex(
          int index, Function(ContractsStruct) updateFn) =>
      listContracts[index] = updateFn(listContracts[index]);

  String? selectFilterCommodity;

  bool spinnerVisible = true;

  List<CommoditiesStruct> listCommoditiesToFilter = [];
  void addToListCommoditiesToFilter(CommoditiesStruct item) =>
      listCommoditiesToFilter.add(item);
  void removeFromListCommoditiesToFilter(CommoditiesStruct item) =>
      listCommoditiesToFilter.remove(item);
  void removeAtIndexFromListCommoditiesToFilter(int index) =>
      listCommoditiesToFilter.removeAt(index);
  void insertAtIndexInListCommoditiesToFilter(
          int index, CommoditiesStruct item) =>
      listCommoditiesToFilter.insert(index, item);
  void updateListCommoditiesToFilterAtIndex(
          int index, Function(CommoditiesStruct) updateFn) =>
      listCommoditiesToFilter[index] = updateFn(listCommoditiesToFilter[index]);

  String? filterByType;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Contracts)] action in ListSaleContractsW widget.
  ApiCallResponse? responseContracts;
  // Stores action output result for [Custom Action - parseListContracts] action in ListSaleContractsW widget.
  List<ContractsStruct>? contractsParsed;
  // Stores action output result for [Backend Call - API (Contracts commodities used)] action in ListSaleContractsW widget.
  ApiCallResponse? returnCommoditiesToFilter;
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for textToSearch widget.
  FocusNode? textToSearchFocusNode;
  TextEditingController? textToSearchTextController;
  String? Function(BuildContext, String?)? textToSearchTextControllerValidator;
  // Stores action output result for [Custom Action - filterContracts] action in textToSearch widget.
  List<ContractsStruct>? returnListContractSearchEmpty;
  // Stores action output result for [Custom Action - filterContracts] action in SearchButton widget.
  List<ContractsStruct>? returnListContractSearchText;
  // Stores action output result for [Custom Action - filterContracts] action in Button widget.
  List<ContractsStruct>? returnListContractByTypeBasis;
  // Stores action output result for [Custom Action - filterContracts] action in Button widget.
  List<ContractsStruct>? returnListContractByTypeFixed;
  // Stores action output result for [Custom Action - filterContracts] action in Button widget.
  List<ContractsStruct>? returnListContractFiltered;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<ContractsStruct>();
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
    textToSearchFocusNode?.dispose();
    textToSearchTextController?.dispose();

    spinnerModel.dispose();
  }
}
