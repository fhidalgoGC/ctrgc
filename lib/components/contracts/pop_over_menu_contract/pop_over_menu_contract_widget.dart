import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pop_over_menu_contract_model.dart';
export 'pop_over_menu_contract_model.dart';

class PopOverMenuContractWidget extends StatefulWidget {
  const PopOverMenuContractWidget({
    super.key,
    required this.contractId,
    required this.contractType,
    required this.pricingType,
  });

  final String? contractId;
  final String? contractType;
  final String? pricingType;

  @override
  State<PopOverMenuContractWidget> createState() =>
      _PopOverMenuContractWidgetState();
}

class _PopOverMenuContractWidgetState extends State<PopOverMenuContractWidget> {
  late PopOverMenuContractModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopOverMenuContractModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 169.0,
      height: 119.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.pop(context);

                context.pushNamed(
                  'DetailContractWM',
                  queryParameters: {
                    'contractIdParam': serializeParam(
                      widget.contractId,
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
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
          ),
          if (widget.pricingType == 'basis')
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  Navigator.pop(context);

                  context.pushNamed(
                    'CreateSubContractWM',
                    queryParameters: {
                      'contractIdParam': serializeParam(
                        widget.contractId,
                        ParamType.String,
                      ),
                      'typeContract': serializeParam(
                        widget.contractType,
                        ParamType.String,
                      ),
                    }.withoutNulls,
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    Text(
                      'Add Sub Contract',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ].divide(SizedBox(width: 10.0)),
                ),
              ),
            ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.pop(context);
                _model.contractBodyResult =
                    await ContractsGroup.contractDetailCall.call(
                  contractId: widget.contractId,
                  partitionKey: FFAppState().partitionKey,
                  authToken: currentAuthenticationToken,
                );

                if ((_model.contractBodyResult?.succeeded ?? true)) {
                  _model.pdfResult = await InvoicePdfCall.call(
                    dataReportJson: (_model.contractBodyResult?.jsonBody ?? ''),
                    contractFolio: 'contract-${getJsonField(
                      (_model.contractBodyResult?.jsonBody ?? ''),
                      r'''$.folio''',
                    ).toString()}.pdf',
                  );

                  if ((_model.pdfResult?.succeeded ?? true)) {
                    await launchURL(getJsonField(
                      (_model.pdfResult?.jsonBody ?? ''),
                      r'''$.file''',
                    ).toString());
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Error loading pdf',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Error loading contract details',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                    ),
                  );
                }

                setState(() {});
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.picture_as_pdf,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                  Text(
                    'Contract PDF',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ].divide(SizedBox(width: 10.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
