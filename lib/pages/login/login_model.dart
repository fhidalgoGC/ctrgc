import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for loginEmailInput widget.
  FocusNode? loginEmailInputFocusNode;
  TextEditingController? loginEmailInputTextController;
  String? Function(BuildContext, String?)?
      loginEmailInputTextControllerValidator;
  String? _loginEmailInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Field must have a minimum of 6 characters';
    }
    if (val.length > 250) {
      return 'Field must have a maximum of 250 characters';
    }
    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Incorrect Format';
    }
    return null;
  }

  // State field(s) for loginPasswordInput widget.
  FocusNode? loginPasswordInputFocusNode;
  TextEditingController? loginPasswordInputTextController;
  late bool loginPasswordInputVisibility;
  String? Function(BuildContext, String?)?
      loginPasswordInputTextControllerValidator;
  String? _loginPasswordInputTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 8) {
      return 'Field must have a minimum of 8 characters';
    }
    if (val.length > 30) {
      return 'Field must have a maximum of 30 characters';
    }

    return null;
  }

  // State field(s) for rememberMeCheckbox widget.
  bool? rememberMeCheckboxValue;
  // Stores action output result for [Backend Call - API (Auth Zero Login)] action in loginButton widget.
  ApiCallResponse? resultLogin;
  // Stores action output result for [Backend Call - API (CustomerProfile )] action in loginButton widget.
  ApiCallResponse? resultGetProfile;

  @override
  void initState(BuildContext context) {
    loginEmailInputTextControllerValidator =
        _loginEmailInputTextControllerValidator;
    loginPasswordInputVisibility = false;
    loginPasswordInputTextControllerValidator =
        _loginPasswordInputTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    loginEmailInputFocusNode?.dispose();
    loginEmailInputTextController?.dispose();

    loginPasswordInputFocusNode?.dispose();
    loginPasswordInputTextController?.dispose();
  }
}
