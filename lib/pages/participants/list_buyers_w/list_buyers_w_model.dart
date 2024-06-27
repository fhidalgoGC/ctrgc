import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/base/side_nav/side_nav_widget.dart';
import '/components/people/pop_over_menu/pop_over_menu_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'list_buyers_w_widget.dart' show ListBuyersWWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListBuyersWModel extends FlutterFlowModel<ListBuyersWWidget> {
  ///  Local state fields for this page.

  List<PeopleStruct> listPeople = [];
  void addToListPeople(PeopleStruct item) => listPeople.add(item);
  void removeFromListPeople(PeopleStruct item) => listPeople.remove(item);
  void removeAtIndexFromListPeople(int index) => listPeople.removeAt(index);
  void insertAtIndexInListPeople(int index, PeopleStruct item) =>
      listPeople.insert(index, item);
  void updateListPeopleAtIndex(int index, Function(PeopleStruct) updateFn) =>
      listPeople[index] = updateFn(listPeople[index]);

  int? index = 0;

  int? totalElements;

  List<PeopleStruct> listPeopleFiltered = [];
  void addToListPeopleFiltered(PeopleStruct item) =>
      listPeopleFiltered.add(item);
  void removeFromListPeopleFiltered(PeopleStruct item) =>
      listPeopleFiltered.remove(item);
  void removeAtIndexFromListPeopleFiltered(int index) =>
      listPeopleFiltered.removeAt(index);
  void insertAtIndexInListPeopleFiltered(int index, PeopleStruct item) =>
      listPeopleFiltered.insert(index, item);
  void updateListPeopleFilteredAtIndex(
          int index, Function(PeopleStruct) updateFn) =>
      listPeopleFiltered[index] = updateFn(listPeopleFiltered[index]);

  bool isShowFullList = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (People)] action in ListBuyersW widget.
  ApiCallResponse? apiResultvxa;
  // Stores action output result for [Custom Action - parseListPeople] action in ListBuyersW widget.
  List<PeopleStruct>? peopleParsed;
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for textToSearch widget.
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

  // Stores action output result for [Custom Action - searchPeopleTable] action in SearchButton widget.
  List<PeopleStruct>? returnList;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<PeopleStruct>();

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    textToSearchTextControllerValidator = _textToSearchTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    textToSearchFocusNode?.dispose();
    textToSearchTextController?.dispose();
  }
}
