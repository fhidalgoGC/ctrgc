import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'simple_location_card_model.dart';
export 'simple_location_card_model.dart';

class SimpleLocationCardWidget extends StatefulWidget {
  const SimpleLocationCardWidget({
    super.key,
    required this.inputName,
    required this.inputId,
  });

  final String? inputName;
  final String? inputId;

  @override
  State<SimpleLocationCardWidget> createState() =>
      _SimpleLocationCardWidgetState();
}

class _SimpleLocationCardWidgetState extends State<SimpleLocationCardWidget> {
  late SimpleLocationCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SimpleLocationCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              valueOrDefault<String>(
                widget.inputName,
                'Country Name',
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: 'Inter',
                    letterSpacing: 0.0,
                  ),
            ),
          ].divide(SizedBox(height: 5.0)),
        ),
      ),
    );
  }
}
