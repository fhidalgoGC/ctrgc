import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/components/base/side_nav/side_nav_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'view_people_details_w_m_widget.dart' show ViewPeopleDetailsWMWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewPeopleDetailsWMModel
    extends FlutterFlowModel<ViewPeopleDetailsWMWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
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
  // State field(s) for userCallingCode widget.
  FocusNode? userCallingCodeFocusNode;
  TextEditingController? userCallingCodeTextController;
  String? Function(BuildContext, String?)?
      userCallingCodeTextControllerValidator;
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

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
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

    userCallingCodeFocusNode?.dispose();
    userCallingCodeTextController?.dispose();

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
  }
}
