import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'row_list_view_people_model.dart';
export 'row_list_view_people_model.dart';

class RowListViewPeopleWidget extends StatefulWidget {
  const RowListViewPeopleWidget({
    super.key,
    required this.peopleRowComponent,
  });

  final PeopleStruct? peopleRowComponent;

  @override
  State<RowListViewPeopleWidget> createState() =>
      _RowListViewPeopleWidgetState();
}

class _RowListViewPeopleWidgetState extends State<RowListViewPeopleWidget> {
  late RowListViewPeopleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RowListViewPeopleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        MouseRegion(
          opaque: false,
          cursor: MouseCursor.defer ?? MouseCursor.defer,
          child: Container(
            width: double.infinity,
            height: 45.0,
            decoration: BoxDecoration(
              color: _model.mouseRegionRowHovered!
                  ? FlutterFlowTheme.of(context).primaryBackground
                  : FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 10.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.peopleRowComponent?.fullName,
                        'Name',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          onEnter: ((event) async {
            setState(() => _model.mouseRegionRowHovered = true);
          }),
          onExit: ((event) async {
            setState(() => _model.mouseRegionRowHovered = false);
          }),
        ),
      ],
    );
  }
}
