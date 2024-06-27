import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'row_remark_list_model.dart';
export 'row_remark_list_model.dart';

class RowRemarkListWidget extends StatefulWidget {
  const RowRemarkListWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  State<RowRemarkListWidget> createState() => _RowRemarkListWidgetState();
}

class _RowRemarkListWidgetState extends State<RowRemarkListWidget> {
  late RowRemarkListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RowRemarkListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      cursor: MouseCursor.defer ?? MouseCursor.defer,
      child: Container(
        width: double.infinity,
        height: functions.calculateHeightRow(widget.text!, 20)?.toDouble(),
        decoration: BoxDecoration(
          color: _model.mouseRegionHovered!
              ? FlutterFlowTheme.of(context).primaryBackground
              : FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Align(
          alignment: AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
            child: Text(
              widget.text!,
              textAlign: TextAlign.start,
              maxLines: 5,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ),
      ),
      onEnter: ((event) async {
        setState(() => _model.mouseRegionHovered = true);
      }),
      onExit: ((event) async {
        setState(() => _model.mouseRegionHovered = false);
      }),
    );
  }
}
