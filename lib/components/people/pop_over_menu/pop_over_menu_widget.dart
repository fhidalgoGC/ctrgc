import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pop_over_menu_model.dart';
export 'pop_over_menu_model.dart';

class PopOverMenuWidget extends StatefulWidget {
  const PopOverMenuWidget({
    super.key,
    required this.selectedItemId,
    required this.peopleRole,
  });

  final String? selectedItemId;
  final String? peopleRole;

  @override
  State<PopOverMenuWidget> createState() => _PopOverMenuWidgetState();
}

class _PopOverMenuWidgetState extends State<PopOverMenuWidget> {
  late PopOverMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopOverMenuModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Container(
        width: 120.0,
        height: 80.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.pop(context);

                context.pushNamed(
                  'ViewPeopleDetailsWM',
                  queryParameters: {
                    'peopleId': serializeParam(
                      widget.selectedItemId,
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.remove_red_eye_outlined,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  Text(
                    'View',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ].divide(SizedBox(width: 10.0)),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.pop(context);

                context.pushNamed(
                  'EditPeopleWM',
                  queryParameters: {
                    'peopleRole': serializeParam(
                      widget.peopleRole,
                      ParamType.String,
                    ),
                    'peopleId': serializeParam(
                      widget.selectedItemId,
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.edit_outlined,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  Text(
                    'Edit',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ].divide(SizedBox(width: 10.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
