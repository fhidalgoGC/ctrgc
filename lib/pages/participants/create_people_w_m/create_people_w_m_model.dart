import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/base/side_nav/side_nav_widget.dart';
import '/components/base/spinner/spinner_widget.dart';
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
import 'create_people_w_m_widget.dart' show CreatePeopleWMWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreatePeopleWMModel extends FlutterFlowModel<CreatePeopleWMWidget> {
  ///  Local state fields for this page.

  PeopleCreateStruct? peopleCreatePageStage;
  void updatePeopleCreatePageStageStruct(
      Function(PeopleCreateStruct) updateFn) {
    updateFn(peopleCreatePageStage ??= PeopleCreateStruct());
  }

  String? formErrorMessage = '';

  bool userCreate = false;

  bool locationCreate = false;

  bool spinnerVisible = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (IdempotencePeople)] action in CreatePeopleWM widget.
  ApiCallResponse? idempotenceResult;
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for organizationName widget.
  FocusNode? organizationNameFocusNode;
  TextEditingController? organizationNameTextController;
  String? Function(BuildContext, String?)?
      organizationNameTextControllerValidator;
  // State field(s) for userName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  // State field(s) for userLastName widget.
  FocusNode? userLastNameFocusNode;
  TextEditingController? userLastNameTextController;
  String? Function(BuildContext, String?)? userLastNameTextControllerValidator;
  // State field(s) for userEmailAddress widget.
  FocusNode? userEmailAddressFocusNode;
  TextEditingController? userEmailAddressTextController;
  String? Function(BuildContext, String?)?
      userEmailAddressTextControllerValidator;
  // State field(s) for callingCode widget.
  String? callingCodeValue;
  FormFieldController<String>? callingCodeValueController;
  // State field(s) for userPhoneNumber widget.
  FocusNode? userPhoneNumberFocusNode;
  TextEditingController? userPhoneNumberTextController;
  String? Function(BuildContext, String?)?
      userPhoneNumberTextControllerValidator;
  // State field(s) for userCountry widget.
  FocusNode? userCountryFocusNode;
  TextEditingController? userCountryTextController;
  String? Function(BuildContext, String?)? userCountryTextControllerValidator;
  // State field(s) for userState widget.
  FocusNode? userStateFocusNode;
  TextEditingController? userStateTextController;
  String? Function(BuildContext, String?)? userStateTextControllerValidator;
  // State field(s) for userCity widget.
  FocusNode? userCityFocusNode;
  TextEditingController? userCityTextController;
  String? Function(BuildContext, String?)? userCityTextControllerValidator;
  // State field(s) for userAddress widget.
  FocusNode? userAddressFocusNode;
  TextEditingController? userAddressTextController;
  String? Function(BuildContext, String?)? userAddressTextControllerValidator;
  // Stores action output result for [Backend Call - API (CreatePeople)] action in Button widget.
  ApiCallResponse? apiPeoplePutResult;
  // Stores action output result for [Backend Call - API (AddressUpdate)] action in Button widget.
  ApiCallResponse? apiAddresPutResult;
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
    organizationNameFocusNode?.dispose();
    organizationNameTextController?.dispose();

    userNameFocusNode?.dispose();
    userNameTextController?.dispose();

    userLastNameFocusNode?.dispose();
    userLastNameTextController?.dispose();

    userEmailAddressFocusNode?.dispose();
    userEmailAddressTextController?.dispose();

    userPhoneNumberFocusNode?.dispose();
    userPhoneNumberTextController?.dispose();

    userCountryFocusNode?.dispose();
    userCountryTextController?.dispose();

    userStateFocusNode?.dispose();
    userStateTextController?.dispose();

    userCityFocusNode?.dispose();
    userCityTextController?.dispose();

    userAddressFocusNode?.dispose();
    userAddressTextController?.dispose();

    spinnerModel.dispose();
  }
}
