import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/base/side_nav/side_nav_widget.dart';
import '/components/contracts/modal_select_remarks/modal_select_remarks_widget.dart';
import '/components/people/select_people_bottom/select_people_bottom_widget.dart';
import '/components/people/select_people_dialog/select_people_dialog_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_sale_contract_w_m_model.dart';
export 'create_sale_contract_w_m_model.dart';

class CreateSaleContractWMWidget extends StatefulWidget {
  const CreateSaleContractWMWidget({
    super.key,
    this.contractId,
    this.backPage,
    bool? edit,
  }) : this.edit = edit ?? false;

  final String? contractId;
  final Pages? backPage;
  final bool edit;

  @override
  State<CreateSaleContractWMWidget> createState() =>
      _CreateSaleContractWMWidgetState();
}

class _CreateSaleContractWMWidgetState
    extends State<CreateSaleContractWMWidget> {
  late CreateSaleContractWMModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateSaleContractWMModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().ContractSaleMetadata.idempotence != null &&
          FFAppState().ContractSaleMetadata.idempotence != '') {
        // Desactivate Form To Update
        FFAppState().updateContractSaleMetadataStruct(
          (e) => e..incomplete = true,
        );
      } else {
        await action_blocks.resetContractSale(context);
        _model.ctrIdepotenceApiResult =
            await ContractsGroup.idempotenceContractCall.call(
          partitionKey: FFAppState().partitionKey,
          authToken: currentAuthenticationToken,
        );

        if ((_model.ctrIdepotenceApiResult?.succeeded ?? true)) {
          FFAppState().updateContractSaleMetadataStruct(
            (e) => e
              ..idempotence = ContractsGroup.idempotenceContractCall.idPotence(
                (_model.ctrIdepotenceApiResult?.jsonBody ?? ''),
              ),
          );
        }
      }

      setState(() {
        _model.cSaleTypeCustomerNameTextController?.text =
            functions.isArrayNullOrEmpty(FFAppState()
                    .ContractSaleData
                    .participants
                    .map((e) => e.toMap())
                    .toList()
                    .toList())
                ? FFAppState().ContractSaleData.participants.first.name
                : FFAppConstants.EMPTYSTRING;
        _model.cSaleTypeContratDateTextController?.text =
            FFAppState().ContractSaleData != null
                ? functions.formatStringDateToUi(
                    FFAppState().ContractSaleData.contractDate, 'dd/MM/yyyy')
                : FFAppConstants.EMPTYSTRING;
        _model.cSaleTypeQuantityTextController?.text =
            FFAppState().ContractSaleData != null
                ? functions.formatNumberDoubleToStringMask(
                    FFAppState().ContractSaleData.quantity.toDouble(),
                    FFAppConstants.USLocateNumber,
                    FFAppConstants.USMaskNumberDecimal)!
                : FFAppConstants.EMPTYSTRING;
        _model.cSaleLogisticMaxTextController?.text =
            functions.isArrayNullOrEmpty(FFAppState()
                    .ContractSaleData
                    .logisticSchedule
                    .map((e) => e.toMap())
                    .toList()
                    .toList())
                ? functions.formatNumberDoubleToStringMask(
                    FFAppState()
                        .ContractSaleData
                        .logisticSchedule
                        .first
                        .freightCost
                        .max,
                    FFAppConstants.USLocateNumber,
                    FFAppConstants.USMaskNumberDecimal)!
                : FFAppConstants.EMPTYSTRING;
        _model.cSaleShipmentDateFromTextController?.text =
            FFAppState().ContractSaleData != null
                ? functions.formatStringDateToUi(
                    FFAppState().ContractSaleData.shippingStartDate,
                    'dd/MM/yyyy')
                : FFAppConstants.EMPTYSTRING;
        _model.cSaleLogisticMinTextController?.text =
            functions.isArrayNullOrEmpty(FFAppState()
                    .ContractSaleData
                    .logisticSchedule
                    .map((e) => e.toMap())
                    .toList()
                    .toList())
                ? functions.formatNumberDoubleToStringMask(
                    FFAppState()
                        .ContractSaleData
                        .logisticSchedule
                        .first
                        .freightCost
                        .min,
                    FFAppConstants.USLocateNumber,
                    FFAppConstants.USMaskNumberDecimal)!
                : FFAppConstants.EMPTYSTRING;
        _model.cSaleShipmentDateToTextController?.text =
            FFAppState().ContractSaleData != null
                ? functions.formatStringDateToUi(
                    FFAppState().ContractSaleData.shippingEndDate, 'dd/MM/yyyy')
                : FFAppConstants.EMPTYSTRING;
        _model.cSaleRemarkContactTextController?.text =
            functions.findRemarkInList(
                FFAppState().ContractSaleData.remarks.toList(), 'contact');
        _model.cSaleRemarksShipmentTextController?.text =
            functions.findRemarkInList(
                FFAppState().ContractSaleData.remarks.toList(), 'shipment');
        _model.cSaleRemarkRoutingTextController?.text =
            functions.findRemarkInList(
                FFAppState().ContractSaleData.remarks.toList(), 'routing');
        _model.cSaleRemarkPremDiscTextController?.text =
            functions.findRemarkInList(
                FFAppState().ContractSaleData.remarks.toList(), 'premDisc');
        _model.cSaleRemarkTermsTextController?.text =
            functions.findRemarkInList(
                FFAppState().ContractSaleData.remarks.toList(), 'terms');
        _model.cSaleRemarkRemarksTextController?.text =
            functions.findRemarkInList(
                FFAppState().ContractSaleData.remarks.toList(), 'remarks');
        _model.cSaleNoteTextController?.text =
            (FFAppState().ContractSaleData.notes.isNotEmpty) == true
                ? FFAppState().ContractSaleData.notes.first.text
                : '';
        _model.cSalePricePrice1TextController?.text =
            functions.isArrayNullOrEmpty(FFAppState()
                    .ContractSaleData
                    .priceSchedule
                    .map((e) => e.toMap())
                    .toList()
                    .toList())
                ? functions.formatNumbersQuantity(
                    FFAppState().ContractSaleData.priceSchedule.first.price,
                    FFAppConstants.USLocateNumber,
                    FFAppConstants.USMaskNumberDecimal)
                : FFAppConstants.EMPTYSTRING;
        _model.cSalePriceBasis1TextController?.text = functions
                .isArrayNullOrEmpty(FFAppState()
                    .ContractSaleData
                    .priceSchedule
                    .map((e) => e.toMap())
                    .toList()
                    .toList())
            ? (FFAppState().ContractSaleData.priceSchedule.first.basis != 0.0
                ? functions.formatNumberDoubleToStringMask(
                    (double basis) {
                      return basis >= 0 ? basis : basis * -1;
                    }(FFAppState().ContractSaleData.priceSchedule.first.basis),
                    FFAppConstants.USLocateNumber,
                    FFAppConstants.USMaskNumberDecimal)!
                : FFAppConstants.EMPTYSTRING)
            : FFAppConstants.EMPTYSTRING;
        _model.cSalePriceFuture1TextController?.text = functions
                .isArrayNullOrEmpty(FFAppState()
                    .ContractSaleData
                    .priceSchedule
                    .map((e) => e.toMap())
                    .toList()
                    .toList())
            ? functions.formatNumberDoubleToStringMask(
                FFAppState().ContractSaleData.priceSchedule.first.futurePrice,
                FFAppConstants.USLocateNumber,
                FFAppConstants.USMaskNumberDecimal)!
            : FFAppConstants.EMPTYSTRING;
        _model.cSalePriceBasis2TextController?.text = functions
                .isArrayNullOrEmpty(FFAppState()
                    .ContractSaleData
                    .priceSchedule
                    .map((e) => e.toMap())
                    .toList()
                    .toList())
            ? (FFAppState().ContractSaleData.priceSchedule.first.basis != 0.0
                ? functions.formatNumberDoubleToStringMask(
                    (double basis) {
                      return basis >= 0 ? basis : basis * -1;
                    }(FFAppState().ContractSaleData.priceSchedule.first.basis),
                    FFAppConstants.USLocateNumber,
                    FFAppConstants.USMaskNumberDecimal)!
                : FFAppConstants.EMPTYSTRING)
            : FFAppConstants.EMPTYSTRING;
      });
      setState(() {
        _model.cSalePriceTypeValueController?.reset();
        _model.cSaleTypeSubTypeValueController?.reset();
        _model.cSaleTypeCommodityValueController?.reset();
        _model.cSaleTypeGradeValueController?.reset();
        _model.cSaleTypeUnitValueController?.reset();
        _model.cSalePriceMonthValueController?.reset();
        _model.cSalePriceYearValueController?.reset();
        _model.cSalePriceCurrencyValueController?.reset();
        _model.cSalePriceExchangeValueController?.reset();
        _model.cSaleLogisticPaymentValueController?.reset();
        _model.cSaleLogisticCoordinationValueController?.reset();
        _model.cSaleLogisticTypeValueController?.reset();
        _model.cSaleShipmentAPriorityValueController?.reset();
        _model.cSaleDeliverLocationValueController?.reset();
        _model.cSaleDeliverTransportValueController?.reset();
        _model.cSaleDeliverProteinValueController?.reset();
        _model.cSaleDeliverInspectionsValueController?.reset();
        _model.cSaleDeliverWeightValueController?.reset();
        _model.cSaleSymbol2ValueController?.reset();
        _model.cSaleSymbol1ValueController?.reset();
      });
      if (!(FFAppState().Commodities.isNotEmpty)) {
        await action_blocks.getCommodities(context);
        setState(() {});
      }
      // Activate Form To Update
      FFAppState().updateContractSaleMetadataStruct(
        (e) => e
          ..incomplete = false
          ..loadAppState = true,
      );
    });

    _model.cSaleTypeCustomerNameTextController ??= TextEditingController(
        text: functions.isArrayNullOrEmpty(FFAppState()
                .ContractSaleData
                .participants
                .map((e) => e.toMap())
                .toList()
                .toList())
            ? FFAppState().ContractSaleData.participants.first.name
            : FFAppConstants.EMPTYSTRING);
    _model.cSaleTypeCustomerNameFocusNode ??= FocusNode();
    _model.cSaleTypeCustomerNameFocusNode!.addListener(
      () async {
        if (!FFAppState().ContractSaleMetadata.incomplete) {
          // cleanListPeople
          FFAppState().updateContractSaleDataStruct(
            (e) => e..participants = [],
          );
          // AddNewItem
          FFAppState().updateContractSaleDataStruct(
            (e) => e
              ..updateParticipants(
                (e) => e.add(CtrParticipantSchemaStruct(
                  peopleId: '663536e15f6d6f2a9d152380',
                  name: _model.cSaleTypeCustomerNameTextController.text,
                  role: 'seller',
                )),
              ),
          );
        }
      },
    );
    _model.cSaleTypeContratDateTextController ??= TextEditingController(
        text: FFAppState().ContractSaleData != null
            ? functions.formatStringDateToUi(
                FFAppState().ContractSaleData.contractDate, 'dd/MM/yyyy')
            : FFAppConstants.EMPTYSTRING);
    _model.cSaleTypeContratDateFocusNode ??= FocusNode();
    _model.cSaleTypeContratDateFocusNode!.addListener(() => setState(() {}));
    _model.cSaleTypeQuantityTextController ??= TextEditingController(
        text: FFAppState().ContractSaleData != null
            ? functions.formatNumberDoubleToStringMask(
                FFAppState().ContractSaleData.quantity.toDouble(),
                FFAppConstants.USLocateNumber,
                FFAppConstants.USMaskNumberDecimal)
            : FFAppConstants.EMPTYSTRING);
    _model.cSaleTypeQuantityFocusNode ??= FocusNode();
    _model.cSaleTypeQuantityFocusNode!.addListener(
      () async {
        await _model.cSaleSaveRootFields(context);
      },
    );
    _model.cSalePricePrice1TextController ??= TextEditingController(
        text: functions.isArrayNullOrEmpty(FFAppState()
                .ContractSaleData
                .priceSchedule
                .map((e) => e.toMap())
                .toList()
                .toList())
            ? functions.formatNumbersQuantity(
                FFAppState().ContractSaleData.priceSchedule.first.price,
                FFAppConstants.USLocateNumber,
                FFAppConstants.USMaskNumberDecimal)
            : FFAppConstants.EMPTYSTRING);
    _model.cSalePricePrice1FocusNode ??= FocusNode();
    _model.cSalePricePrice1FocusNode!.addListener(
      () async {
        await _model.cSaleSavePriceInput(context);
      },
    );
    _model.cSalePriceBasis1TextController ??= TextEditingController(
        text: functions.isArrayNullOrEmpty(FFAppState()
                .ContractSaleData
                .priceSchedule
                .map((e) => e.toMap())
                .toList()
                .toList())
            ? (FFAppState().ContractSaleData.priceSchedule.first.basis != 0.0
                ? functions.formatNumberDoubleToStringMask(
                    (double basis) {
                      return basis >= 0 ? basis : basis * -1;
                    }(FFAppState().ContractSaleData.priceSchedule.first.basis),
                    FFAppConstants.USLocateNumber,
                    FFAppConstants.USMaskNumberDecimal)
                : FFAppConstants.EMPTYSTRING)
            : FFAppConstants.EMPTYSTRING);
    _model.cSalePriceBasis1FocusNode ??= FocusNode();
    _model.cSalePriceBasis1FocusNode!.addListener(
      () async {
        await _model.cSaleSavePriceInput(context);
      },
    );
    _model.cSalePriceFuture1TextController ??= TextEditingController(
        text: functions.isArrayNullOrEmpty(FFAppState()
                .ContractSaleData
                .priceSchedule
                .map((e) => e.toMap())
                .toList()
                .toList())
            ? functions.formatNumberDoubleToStringMask(
                FFAppState().ContractSaleData.priceSchedule.first.futurePrice,
                FFAppConstants.USLocateNumber,
                FFAppConstants.USMaskNumberDecimal)
            : FFAppConstants.EMPTYSTRING);
    _model.cSalePriceFuture1FocusNode ??= FocusNode();
    _model.cSalePriceFuture1FocusNode!.addListener(
      () async {
        await _model.cSaleSavePriceInput(context);
      },
    );
    _model.cSalePriceBasis2TextController ??= TextEditingController(
        text: functions.isArrayNullOrEmpty(FFAppState()
                .ContractSaleData
                .priceSchedule
                .map((e) => e.toMap())
                .toList()
                .toList())
            ? (FFAppState().ContractSaleData.priceSchedule.first.basis != 0.0
                ? functions.formatNumberDoubleToStringMask(
                    (double basis) {
                      return basis >= 0 ? basis : basis * -1;
                    }(FFAppState().ContractSaleData.priceSchedule.first.basis),
                    FFAppConstants.USLocateNumber,
                    FFAppConstants.USMaskNumberDecimal)
                : FFAppConstants.EMPTYSTRING)
            : FFAppConstants.EMPTYSTRING);
    _model.cSalePriceBasis2FocusNode ??= FocusNode();
    _model.cSalePriceBasis2FocusNode!.addListener(
      () async {
        await _model.cSaleSavePriceInput(context);
      },
    );
    _model.cSaleLogisticMinTextController ??= TextEditingController(
        text: functions.isArrayNullOrEmpty(FFAppState()
                .ContractSaleData
                .logisticSchedule
                .map((e) => e.toMap())
                .toList()
                .toList())
            ? functions.formatNumberDoubleToStringMask(
                FFAppState()
                    .ContractSaleData
                    .logisticSchedule
                    .first
                    .freightCost
                    .min,
                FFAppConstants.USLocateNumber,
                FFAppConstants.USMaskNumberDecimal)
            : FFAppConstants.EMPTYSTRING);
    _model.cSaleLogisticMinFocusNode ??= FocusNode();
    _model.cSaleLogisticMinFocusNode!.addListener(
      () async {
        await _model.cSaleSaveLogisticPrice(context);
      },
    );
    _model.cSaleLogisticMaxTextController ??= TextEditingController(
        text: functions.isArrayNullOrEmpty(FFAppState()
                .ContractSaleData
                .logisticSchedule
                .map((e) => e.toMap())
                .toList()
                .toList())
            ? functions.formatNumberDoubleToStringMask(
                FFAppState()
                    .ContractSaleData
                    .logisticSchedule
                    .first
                    .freightCost
                    .max,
                FFAppConstants.USLocateNumber,
                FFAppConstants.USMaskNumberDecimal)
            : FFAppConstants.EMPTYSTRING);
    _model.cSaleLogisticMaxFocusNode ??= FocusNode();
    _model.cSaleLogisticMaxFocusNode!.addListener(
      () async {
        await _model.cSaleSaveLogisticPrice(context);
      },
    );
    _model.cSaleShipmentDateFromTextController ??= TextEditingController(
        text: FFAppState().ContractSaleData != null
            ? functions.formatStringDateToUi(
                FFAppState().ContractSaleData.shippingStartDate, 'dd/MM/yyyy')
            : FFAppConstants.EMPTYSTRING);
    _model.cSaleShipmentDateFromFocusNode ??= FocusNode();
    _model.cSaleShipmentDateFromFocusNode!.addListener(() => setState(() {}));
    _model.cSaleShipmentDateToTextController ??= TextEditingController(
        text: FFAppState().ContractSaleData != null
            ? functions.formatStringDateToUi(
                FFAppState().ContractSaleData.shippingEndDate, 'dd/MM/yyyy')
            : FFAppConstants.EMPTYSTRING);
    _model.cSaleShipmentDateToFocusNode ??= FocusNode();
    _model.cSaleShipmentDateToFocusNode!.addListener(() => setState(() {}));
    _model.cSaleRemarkContactTextController ??= TextEditingController(
        text: functions.findRemarkInList(
            FFAppState().ContractSaleData.remarks.toList(), 'contact'));
    _model.cSaleRemarkContactFocusNode ??= FocusNode();
    _model.cSaleRemarkContactFocusNode!.addListener(
      () async {
        await _model.cSaleSaveLogisticRemarks(context);
      },
    );
    _model.cSaleRemarksShipmentTextController ??= TextEditingController(
        text: functions.findRemarkInList(
            FFAppState().ContractSaleData.remarks.toList(), 'shipment'));
    _model.cSaleRemarksShipmentFocusNode ??= FocusNode();
    _model.cSaleRemarksShipmentFocusNode!.addListener(
      () async {
        await _model.cSaleSaveLogisticRemarks(context);
      },
    );
    _model.cSaleRemarkRoutingTextController ??= TextEditingController(
        text: functions.findRemarkInList(
            FFAppState().ContractSaleData.remarks.toList(), 'routing'));
    _model.cSaleRemarkRoutingFocusNode ??= FocusNode();
    _model.cSaleRemarkRoutingFocusNode!.addListener(
      () async {
        await _model.cSaleSaveLogisticRemarks(context);
      },
    );
    _model.cSaleRemarkPremDiscTextController ??= TextEditingController(
        text: functions.findRemarkInList(
            FFAppState().ContractSaleData.remarks.toList(), 'premDisc'));
    _model.cSaleRemarkPremDiscFocusNode ??= FocusNode();
    _model.cSaleRemarkPremDiscFocusNode!.addListener(
      () async {
        await _model.cSaleSaveLogisticRemarks(context);
      },
    );
    _model.cSaleRemarkTermsTextController ??= TextEditingController(
        text: functions.findRemarkInList(
            FFAppState().ContractSaleData.remarks.toList(), 'terms'));
    _model.cSaleRemarkTermsFocusNode ??= FocusNode();
    _model.cSaleRemarkTermsFocusNode!.addListener(
      () async {
        await _model.cSaleSaveLogisticRemarks(context);
      },
    );
    _model.cSaleRemarkRemarksTextController ??= TextEditingController(
        text: functions.findRemarkInList(
            FFAppState().ContractSaleData.remarks.toList(), 'remarks'));
    _model.cSaleRemarkRemarksFocusNode ??= FocusNode();
    _model.cSaleRemarkRemarksFocusNode!.addListener(
      () async {
        await _model.cSaleSaveLogisticRemarks(context);
      },
    );
    _model.cSaleNoteTextController ??= TextEditingController(
        text: (FFAppState().ContractSaleData.notes.isNotEmpty) == true
            ? FFAppState().ContractSaleData.notes.first.text
            : '');
    _model.cSaleNoteFocusNode ??= FocusNode();
    _model.cSaleNoteFocusNode!.addListener(
      () async {
        if (!FFAppState().ContractSaleMetadata.incomplete) {
          // CleanNotesInList
          FFAppState().updateContractSaleDataStruct(
            (e) => e..notes = [],
          );
          FFAppState().updateContractSaleDataStruct(
            (e) => e
              ..notes = functions
                  .ctrCreateNotesInList(
                      FFAppState().UserSession.auth0Id,
                      FFAppState().UserSession.firstName,
                      _model.cSaleNoteTextController.text,
                      functions.dateToString(getCurrentTimestamp))
                  .toList(),
          );
        }
      },
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.sideNavModel,
                updateCallback: () => setState(() {}),
                child: SideNavWidget(
                  selectedNav: Pages.sale_contracts,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            valueOrDefault<double>(
                              () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
                                  return functions.containerParentPadding(
                                      MediaQuery.sizeOf(context).width);
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium) {
                                  return functions.containerParentPadding(
                                      MediaQuery.sizeOf(context).width);
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  return functions.containerParentPadding(
                                      MediaQuery.sizeOf(context).width);
                                } else {
                                  return functions.containerParentPadding(
                                      MediaQuery.sizeOf(context).width);
                                }
                              }(),
                              0.0,
                            ),
                            10.0,
                            valueOrDefault<double>(
                              () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
                                  return functions.containerParentPadding(
                                      MediaQuery.sizeOf(context).width);
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium) {
                                  return functions.containerParentPadding(
                                      MediaQuery.sizeOf(context).width);
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  return functions.containerParentPadding(
                                      MediaQuery.sizeOf(context).width);
                                } else {
                                  return functions.containerParentPadding(
                                      MediaQuery.sizeOf(context).width);
                                }
                              }(),
                              0.0,
                            ),
                            10.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 11.42,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Container(
                                    width: functions.containerBodyWidthRv(
                                        MediaQuery.sizeOf(context).width),
                                    constraints: BoxConstraints(
                                      minWidth: () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        } else {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        }
                                      }(),
                                      minHeight: 60.0,
                                      maxWidth: () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        } else {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        }
                                      }(),
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 24.0, 0.0, 8.0),
                                            child: Text(
                                              'New Sale Contract',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 24.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Container(
                                    width: functions.containerBodyWidthRv(
                                        MediaQuery.sizeOf(context).width),
                                    constraints: BoxConstraints(
                                      minWidth: () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        } else {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        }
                                      }(),
                                      minHeight: 200.0,
                                      maxWidth: () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        } else {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        }
                                      }(),
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Container(
                                          width: 100.0,
                                          height: 24.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Text(
                                                  'Contract Type',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 24.0,
                                                  alignment: WrapAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      width: 551.0,
                                                      height: 70.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                        maxWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              String>(
                                                        controller: _model
                                                                .cSalePriceTypeValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model
                                                              .cSalePriceTypeValue ??= functions
                                                                  .isArrayNullOrEmpty(FFAppState()
                                                                      .ContractSaleData
                                                                      .priceSchedule
                                                                      .map((e) => e
                                                                          .toMap())
                                                                      .toList())
                                                              ? FFAppState()
                                                                  .ContractSaleData
                                                                  .priceSchedule
                                                                  .first
                                                                  .pricingType
                                                              : FFAppConstants
                                                                  .NOTSELECTEDSTRING,
                                                        ),
                                                        options: List<
                                                                String>.from(
                                                            CtrPrincingTypeEnum
                                                                .values
                                                                .map((e) =>
                                                                    e.name)
                                                                .toList()),
                                                        optionLabels: [
                                                          'Fixed',
                                                          'Basis'
                                                        ],
                                                        onChanged: (val) async {
                                                          setState(() => _model
                                                                  .cSalePriceTypeValue =
                                                              val);
                                                          await _model
                                                              .cSaleSavePriceInput(
                                                                  context);
                                                        },
                                                        width: double.infinity,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderWidth: 2.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    1.0,
                                                                    16.0,
                                                                    1.0),
                                                        hidesUnderline: true,
                                                        isOverButton: true,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                        labelText: 'Type',
                                                        labelTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 551.0,
                                                      height: 70.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                        maxWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              String>(
                                                        controller: _model
                                                                .cSaleTypeSubTypeValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model
                                                              .cSaleTypeSubTypeValue ??= FFAppState()
                                                                      .ContractSaleData !=
                                                                  null
                                                              ? FFAppState()
                                                                  .ContractSaleData
                                                                  .subType
                                                              : FFAppConstants
                                                                  .NOTSELECTEDSTRING,
                                                        ),
                                                        options:
                                                            List<String>.from([
                                                          'direct',
                                                          'imported',
                                                          'imported-freight'
                                                        ]),
                                                        optionLabels: [
                                                          'Direct',
                                                          'Imported',
                                                          'Imported Freight'
                                                        ],
                                                        onChanged: (val) async {
                                                          setState(() => _model
                                                                  .cSaleTypeSubTypeValue =
                                                              val);
                                                          await _model
                                                              .cSaleSaveRootFields(
                                                                  context);
                                                        },
                                                        width: double.infinity,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderWidth: 2.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    1.0,
                                                                    16.0,
                                                                    1.0),
                                                        hidesUnderline: true,
                                                        isOverButton: true,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                        labelText: 'Sub Type',
                                                        labelTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 24.0,
                                                  alignment: WrapAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      width: 551.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                        maxWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .cSaleTypeCustomerNameTextController,
                                                                focusNode: _model
                                                                    .cSaleTypeCustomerNameFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.cSaleTypeCustomerNameTextController',
                                                                  Duration(
                                                                      milliseconds:
                                                                          2000),
                                                                  () => setState(
                                                                      () {}),
                                                                ),
                                                                autofocus: true,
                                                                textCapitalization:
                                                                    TextCapitalization
                                                                        .words,
                                                                readOnly: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      'Customer Name',
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .name,
                                                                validator: _model
                                                                    .cSaleTypeCustomerNameTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                          Builder(
                                                            builder:
                                                                (context) =>
                                                                    Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  if (isWeb) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap: () => _model.unfocusNode.canRequestFocus
                                                                                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                                : FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                Container(
                                                                              height: 700.0,
                                                                              width: 600.0,
                                                                              child: SelectPeopleDialogWidget(
                                                                                role: Role.seller,
                                                                                selectedItemParameter: (seletedItem) async {
                                                                                  FFAppState().updateContractSaleDataStruct(
                                                                                    (e) => e..participants = [],
                                                                                  );
                                                                                  FFAppState().updateContractSaleDataStruct(
                                                                                    (e) => e
                                                                                      ..updateParticipants(
                                                                                        (e) => e.add(CtrParticipantSchemaStruct(
                                                                                          peopleId: getJsonField(
                                                                                            seletedItem,
                                                                                            r'''$._id''',
                                                                                          ).toString(),
                                                                                          name: getJsonField(
                                                                                            seletedItem,
                                                                                            r'''$.full_name''',
                                                                                          ).toString(),
                                                                                          role: 'buyer',
                                                                                        )),
                                                                                      ),
                                                                                  );
                                                                                  setState(() {
                                                                                    _model.cSaleTypeCustomerNameTextController?.text = FFAppState().ContractSaleData.participants.first.name;
                                                                                    _model.cSaleTypeCustomerNameTextController?.selection = TextSelection.collapsed(offset: _model.cSaleTypeCustomerNameTextController!.text.length);
                                                                                  });
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  } else {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                Container(
                                                                              height: 650.0,
                                                                              child: SelectPeopleBottomWidget(
                                                                                role: Role.seller,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(() =>
                                                                            _model.peopleSeletedToContract =
                                                                                value));

                                                                    FFAppState()
                                                                        .updateContractPurchaseStruct(
                                                                      (e) => e
                                                                        ..participants =
                                                                            [],
                                                                    );
                                                                    FFAppState()
                                                                        .updateContractPurchaseStruct(
                                                                      (e) => e
                                                                        ..updateParticipants(
                                                                          (e) =>
                                                                              e.add(CtrParticipantSchemaStruct(
                                                                            peopleId:
                                                                                _model.peopleSeletedToContract?.id,
                                                                            name:
                                                                                _model.peopleSeletedToContract?.fullName,
                                                                            role:
                                                                                'buyer',
                                                                          )),
                                                                        ),
                                                                    );
                                                                    setState(
                                                                        () {
                                                                      _model.cSaleTypeCustomerNameTextController?.text = FFAppState()
                                                                          .ContractPurchase
                                                                          .participants
                                                                          .first
                                                                          .name;
                                                                      _model.cSaleTypeCustomerNameTextController?.selection = TextSelection.collapsed(
                                                                          offset: _model
                                                                              .cSaleTypeCustomerNameTextController!
                                                                              .text
                                                                              .length);
                                                                    });
                                                                  }

                                                                  setState(
                                                                      () {});
                                                                },
                                                                text: 'Search',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 40.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  elevation:
                                                                      3.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 551.0,
                                                      height: 60.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                        maxWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Flexible(
                                                            flex: 7,
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .cSaleTypeContratDateTextController,
                                                                focusNode: _model
                                                                    .cSaleTypeContratDateFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.cSaleTypeContratDateTextController',
                                                                  Duration(
                                                                      milliseconds:
                                                                          2000),
                                                                  () => setState(
                                                                      () {}),
                                                                ),
                                                                autofocus: true,
                                                                textCapitalization:
                                                                    TextCapitalization
                                                                        .none,
                                                                readOnly: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      'ContractDate',
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  suffixIcon: _model
                                                                          .cSaleTypeContratDateTextController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.cSaleTypeContratDateTextController?.clear();
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.clear,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        )
                                                                      : null,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .datetime,
                                                                validator: _model
                                                                    .cSaleTypeContratDateTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                          Flexible(
                                                            flex: 1,
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0, 0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    48.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .calendar_month,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  final _datePicked1Date =
                                                                      await showDatePicker(
                                                                    context:
                                                                        context,
                                                                    initialDate: functions.formatStringToDatetime(
                                                                        _model
                                                                            .cSaleTypeContratDateTextController
                                                                            .text,
                                                                        'dd/MM/yyyy'),
                                                                    firstDate:
                                                                        DateTime(
                                                                            1900),
                                                                    lastDate:
                                                                        DateTime(
                                                                            2050),
                                                                    builder:
                                                                        (context,
                                                                            child) {
                                                                      return wrapInMaterialDatePickerTheme(
                                                                        context,
                                                                        child!,
                                                                        headerBackgroundColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        headerForegroundColor:
                                                                            FlutterFlowTheme.of(context).info,
                                                                        headerTextStyle: FlutterFlowTheme.of(context)
                                                                            .headlineLarge
                                                                            .override(
                                                                              fontFamily: 'Inter',
                                                                              fontSize: 32.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                        pickerBackgroundColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        pickerForegroundColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        selectedDateTimeBackgroundColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        selectedDateTimeForegroundColor:
                                                                            FlutterFlowTheme.of(context).info,
                                                                        actionButtonForegroundColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        iconSize:
                                                                            24.0,
                                                                      );
                                                                    },
                                                                  );

                                                                  if (_datePicked1Date !=
                                                                      null) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.datePicked1 =
                                                                          DateTime(
                                                                        _datePicked1Date
                                                                            .year,
                                                                        _datePicked1Date
                                                                            .month,
                                                                        _datePicked1Date
                                                                            .day,
                                                                      );
                                                                    });
                                                                  }
                                                                  await Future
                                                                      .wait([
                                                                    Future(
                                                                        () async {
                                                                      setState(
                                                                          () {
                                                                        _model
                                                                            .cSaleTypeContratDateTextController
                                                                            ?.text = dateTimeFormat(
                                                                          'dd/MM/yyyy',
                                                                          _model
                                                                              .datePicked1,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        );
                                                                        _model
                                                                            .cSaleTypeContratDateTextController
                                                                            ?.selection = TextSelection.collapsed(offset: _model.cSaleTypeContratDateTextController!.text.length);
                                                                      });
                                                                    }),
                                                                    Future(
                                                                        () async {
                                                                      FFAppState()
                                                                          .updateContractSaleDataStruct(
                                                                        (e) => e
                                                                          ..contractDate =
                                                                              dateTimeFormat(
                                                                            'yyyy-MM-ddTHH:mm:00.000',
                                                                            _model.datePicked1,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                      );
                                                                    }),
                                                                  ]);
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 24.0,
                                                  alignment: WrapAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      width: 551.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                        maxWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              String>(
                                                        controller: _model
                                                                .cSaleTypeCommodityValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model
                                                              .cSaleTypeCommodityValue ??= FFAppState()
                                                                      .ContractSaleData !=
                                                                  null
                                                              ? FFAppState()
                                                                  .ContractSaleData
                                                                  .commodity
                                                                  .commodityId
                                                              : FFAppConstants
                                                                  .NOTSELECTEDSTRING,
                                                        ),
                                                        options:
                                                            List<String>.from(
                                                                FFAppState()
                                                                    .Commodities
                                                                    .map((e) =>
                                                                        e.id)
                                                                    .toList()),
                                                        optionLabels:
                                                            FFAppState()
                                                                .Commodities
                                                                .map((e) =>
                                                                    e.name)
                                                                .toList(),
                                                        onChanged: (val) async {
                                                          setState(() => _model
                                                                  .cSaleTypeCommodityValue =
                                                              val);
                                                          if (!FFAppState()
                                                              .ContractSaleMetadata
                                                              .incomplete) {
                                                            // UpdateComodityObject
                                                            FFAppState()
                                                                .updateContractSaleDataStruct(
                                                              (e) => e
                                                                ..commodity =
                                                                    CtrCommoditySchemaStruct(
                                                                  commodityId:
                                                                      _model
                                                                          .cSaleTypeCommodityValue,
                                                                  name: functions.findCommodityInList(
                                                                      FFAppState()
                                                                          .Commodities
                                                                          .toList(),
                                                                      _model
                                                                          .cSaleTypeCommodityValue!),
                                                                ),
                                                            );
                                                            setState(() {});
                                                          }
                                                        },
                                                        width: double.infinity,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderWidth: 2.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    1.0,
                                                                    16.0,
                                                                    1.0),
                                                        hidesUnderline: true,
                                                        isOverButton: true,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                        labelText: 'Commodity',
                                                        labelTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 551.0,
                                                      height: 60.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                        maxWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .stretch,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child:
                                                                  FlutterFlowDropDown<
                                                                      int>(
                                                                controller: _model
                                                                        .cSaleTypeGradeValueController ??=
                                                                    FormFieldController<
                                                                        int>(
                                                                  _model
                                                                      .cSaleTypeGradeValue ??= FFAppState()
                                                                              .ContractSaleData !=
                                                                          null
                                                                      ? FFAppState()
                                                                          .ContractSaleData
                                                                          .grade
                                                                      : 0,
                                                                ),
                                                                options: List<
                                                                    int>.from([
                                                                  1,
                                                                  2,
                                                                  3,
                                                                  4
                                                                ]),
                                                                optionLabels: [
                                                                  '#1',
                                                                  '#2',
                                                                  '#3',
                                                                  '#4'
                                                                ],
                                                                onChanged:
                                                                    (val) async {
                                                                  setState(() =>
                                                                      _model.cSaleTypeGradeValue =
                                                                          val);
                                                                  await _model
                                                                      .cSaleSaveRootFields(
                                                                          context);
                                                                },
                                                                width: 20.0,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                elevation: 2.0,
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                borderWidth:
                                                                    2.0,
                                                                borderRadius:
                                                                    8.0,
                                                                margin: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        1.0,
                                                                        16.0,
                                                                        1.0),
                                                                hidesUnderline:
                                                                    true,
                                                                isOverButton:
                                                                    true,
                                                                isSearchable:
                                                                    false,
                                                                isMultiSelect:
                                                                    false,
                                                                labelText:
                                                                    'Grade',
                                                                labelTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 2,
                                                              child: Container(
                                                                width: 10.0,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .cSaleTypeQuantityTextController,
                                                                  focusNode: _model
                                                                      .cSaleTypeQuantityFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.cSaleTypeQuantityTextController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            1000),
                                                                    () async {
                                                                      setState(
                                                                          () {
                                                                        _model.cSaleTypeQuantityTextController?.text = functions.formatNumberStringToStringMask(
                                                                            _model.cSaleTypeQuantityTextController.text,
                                                                            FFAppConstants.USLocateNumber,
                                                                            FFAppConstants.USMaskNumber);
                                                                      });
                                                                    },
                                                                  ),
                                                                  autofocus:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Quantity',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    suffixIcon: _model
                                                                            .cSaleTypeQuantityTextController!
                                                                            .text
                                                                            .isNotEmpty
                                                                        ? InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              _model.cSaleTypeQuantityTextController?.clear();
                                                                              setState(() {
                                                                                _model.cSaleTypeQuantityTextController?.text = functions.formatNumberStringToStringMask(_model.cSaleTypeQuantityTextController.text, FFAppConstants.USLocateNumber, FFAppConstants.USMaskNumber);
                                                                              });
                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.clear,
                                                                              size: 24.0,
                                                                            ),
                                                                          )
                                                                        : null,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  keyboardType: const TextInputType
                                                                      .numberWithOptions(
                                                                      decimal:
                                                                          true),
                                                                  validator: _model
                                                                      .cSaleTypeQuantityTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                  inputFormatters: [
                                                                    FilteringTextInputFormatter
                                                                        .allow(RegExp(
                                                                            '[0-9]'))
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child:
                                                                  FlutterFlowDropDown<
                                                                      String>(
                                                                controller: _model
                                                                        .cSaleTypeUnitValueController ??=
                                                                    FormFieldController<
                                                                        String>(
                                                                  _model
                                                                      .cSaleTypeUnitValue ??= FFAppState()
                                                                              .ContractSaleData !=
                                                                          null
                                                                      ? FFAppState()
                                                                          .ContractSaleData
                                                                          .subType
                                                                      : FFAppConstants
                                                                          .NOTSELECTEDSTRING,
                                                                ),
                                                                options: List<
                                                                        String>.from(
                                                                    CtrMeasurementUnitEnum
                                                                        .values
                                                                        .map((e) =>
                                                                            e.name)
                                                                        .toList()),
                                                                optionLabels: [
                                                                  'Bushel',
                                                                  'Mt',
                                                                  'Cwt'
                                                                ],
                                                                onChanged:
                                                                    (val) async {
                                                                  setState(() =>
                                                                      _model.cSaleTypeUnitValue =
                                                                          val);
                                                                  await _model
                                                                      .cSaleSaveRootFields(
                                                                          context);
                                                                },
                                                                width: 98.0,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                elevation: 2.0,
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                borderWidth:
                                                                    2.0,
                                                                borderRadius:
                                                                    8.0,
                                                                margin: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        1.0,
                                                                        16.0,
                                                                        1.0),
                                                                hidesUnderline:
                                                                    true,
                                                                isOverButton:
                                                                    true,
                                                                isSearchable:
                                                                    false,
                                                                isMultiSelect:
                                                                    false,
                                                                labelText:
                                                                    'Unit',
                                                                labelTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 10.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 100.0,
                                          height: 24.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Text(
                                                  'Price Contract',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 24.0,
                                                  alignment: WrapAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      width: 551.0,
                                                      height: 70.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                        maxWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              String>(
                                                        controller: _model
                                                                .cSalePriceCurrencyValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model
                                                              .cSalePriceCurrencyValue ??= functions
                                                                  .isArrayNullOrEmpty(FFAppState()
                                                                      .ContractSaleData
                                                                      .priceSchedule
                                                                      .map((e) => e
                                                                          .toMap())
                                                                      .toList())
                                                              ? FFAppState()
                                                                  .ContractSaleData
                                                                  .priceSchedule
                                                                  .first
                                                                  .paymentCurrency
                                                              : FFAppConstants
                                                                  .NOTSELECTEDSTRING,
                                                        ),
                                                        options:
                                                            List<String>.from(
                                                                CtrCurrencyEnum
                                                                    .values
                                                                    .map((e) =>
                                                                        e.name)
                                                                    .toList()),
                                                        optionLabels: [
                                                          'Usd',
                                                          'Mxn'
                                                        ],
                                                        onChanged: (val) async {
                                                          setState(() => _model
                                                                  .cSalePriceCurrencyValue =
                                                              val);
                                                          await _model
                                                              .cSaleSavePriceInput(
                                                                  context);
                                                        },
                                                        width: double.infinity,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderWidth: 2.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    1.0,
                                                                    16.0,
                                                                    1.0),
                                                        hidesUnderline: true,
                                                        isOverButton: true,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                        labelText: 'Currency',
                                                        labelTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (_model.cSalePriceTypeValue ==
                                                  'fixed')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 0.0),
                                                  child: Wrap(
                                                    spacing: 0.0,
                                                    runSpacing: 24.0,
                                                    alignment: WrapAlignment
                                                        .spaceBetween,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .center,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      Container(
                                                        width: 551.0,
                                                        height: 60.0,
                                                        constraints:
                                                            BoxConstraints(
                                                          minWidth: functions.containerControlWidthRv(
                                                              MediaQuery.sizeOf(
                                                                      context)
                                                                  .width,
                                                              functions.containerBodyWidthRv(
                                                                  MediaQuery.sizeOf(
                                                                          context)
                                                                      .width))!,
                                                          maxWidth: functions.containerControlWidthRv(
                                                              MediaQuery.sizeOf(
                                                                      context)
                                                                  .width,
                                                              functions.containerBodyWidthRv(
                                                                  MediaQuery.sizeOf(
                                                                          context)
                                                                      .width))!,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .cSalePricePrice1TextController,
                                                            focusNode: _model
                                                                .cSalePricePrice1FocusNode,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.cSalePricePrice1TextController',
                                                              Duration(
                                                                  milliseconds:
                                                                      1000),
                                                              () async {
                                                                // Set Format Price
                                                                setState(() {
                                                                  _model.cSalePricePrice1TextController?.text = functions.formatNumberStringToStringMask(
                                                                      _model
                                                                          .cSalePricePrice1TextController
                                                                          .text,
                                                                      FFAppConstants
                                                                          .USLocateNumber,
                                                                      FFAppConstants
                                                                          .USMaskNumberDecimal);
                                                                  _model.cSalePricePrice1TextController
                                                                          ?.selection =
                                                                      TextSelection.collapsed(
                                                                          offset: _model
                                                                              .cSalePricePrice1TextController!
                                                                              .text
                                                                              .length);
                                                                });
                                                                setState(() {
                                                                  _model.cSaleSymbol1ValueController?.value = functions.contractSymbolToZero(
                                                                      _model
                                                                          .cSalePriceBasis1TextController
                                                                          .text,
                                                                      FFAppConstants
                                                                          .USLocateNumber,
                                                                      FFAppConstants
                                                                          .USMaskNumberDecimal);
                                                                });
                                                                setState(() {
                                                                  _model.cSalePriceBasis1TextController?.text = functions.formatNumberStringToStringMask(
                                                                      functions.formatNumbersQuantity(
                                                                          0.0,
                                                                          FFAppConstants
                                                                              .USLocateNumber,
                                                                          FFAppConstants
                                                                              .USMaskNumberDecimal),
                                                                      FFAppConstants
                                                                          .USLocateNumber,
                                                                      FFAppConstants
                                                                          .USMaskNumberDecimal);
                                                                  _model.cSalePriceBasis1TextController
                                                                          ?.selection =
                                                                      TextSelection.collapsed(
                                                                          offset: _model
                                                                              .cSalePriceBasis1TextController!
                                                                              .text
                                                                              .length);
                                                                });
                                                                setState(() {
                                                                  _model.cSalePriceFuture1TextController?.text = functions.formatNumberStringToStringMask(
                                                                      _model
                                                                          .cSalePricePrice1TextController
                                                                          .text,
                                                                      FFAppConstants
                                                                          .USLocateNumber,
                                                                      FFAppConstants
                                                                          .USMaskNumberDecimal);
                                                                  _model.cSalePriceFuture1TextController
                                                                          ?.selection =
                                                                      TextSelection.collapsed(
                                                                          offset: _model
                                                                              .cSalePriceFuture1TextController!
                                                                              .text
                                                                              .length);
                                                                });
                                                                await _model
                                                                    .cSaleSavePriceInput(
                                                                        context);
                                                              },
                                                            ),
                                                            autofocus: true,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Price',
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              suffixIcon: _model
                                                                      .cSalePricePrice1TextController!
                                                                      .text
                                                                      .isNotEmpty
                                                                  ? InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        _model
                                                                            .cSalePricePrice1TextController
                                                                            ?.clear(); // Set Format Price
                                                                        setState(
                                                                            () {
                                                                          _model.cSalePricePrice1TextController?.text = functions.formatNumberStringToStringMask(
                                                                              _model.cSalePricePrice1TextController.text,
                                                                              FFAppConstants.USLocateNumber,
                                                                              FFAppConstants.USMaskNumberDecimal);
                                                                          _model
                                                                              .cSalePricePrice1TextController
                                                                              ?.selection = TextSelection.collapsed(offset: _model.cSalePricePrice1TextController!.text.length);
                                                                        });
                                                                        setState(
                                                                            () {
                                                                          _model.cSaleSymbol1ValueController?.value = functions.contractSymbolToZero(
                                                                              _model.cSalePriceBasis1TextController.text,
                                                                              FFAppConstants.USLocateNumber,
                                                                              FFAppConstants.USMaskNumberDecimal);
                                                                        });
                                                                        setState(
                                                                            () {
                                                                          _model.cSalePriceBasis1TextController?.text = functions.formatNumberStringToStringMask(
                                                                              functions.formatNumbersQuantity(0.0, FFAppConstants.USLocateNumber, FFAppConstants.USMaskNumberDecimal),
                                                                              FFAppConstants.USLocateNumber,
                                                                              FFAppConstants.USMaskNumberDecimal);
                                                                          _model
                                                                              .cSalePriceBasis1TextController
                                                                              ?.selection = TextSelection.collapsed(offset: _model.cSalePriceBasis1TextController!.text.length);
                                                                        });
                                                                        setState(
                                                                            () {
                                                                          _model.cSalePriceFuture1TextController?.text = functions.formatNumberStringToStringMask(
                                                                              _model.cSalePricePrice1TextController.text,
                                                                              FFAppConstants.USLocateNumber,
                                                                              FFAppConstants.USMaskNumberDecimal);
                                                                          _model
                                                                              .cSalePriceFuture1TextController
                                                                              ?.selection = TextSelection.collapsed(offset: _model.cSalePriceFuture1TextController!.text.length);
                                                                        });
                                                                        await _model
                                                                            .cSaleSavePriceInput(context);
                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .clear,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    )
                                                                  : null,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                            validator: _model
                                                                .cSalePricePrice1TextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                            inputFormatters: [
                                                              FilteringTextInputFormatter
                                                                  .allow(RegExp(
                                                                      '^[0-9.]+\$'))
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 551.0,
                                                        height: 60.0,
                                                        constraints:
                                                            BoxConstraints(
                                                          minWidth: functions.containerControlWidthRv(
                                                              MediaQuery.sizeOf(
                                                                      context)
                                                                  .width,
                                                              functions.containerBodyWidthRv(
                                                                  MediaQuery.sizeOf(
                                                                          context)
                                                                      .width))!,
                                                          maxWidth: functions.containerControlWidthRv(
                                                              MediaQuery.sizeOf(
                                                                      context)
                                                                  .width,
                                                              functions.containerBodyWidthRv(
                                                                  MediaQuery.sizeOf(
                                                                          context)
                                                                      .width))!,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                flex: 1,
                                                                child:
                                                                    FlutterFlowDropDown<
                                                                        int>(
                                                                  controller: _model
                                                                          .cSaleSymbol1ValueController ??=
                                                                      FormFieldController<
                                                                          int>(
                                                                    _model
                                                                        .cSaleSymbol1Value ??= functions.isArrayNullOrEmpty(FFAppState()
                                                                            .ContractSaleData
                                                                            .priceSchedule
                                                                            .map((e) => e
                                                                                .toMap())
                                                                            .toList())
                                                                        ? ((double
                                                                            basis) {
                                                                            return basis >= 0
                                                                                ? 1
                                                                                : -1;
                                                                          }(FFAppState()
                                                                            .ContractSaleData
                                                                            .priceSchedule
                                                                            .first
                                                                            .basis))
                                                                        : 1,
                                                                  ),
                                                                  options: List<
                                                                      int>.from([
                                                                    1,
                                                                    -1
                                                                  ]),
                                                                  optionLabels: [
                                                                    '+',
                                                                    '-'
                                                                  ],
                                                                  onChanged:
                                                                      (val) async {
                                                                    setState(() =>
                                                                        _model.cSaleSymbol1Value =
                                                                            val);
                                                                    setState(
                                                                        () {
                                                                      _model.cSalePriceFuture1TextController?.text = functions.contractCalcFuture(
                                                                          _model
                                                                              .cSalePriceBasis1TextController
                                                                              .text,
                                                                          _model
                                                                              .cSalePricePrice1TextController
                                                                              .text,
                                                                          _model
                                                                              .cSaleSymbol1Value!,
                                                                          FFAppConstants
                                                                              .USLocateNumber,
                                                                          FFAppConstants
                                                                              .USMaskNumberDecimal)!;
                                                                      _model.cSalePriceFuture1TextController?.selection = TextSelection.collapsed(
                                                                          offset: _model
                                                                              .cSalePriceFuture1TextController!
                                                                              .text
                                                                              .length);
                                                                    });
                                                                    await _model
                                                                        .cSaleSavePriceInput(
                                                                            context);
                                                                  },
                                                                  width: 300.0,
                                                                  height: 56.0,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintText:
                                                                      'Please select...',
                                                                  icon: Icon(
                                                                    Icons
                                                                        .keyboard_arrow_down_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  elevation:
                                                                      2.0,
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                  borderWidth:
                                                                      2.0,
                                                                  borderRadius:
                                                                      8.0,
                                                                  margin: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                  hidesUnderline:
                                                                      true,
                                                                  isOverButton:
                                                                      true,
                                                                  isSearchable:
                                                                      false,
                                                                  isMultiSelect:
                                                                      false,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 3,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .cSalePriceBasis1TextController,
                                                                  focusNode: _model
                                                                      .cSalePriceBasis1FocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.cSalePriceBasis1TextController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            1000),
                                                                    () async {
                                                                      setState(
                                                                          () {
                                                                        _model.cSalePriceBasis1TextController?.text = functions.formatNumberStringToStringMask(
                                                                            _model.cSalePriceBasis1TextController.text,
                                                                            FFAppConstants.USLocateNumber,
                                                                            FFAppConstants.USMaskNumberDecimal);
                                                                        _model
                                                                            .cSalePriceBasis1TextController
                                                                            ?.selection = TextSelection.collapsed(offset: _model.cSalePriceBasis1TextController!.text.length);
                                                                      });
                                                                      setState(
                                                                          () {
                                                                        _model.cSalePriceFuture1TextController?.text = functions.contractCalcFuture(
                                                                            _model.cSalePriceBasis1TextController.text,
                                                                            _model.cSalePricePrice1TextController.text,
                                                                            _model.cSaleSymbol1Value!,
                                                                            FFAppConstants.USLocateNumber,
                                                                            FFAppConstants.USMaskNumberDecimal)!;
                                                                        _model
                                                                            .cSalePriceFuture1TextController
                                                                            ?.selection = TextSelection.collapsed(offset: _model.cSalePriceFuture1TextController!.text.length);
                                                                      });
                                                                      setState(
                                                                          () {
                                                                        _model.cSaleSymbol1ValueController?.value = functions.contractSymbolToZero(
                                                                            _model.cSalePriceBasis1TextController.text,
                                                                            FFAppConstants.USLocateNumber,
                                                                            FFAppConstants.USMaskNumberDecimal);
                                                                      });
                                                                      await _model
                                                                          .cSaleSavePriceInput(
                                                                              context);
                                                                    },
                                                                  ),
                                                                  autofocus:
                                                                      true,
                                                                  textCapitalization:
                                                                      TextCapitalization
                                                                          .none,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Basis',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    suffixIcon: _model
                                                                            .cSalePriceBasis1TextController!
                                                                            .text
                                                                            .isNotEmpty
                                                                        ? InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              _model.cSalePriceBasis1TextController?.clear();
                                                                              setState(() {
                                                                                _model.cSalePriceBasis1TextController?.text = functions.formatNumberStringToStringMask(_model.cSalePriceBasis1TextController.text, FFAppConstants.USLocateNumber, FFAppConstants.USMaskNumberDecimal);
                                                                                _model.cSalePriceBasis1TextController?.selection = TextSelection.collapsed(offset: _model.cSalePriceBasis1TextController!.text.length);
                                                                              });
                                                                              setState(() {
                                                                                _model.cSalePriceFuture1TextController?.text = functions.contractCalcFuture(_model.cSalePriceBasis1TextController.text, _model.cSalePricePrice1TextController.text, _model.cSaleSymbol1Value!, FFAppConstants.USLocateNumber, FFAppConstants.USMaskNumberDecimal)!;
                                                                                _model.cSalePriceFuture1TextController?.selection = TextSelection.collapsed(offset: _model.cSalePriceFuture1TextController!.text.length);
                                                                              });
                                                                              setState(() {
                                                                                _model.cSaleSymbol1ValueController?.value = functions.contractSymbolToZero(_model.cSalePriceBasis1TextController.text, FFAppConstants.USLocateNumber, FFAppConstants.USMaskNumberDecimal);
                                                                              });
                                                                              await _model.cSaleSavePriceInput(context);
                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.clear,
                                                                              size: 24.0,
                                                                            ),
                                                                          )
                                                                        : null,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  validator: _model
                                                                      .cSalePriceBasis1TextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                  inputFormatters: [
                                                                    FilteringTextInputFormatter
                                                                        .allow(RegExp(
                                                                            '^[0-9.]+\$'))
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 3,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .cSalePriceFuture1TextController,
                                                                  focusNode: _model
                                                                      .cSalePriceFuture1FocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.cSalePriceFuture1TextController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    () async {
                                                                      setState(
                                                                          () {
                                                                        _model.cSalePriceFuture1TextController?.text = functions.formatNumberStringToStringMask(
                                                                            _model.cSalePriceFuture1TextController.text,
                                                                            FFAppConstants.USLocateNumber,
                                                                            FFAppConstants.USMaskNumber);
                                                                        _model
                                                                            .cSalePriceFuture1TextController
                                                                            ?.selection = TextSelection.collapsed(offset: _model.cSalePriceFuture1TextController!.text.length);
                                                                      });
                                                                    },
                                                                  ),
                                                                  autofocus:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Futures',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    suffixIcon: _model
                                                                            .cSalePriceFuture1TextController!
                                                                            .text
                                                                            .isNotEmpty
                                                                        ? InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              _model.cSalePriceFuture1TextController?.clear();
                                                                              setState(() {
                                                                                _model.cSalePriceFuture1TextController?.text = functions.formatNumberStringToStringMask(_model.cSalePriceFuture1TextController.text, FFAppConstants.USLocateNumber, FFAppConstants.USMaskNumber);
                                                                                _model.cSalePriceFuture1TextController?.selection = TextSelection.collapsed(offset: _model.cSalePriceFuture1TextController!.text.length);
                                                                              });
                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.clear,
                                                                              size: 24.0,
                                                                            ),
                                                                          )
                                                                        : null,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  validator: _model
                                                                      .cSalePriceFuture1TextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                  inputFormatters: [
                                                                    FilteringTextInputFormatter
                                                                        .allow(RegExp(
                                                                            '^[0-9.]+\$'))
                                                                  ],
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              if (_model.cSalePriceTypeValue ==
                                                  'basis')
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 12.0, 0.0, 0.0),
                                                  child: Wrap(
                                                    spacing: 0.0,
                                                    runSpacing: 24.0,
                                                    alignment: WrapAlignment
                                                        .spaceBetween,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .center,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      Container(
                                                        width: 551.0,
                                                        height: 60.0,
                                                        constraints:
                                                            BoxConstraints(
                                                          minWidth: functions.containerControlWidthRv(
                                                              MediaQuery.sizeOf(
                                                                      context)
                                                                  .width,
                                                              functions.containerBodyWidthRv(
                                                                  MediaQuery.sizeOf(
                                                                          context)
                                                                      .width))!,
                                                          maxWidth: functions.containerControlWidthRv(
                                                              MediaQuery.sizeOf(
                                                                      context)
                                                                  .width,
                                                              functions.containerBodyWidthRv(
                                                                  MediaQuery.sizeOf(
                                                                          context)
                                                                      .width))!,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                flex: 1,
                                                                child:
                                                                    FlutterFlowDropDown<
                                                                        int>(
                                                                  controller: _model
                                                                          .cSaleSymbol2ValueController ??=
                                                                      FormFieldController<
                                                                          int>(
                                                                    _model
                                                                        .cSaleSymbol2Value ??= functions.isArrayNullOrEmpty(FFAppState()
                                                                            .ContractSaleData
                                                                            .priceSchedule
                                                                            .map((e) => e
                                                                                .toMap())
                                                                            .toList())
                                                                        ? ((double
                                                                            basis) {
                                                                            return basis >= 0
                                                                                ? 1
                                                                                : -1;
                                                                          }(FFAppState()
                                                                            .ContractSaleData
                                                                            .priceSchedule
                                                                            .first
                                                                            .basis))
                                                                        : 1,
                                                                  ),
                                                                  options: List<
                                                                      int>.from([
                                                                    1,
                                                                    -1
                                                                  ]),
                                                                  optionLabels: [
                                                                    '+',
                                                                    '-'
                                                                  ],
                                                                  onChanged:
                                                                      (val) async {
                                                                    setState(() =>
                                                                        _model.cSaleSymbol2Value =
                                                                            val);
                                                                    await _model
                                                                        .cSaleSavePriceInput(
                                                                            context);
                                                                  },
                                                                  width: 300.0,
                                                                  height: 56.0,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintText:
                                                                      'Please select...',
                                                                  icon: Icon(
                                                                    Icons
                                                                        .keyboard_arrow_down_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  elevation:
                                                                      2.0,
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                  borderWidth:
                                                                      2.0,
                                                                  borderRadius:
                                                                      8.0,
                                                                  margin: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                  hidesUnderline:
                                                                      true,
                                                                  isOverButton:
                                                                      true,
                                                                  isSearchable:
                                                                      false,
                                                                  isMultiSelect:
                                                                      false,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 6,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .cSalePriceBasis2TextController,
                                                                  focusNode: _model
                                                                      .cSalePriceBasis2FocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.cSalePriceBasis2TextController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            1000),
                                                                    () async {
                                                                      setState(
                                                                          () {
                                                                        _model.cSalePriceBasis2TextController?.text = functions.formatNumberStringToStringMask(
                                                                            _model.cSalePriceBasis2TextController.text,
                                                                            FFAppConstants.USLocateNumber,
                                                                            FFAppConstants.USMaskNumberDecimal);
                                                                        _model
                                                                            .cSalePriceBasis2TextController
                                                                            ?.selection = TextSelection.collapsed(offset: 0);
                                                                      });
                                                                      setState(
                                                                          () {
                                                                        _model.cSaleSymbol2ValueController?.value = functions.contractSymbolToZero(
                                                                            _model.cSalePriceBasis2TextController.text,
                                                                            FFAppConstants.USLocateNumber,
                                                                            FFAppConstants.USMaskNumberDecimal);
                                                                      });
                                                                      await _model
                                                                          .cSaleSavePriceInput(
                                                                              context);
                                                                    },
                                                                  ),
                                                                  autofocus:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Basis',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    suffixIcon: _model
                                                                            .cSalePriceBasis2TextController!
                                                                            .text
                                                                            .isNotEmpty
                                                                        ? InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              _model.cSalePriceBasis2TextController?.clear();
                                                                              setState(() {
                                                                                _model.cSalePriceBasis2TextController?.text = functions.formatNumberStringToStringMask(_model.cSalePriceBasis2TextController.text, FFAppConstants.USLocateNumber, FFAppConstants.USMaskNumberDecimal);
                                                                                _model.cSalePriceBasis2TextController?.selection = TextSelection.collapsed(offset: 0);
                                                                              });
                                                                              setState(() {
                                                                                _model.cSaleSymbol2ValueController?.value = functions.contractSymbolToZero(_model.cSalePriceBasis2TextController.text, FFAppConstants.USLocateNumber, FFAppConstants.USMaskNumberDecimal);
                                                                              });
                                                                              await _model.cSaleSavePriceInput(context);
                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.clear,
                                                                              size: 24.0,
                                                                            ),
                                                                          )
                                                                        : null,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  validator: _model
                                                                      .cSalePriceBasis2TextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                  inputFormatters: [
                                                                    FilteringTextInputFormatter
                                                                        .allow(RegExp(
                                                                            '^[0-9.]+\$'))
                                                                  ],
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 24.0,
                                                  alignment: WrapAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      width: 551.0,
                                                      height: 60.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                        maxWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    5.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  FlutterFlowDropDown<
                                                                      String>(
                                                                controller: _model
                                                                        .cSalePriceMonthValueController ??=
                                                                    FormFieldController<
                                                                        String>(
                                                                  _model
                                                                      .cSalePriceMonthValue ??= functions.isArrayNullOrEmpty(FFAppState()
                                                                          .ContractSaleData
                                                                          .priceSchedule
                                                                          .map((e) => e
                                                                              .toMap())
                                                                          .toList())
                                                                      ? FFAppState()
                                                                          .ContractSaleData
                                                                          .priceSchedule
                                                                          .first
                                                                          .optionMonth
                                                                      : FFAppConstants
                                                                          .NOTSELECTEDSTRING,
                                                                ),
                                                                options: List<
                                                                        String>.from(
                                                                    CtrOptionMonthEnum
                                                                        .values
                                                                        .map((e) =>
                                                                            e.name)
                                                                        .toList()),
                                                                optionLabels: [
                                                                  'January',
                                                                  'February',
                                                                  'March',
                                                                  'April',
                                                                  'May',
                                                                  'June',
                                                                  'July',
                                                                  'August',
                                                                  'September',
                                                                  'October',
                                                                  'November',
                                                                  'December'
                                                                ],
                                                                onChanged:
                                                                    (val) async {
                                                                  setState(() =>
                                                                      _model.cSalePriceMonthValue =
                                                                          val);
                                                                  await _model
                                                                      .cSaleSavePriceInput(
                                                                          context);
                                                                },
                                                                width: 300.0,
                                                                height: 56.0,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                elevation: 2.0,
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                borderWidth:
                                                                    2.0,
                                                                borderRadius:
                                                                    8.0,
                                                                margin: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        4.0,
                                                                        16.0,
                                                                        4.0),
                                                                hidesUnderline:
                                                                    true,
                                                                isOverButton:
                                                                    true,
                                                                isSearchable:
                                                                    false,
                                                                isMultiSelect:
                                                                    false,
                                                                labelText:
                                                                    'Option Month',
                                                                labelTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  FlutterFlowDropDown<
                                                                      int>(
                                                                controller: _model
                                                                        .cSalePriceYearValueController ??=
                                                                    FormFieldController<
                                                                        int>(
                                                                  _model
                                                                      .cSalePriceYearValue ??= functions.isArrayNullOrEmpty(FFAppState()
                                                                          .ContractSaleData
                                                                          .priceSchedule
                                                                          .map((e) => e
                                                                              .toMap())
                                                                          .toList())
                                                                      ? FFAppState()
                                                                          .ContractSaleData
                                                                          .priceSchedule
                                                                          .first
                                                                          .optionYear
                                                                      : 0,
                                                                ),
                                                                options: List<
                                                                    int>.from([
                                                                  2024,
                                                                  2025,
                                                                  2026,
                                                                  2027
                                                                ]),
                                                                optionLabels: [
                                                                  '2024',
                                                                  '2025',
                                                                  '2026',
                                                                  '2027'
                                                                ],
                                                                onChanged:
                                                                    (val) async {
                                                                  setState(() =>
                                                                      _model.cSalePriceYearValue =
                                                                          val);
                                                                  await _model
                                                                      .cSaleSavePriceInput(
                                                                          context);
                                                                },
                                                                width: 300.0,
                                                                height: 56.0,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                elevation: 2.0,
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                borderWidth:
                                                                    2.0,
                                                                borderRadius:
                                                                    8.0,
                                                                margin: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        4.0,
                                                                        16.0,
                                                                        4.0),
                                                                hidesUnderline:
                                                                    true,
                                                                isOverButton:
                                                                    true,
                                                                isSearchable:
                                                                    false,
                                                                isMultiSelect:
                                                                    false,
                                                                labelText:
                                                                    'Option Year',
                                                                labelTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 10.0)),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 551.0,
                                                      height: 60.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                        maxWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              String>(
                                                        controller: _model
                                                                .cSalePriceExchangeValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model
                                                              .cSalePriceExchangeValue ??= functions
                                                                  .isArrayNullOrEmpty(FFAppState()
                                                                      .ContractSaleData
                                                                      .priceSchedule
                                                                      .map((e) => e
                                                                          .toMap())
                                                                      .toList())
                                                              ? FFAppState()
                                                                  .ContractSaleData
                                                                  .priceSchedule
                                                                  .first
                                                                  .exchange
                                                              : FFAppConstants
                                                                  .NOTSELECTEDSTRING,
                                                        ),
                                                        options:
                                                            List<String>.from([
                                                          'Chicago futures trade market',
                                                          'Arizona futures trade market '
                                                        ]),
                                                        optionLabels: [
                                                          'Chicago futures trade market',
                                                          'Arizona futures trade market '
                                                        ],
                                                        onChanged: (val) async {
                                                          setState(() => _model
                                                                  .cSalePriceExchangeValue =
                                                              val);
                                                          await _model
                                                              .cSaleSavePriceInput(
                                                                  context);
                                                        },
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderWidth: 2.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    1.0,
                                                                    16.0,
                                                                    1.0),
                                                        hidesUnderline: true,
                                                        isOverButton: true,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                        labelText: 'Exchange',
                                                        labelTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 100.0,
                                          height: 24.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Text(
                                                  'Logistic Contract',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 24.0,
                                                  alignment: WrapAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      width: 551.0,
                                                      height: 60.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                        maxWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              String>(
                                                        controller: _model
                                                                .cSaleLogisticPaymentValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model
                                                              .cSaleLogisticPaymentValue ??= functions
                                                                  .isArrayNullOrEmpty(FFAppState()
                                                                      .ContractSaleData
                                                                      .logisticSchedule
                                                                      .map((e) => e
                                                                          .toMap())
                                                                      .toList())
                                                              ? FFAppState()
                                                                  .ContractSaleData
                                                                  .logisticSchedule
                                                                  .first
                                                                  .logisticPaymentResponsability
                                                              : FFAppConstants
                                                                  .NOTSELECTEDSTRING,
                                                        ),
                                                        options: List<
                                                                String>.from(
                                                            CtrLogisticPaymentResponsabilityEnum
                                                                .values
                                                                .map((e) =>
                                                                    e.name)
                                                                .toList()),
                                                        optionLabels: [
                                                          'Seller',
                                                          'Buyer',
                                                          'Other'
                                                        ],
                                                        onChanged: (val) async {
                                                          setState(() => _model
                                                                  .cSaleLogisticPaymentValue =
                                                              val);
                                                          await _model
                                                              .cSaleSaveLogisticPrice(
                                                                  context);
                                                        },
                                                        width: double.infinity,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderWidth: 2.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    1.0,
                                                                    16.0,
                                                                    1.0),
                                                        hidesUnderline: true,
                                                        isOverButton: true,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                        labelText:
                                                            'Payment Responsability',
                                                        labelTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 551.0,
                                                      height: 60.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                        maxWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              String>(
                                                        controller: _model
                                                                .cSaleLogisticCoordinationValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model
                                                              .cSaleLogisticCoordinationValue ??= functions
                                                                  .isArrayNullOrEmpty(FFAppState()
                                                                      .ContractSaleData
                                                                      .logisticSchedule
                                                                      .map((e) => e
                                                                          .toMap())
                                                                      .toList())
                                                              ? FFAppState()
                                                                  .ContractSaleData
                                                                  .logisticSchedule
                                                                  .first
                                                                  .logisticCoordinationResponsability
                                                              : FFAppConstants
                                                                  .NOTSELECTEDSTRING,
                                                        ),
                                                        options: List<
                                                                String>.from(
                                                            CtrLogCoordinationResponsabEnum
                                                                .values
                                                                .map((e) =>
                                                                    e.name)
                                                                .toList()),
                                                        optionLabels: [
                                                          'Seller',
                                                          'Buyer',
                                                          'Other',
                                                          'Either'
                                                        ],
                                                        onChanged: (val) async {
                                                          setState(() => _model
                                                                  .cSaleLogisticCoordinationValue =
                                                              val);
                                                          await _model
                                                              .cSaleSaveLogisticPrice(
                                                                  context);
                                                        },
                                                        width: double.infinity,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderWidth: 2.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    1.0,
                                                                    16.0,
                                                                    1.0),
                                                        hidesUnderline: true,
                                                        isOverButton: true,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                        labelText:
                                                            'Coordination Responsability',
                                                        labelTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 24.0,
                                                  alignment: WrapAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      width: 551.0,
                                                      height: 60.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                        maxWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              String>(
                                                        controller: _model
                                                                .cSaleLogisticTypeValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model
                                                              .cSaleLogisticTypeValue ??= functions
                                                                  .isArrayNullOrEmpty(FFAppState()
                                                                      .ContractSaleData
                                                                      .logisticSchedule
                                                                      .map((e) => e
                                                                          .toMap())
                                                                      .toList())
                                                              ? FFAppState()
                                                                  .ContractSaleData
                                                                  .logisticSchedule
                                                                  .first
                                                                  .freightCost
                                                                  .type
                                                              : FFAppConstants
                                                                  .NOTSELECTEDSTRING,
                                                        ),
                                                        options:
                                                            List<String>.from([
                                                          'Fixed',
                                                          'Variable'
                                                        ]),
                                                        optionLabels: [
                                                          'Fixed',
                                                          'Variable'
                                                        ],
                                                        onChanged: (val) async {
                                                          setState(() => _model
                                                                  .cSaleLogisticTypeValue =
                                                              val);
                                                          await _model
                                                              .cSaleSaveLogisticPrice(
                                                                  context);
                                                        },
                                                        width: double.infinity,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderWidth: 2.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    1.0,
                                                                    16.0,
                                                                    1.0),
                                                        hidesUnderline: true,
                                                        isOverButton: true,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                        labelText:
                                                            'Freight Cost',
                                                        labelTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 551.0,
                                                      height: 60.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                        maxWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .cSaleLogisticMinTextController,
                                                              focusNode: _model
                                                                  .cSaleLogisticMinFocusNode,
                                                              onChanged: (_) =>
                                                                  EasyDebounce
                                                                      .debounce(
                                                                '_model.cSaleLogisticMinTextController',
                                                                Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                () async {
                                                                  setState(() {
                                                                    _model.cSaleLogisticMinTextController?.text = functions.formatNumberStringToStringMask(
                                                                        _model
                                                                            .cSaleLogisticMinTextController
                                                                            .text,
                                                                        FFAppConstants
                                                                            .USLocateNumber,
                                                                        FFAppConstants
                                                                            .USMaskNumberDecimal);
                                                                  });
                                                                },
                                                              ),
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Min',
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                suffixIcon: _model
                                                                        .cSaleLogisticMinTextController!
                                                                        .text
                                                                        .isNotEmpty
                                                                    ? InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          _model
                                                                              .cSaleLogisticMinTextController
                                                                              ?.clear();
                                                                          setState(
                                                                              () {
                                                                            _model.cSaleLogisticMinTextController?.text = functions.formatNumberStringToStringMask(
                                                                                _model.cSaleLogisticMinTextController.text,
                                                                                FFAppConstants.USLocateNumber,
                                                                                FFAppConstants.USMaskNumberDecimal);
                                                                          });
                                                                          setState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .clear,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      )
                                                                    : null,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                              validator: _model
                                                                  .cSaleLogisticMinTextControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                              inputFormatters: [
                                                                FilteringTextInputFormatter
                                                                    .allow(RegExp(
                                                                        '^[0-9.]+\$'))
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .cSaleLogisticMaxTextController,
                                                              focusNode: _model
                                                                  .cSaleLogisticMaxFocusNode,
                                                              onChanged: (_) =>
                                                                  EasyDebounce
                                                                      .debounce(
                                                                '_model.cSaleLogisticMaxTextController',
                                                                Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                () async {
                                                                  setState(() {
                                                                    _model.cSaleLogisticMaxTextController?.text = functions.formatNumberStringToStringMask(
                                                                        _model
                                                                            .cSaleLogisticMaxTextController
                                                                            .text,
                                                                        FFAppConstants
                                                                            .USLocateNumber,
                                                                        FFAppConstants
                                                                            .USMaskNumberDecimal);
                                                                  });
                                                                },
                                                              ),
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelText:
                                                                    'Max',
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 2.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                                suffixIcon: _model
                                                                        .cSaleLogisticMaxTextController!
                                                                        .text
                                                                        .isNotEmpty
                                                                    ? InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          _model
                                                                              .cSaleLogisticMaxTextController
                                                                              ?.clear();
                                                                          setState(
                                                                              () {
                                                                            _model.cSaleLogisticMaxTextController?.text = functions.formatNumberStringToStringMask(
                                                                                _model.cSaleLogisticMaxTextController.text,
                                                                                FFAppConstants.USLocateNumber,
                                                                                FFAppConstants.USMaskNumberDecimal);
                                                                          });
                                                                          setState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .clear,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      )
                                                                    : null,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                              validator: _model
                                                                  .cSaleLogisticMaxTextControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                              inputFormatters: [
                                                                FilteringTextInputFormatter
                                                                    .allow(RegExp(
                                                                        '^[0-9.]+\$'))
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 100.0,
                                          height: 24.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Text(
                                                  'Shipment Dates',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 24.0,
                                                  alignment: WrapAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      width: 551.0,
                                                      height: 60.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                        maxWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Flexible(
                                                            flex: 7,
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .cSaleShipmentDateFromTextController,
                                                                focusNode: _model
                                                                    .cSaleShipmentDateFromFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.cSaleShipmentDateFromTextController',
                                                                  Duration(
                                                                      milliseconds:
                                                                          2000),
                                                                  () => setState(
                                                                      () {}),
                                                                ),
                                                                autofocus: true,
                                                                textCapitalization:
                                                                    TextCapitalization
                                                                        .none,
                                                                readOnly: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      'From',
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  suffixIcon: _model
                                                                          .cSaleShipmentDateFromTextController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.cSaleShipmentDateFromTextController?.clear();
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.clear,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        )
                                                                      : null,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .datetime,
                                                                validator: _model
                                                                    .cSaleShipmentDateFromTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                          Flexible(
                                                            flex: 1,
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 48.0,
                                                              icon: Icon(
                                                                Icons
                                                                    .calendar_month,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                final _datePicked2Date =
                                                                    await showDatePicker(
                                                                  context:
                                                                      context,
                                                                  initialDate: functions.formatStringToDatetime(
                                                                      _model
                                                                          .cSaleShipmentDateFromTextController
                                                                          .text,
                                                                      'dd/MM/yyyy'),
                                                                  firstDate:
                                                                      DateTime(
                                                                          1900),
                                                                  lastDate:
                                                                      DateTime(
                                                                          2050),
                                                                  builder:
                                                                      (context,
                                                                          child) {
                                                                    return wrapInMaterialDatePickerTheme(
                                                                      context,
                                                                      child!,
                                                                      headerBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      headerForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      headerTextStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            fontSize:
                                                                                32.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                      pickerBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      pickerForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      selectedDateTimeBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      selectedDateTimeForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      actionButtonForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      iconSize:
                                                                          24.0,
                                                                    );
                                                                  },
                                                                );

                                                                if (_datePicked2Date !=
                                                                    null) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.datePicked2 =
                                                                        DateTime(
                                                                      _datePicked2Date
                                                                          .year,
                                                                      _datePicked2Date
                                                                          .month,
                                                                      _datePicked2Date
                                                                          .day,
                                                                    );
                                                                  });
                                                                }
                                                                await Future
                                                                    .wait([
                                                                  Future(
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _model.cSaleShipmentDateFromTextController
                                                                              ?.text =
                                                                          dateTimeFormat(
                                                                        'dd/MM/yyyy',
                                                                        _model
                                                                            .datePicked2,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      );
                                                                      _model.cSaleShipmentDateFromTextController?.selection = TextSelection.collapsed(
                                                                          offset: _model
                                                                              .cSaleShipmentDateFromTextController!
                                                                              .text
                                                                              .length);
                                                                    });
                                                                  }),
                                                                  Future(
                                                                      () async {
                                                                    FFAppState()
                                                                        .updateContractSaleDataStruct(
                                                                      (e) => e
                                                                        ..shippingStartDate =
                                                                            dateTimeFormat(
                                                                          'yyyy-MM-ddTHH:mm:00.000',
                                                                          _model
                                                                              .datePicked2,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                    );
                                                                  }),
                                                                ]);
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 551.0,
                                                      height: 60.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                        maxWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Flexible(
                                                            flex: 7,
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .cSaleShipmentDateToTextController,
                                                                focusNode: _model
                                                                    .cSaleShipmentDateToFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.cSaleShipmentDateToTextController',
                                                                  Duration(
                                                                      milliseconds:
                                                                          2000),
                                                                  () => setState(
                                                                      () {}),
                                                                ),
                                                                autofocus: true,
                                                                readOnly: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      'To',
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  suffixIcon: _model
                                                                          .cSaleShipmentDateToTextController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.cSaleShipmentDateToTextController?.clear();
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.clear,
                                                                            size:
                                                                                22,
                                                                          ),
                                                                        )
                                                                      : null,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .datetime,
                                                                validator: _model
                                                                    .cSaleShipmentDateToTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                          Flexible(
                                                            flex: 1,
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 48.0,
                                                              icon: Icon(
                                                                Icons
                                                                    .calendar_month,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                final _datePicked3Date =
                                                                    await showDatePicker(
                                                                  context:
                                                                      context,
                                                                  initialDate: functions.formatStringToDatetime(
                                                                      _model
                                                                          .cSaleShipmentDateToTextController
                                                                          .text,
                                                                      'dd/MM/yyyy'),
                                                                  firstDate:
                                                                      DateTime(
                                                                          1900),
                                                                  lastDate:
                                                                      DateTime(
                                                                          2050),
                                                                  builder:
                                                                      (context,
                                                                          child) {
                                                                    return wrapInMaterialDatePickerTheme(
                                                                      context,
                                                                      child!,
                                                                      headerBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      headerForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      headerTextStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Inter',
                                                                            fontSize:
                                                                                32.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                          ),
                                                                      pickerBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      pickerForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      selectedDateTimeBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      selectedDateTimeForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      actionButtonForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      iconSize:
                                                                          24.0,
                                                                    );
                                                                  },
                                                                );

                                                                if (_datePicked3Date !=
                                                                    null) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.datePicked3 =
                                                                        DateTime(
                                                                      _datePicked3Date
                                                                          .year,
                                                                      _datePicked3Date
                                                                          .month,
                                                                      _datePicked3Date
                                                                          .day,
                                                                    );
                                                                  });
                                                                }
                                                                await Future
                                                                    .wait([
                                                                  Future(
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _model.cSaleShipmentDateToTextController
                                                                              ?.text =
                                                                          dateTimeFormat(
                                                                        'dd/MM/yyyy',
                                                                        _model
                                                                            .datePicked3,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      );
                                                                      _model.cSaleShipmentDateToTextController?.selection = TextSelection.collapsed(
                                                                          offset: _model
                                                                              .cSaleShipmentDateToTextController!
                                                                              .text
                                                                              .length);
                                                                    });
                                                                  }),
                                                                  Future(
                                                                      () async {
                                                                    FFAppState()
                                                                        .updateContractSaleDataStruct(
                                                                      (e) => e
                                                                        ..shippingEndDate =
                                                                            dateTimeFormat(
                                                                          'yyyy-MM-ddTHH:mm:00.000',
                                                                          _model
                                                                              .datePicked3,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                    );
                                                                  }),
                                                                ]);
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 24.0,
                                                  alignment: WrapAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      width: 551.0,
                                                      height: 60.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                        maxWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              int>(
                                                        controller: _model
                                                                .cSaleShipmentAPriorityValueController ??=
                                                            FormFieldController<
                                                                int>(
                                                          _model
                                                              .cSaleShipmentAPriorityValue ??= FFAppState()
                                                                      .ContractSaleData !=
                                                                  null
                                                              ? FFAppState()
                                                                  .ContractSaleData
                                                                  .applicationPriority
                                                              : 0,
                                                        ),
                                                        options: List<int>.from(
                                                            [1, 2, 3, 4]),
                                                        optionLabels: [
                                                          '#1',
                                                          '#2',
                                                          '#3',
                                                          '#4'
                                                        ],
                                                        onChanged: (val) async {
                                                          setState(() => _model
                                                                  .cSaleShipmentAPriorityValue =
                                                              val);
                                                          await _model
                                                              .cSaleSaveRootFields(
                                                                  context);
                                                        },
                                                        width: double.infinity,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderWidth: 2.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    1.0,
                                                                    16.0,
                                                                    1.0),
                                                        hidesUnderline: true,
                                                        isOverButton: true,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                        labelText:
                                                            'Contract Application Priority',
                                                        labelTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 100.0,
                                          height: 24.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Text(
                                                  'Deliver Location',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 24.0,
                                                  alignment: WrapAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      width: 551.0,
                                                      height: 60.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                        maxWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              String>(
                                                        controller: _model
                                                                .cSaleDeliverLocationValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model
                                                              .cSaleDeliverLocationValue ??= FFAppState()
                                                                      .ContractSaleData !=
                                                                  null
                                                              ? FFAppState()
                                                                  .ContractSaleData
                                                                  .delivered
                                                              : FFAppConstants
                                                                  .NOTSELECTEDSTRING,
                                                        ),
                                                        options:
                                                            List<String>.from([
                                                          'Dlvd ADM CC, Tx',
                                                          'Dlvd Port of Brownsville',
                                                          'Dlvd to Corpus Christi Tx',
                                                          'PICKED UP',
                                                          'In Store',
                                                          'Dlvd to J&R FeedLot, LLC',
                                                          'Dlvd Kin RanchFeedyarn',
                                                          'FOB MCCook'
                                                        ]),
                                                        optionLabels: [
                                                          'Dlvd ADM CC, Tx',
                                                          'Dlvd Port of Brownsville',
                                                          'Dlvd to Corpus Christi Tx',
                                                          'PICKED UP',
                                                          'In Store',
                                                          'Dlvd to J&R FeedLot, LLC',
                                                          'Dlvd Kin RanchFeedyarn',
                                                          'FOB MCCook'
                                                        ],
                                                        onChanged: (val) async {
                                                          setState(() => _model
                                                                  .cSaleDeliverLocationValue =
                                                              val);
                                                          await _model
                                                              .cSaleSaveRootFields(
                                                                  context);
                                                        },
                                                        width: double.infinity,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderWidth: 2.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    1.0,
                                                                    16.0,
                                                                    1.0),
                                                        hidesUnderline: true,
                                                        isOverButton: true,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                        labelText: 'Delivered',
                                                        labelTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 551.0,
                                                      height: 60.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                        maxWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                              controller: _model
                                                                      .cSaleDeliverTransportValueController ??=
                                                                  FormFieldController<
                                                                      String>(
                                                                _model
                                                                    .cSaleDeliverTransportValue ??= FFAppState()
                                                                            .ContractSaleData !=
                                                                        null
                                                                    ? FFAppState()
                                                                        .ContractSaleData
                                                                        .transport
                                                                    : FFAppConstants
                                                                        .NOTSELECTEDSTRING,
                                                              ),
                                                              options: List<
                                                                  String>.from([
                                                                'Truck',
                                                                'Rail',
                                                                'Barge',
                                                                'Vessel',
                                                                'Truck/Rail',
                                                                'BUS',
                                                                'Container',
                                                                'Drum'
                                                              ]),
                                                              optionLabels: [
                                                                'Truck',
                                                                'Rail',
                                                                'Barge',
                                                                'Vessel',
                                                                'Truck/Rail',
                                                                'BUS',
                                                                'Container',
                                                                'Drum'
                                                              ],
                                                              onChanged:
                                                                  (val) async {
                                                                setState(() =>
                                                                    _model.cSaleDeliverTransportValue =
                                                                        val);
                                                                await _model
                                                                    .cSaleSaveRootFields(
                                                                        context);
                                                              },
                                                              width: 221.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          1.0,
                                                                          16.0,
                                                                          1.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                              labelText:
                                                                  'Transport',
                                                              labelTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 24.0,
                                                  alignment: WrapAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      width: 551.0,
                                                      height: 60.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                        maxWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                              controller: _model
                                                                      .cSaleDeliverInspectionsValueController ??=
                                                                  FormFieldController<
                                                                      String>(
                                                                _model
                                                                    .cSaleDeliverInspectionsValue ??= FFAppState()
                                                                            .ContractSaleData !=
                                                                        null
                                                                    ? FFAppState()
                                                                        .ContractSaleData
                                                                        .inspections
                                                                    : FFAppConstants
                                                                        .NOTSELECTEDSTRING,
                                                              ),
                                                              options: List<
                                                                      String>.from(
                                                                  CtrInspectionsEnum
                                                                      .values
                                                                      .map((e) =>
                                                                          e.name)
                                                                      .toList()),
                                                              optionLabels: [
                                                                'Destination',
                                                                'Origin',
                                                                'Submit Cc',
                                                                'Not Appliance',
                                                                'First Certification'
                                                              ],
                                                              onChanged:
                                                                  (val) async {
                                                                setState(() =>
                                                                    _model.cSaleDeliverInspectionsValue =
                                                                        val);
                                                                await _model
                                                                    .cSaleSaveRootFields(
                                                                        context);
                                                              },
                                                              width: 221.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          1.0,
                                                                          16.0,
                                                                          1.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                              labelText:
                                                                  'Inspections',
                                                              labelTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child:
                                                                FlutterFlowDropDown<
                                                                    String>(
                                                              controller: _model
                                                                      .cSaleDeliverProteinValueController ??=
                                                                  FormFieldController<
                                                                      String>(
                                                                _model
                                                                    .cSaleDeliverProteinValue ??= FFAppState()
                                                                            .ContractSaleData !=
                                                                        null
                                                                    ? FFAppState()
                                                                        .ContractSaleData
                                                                        .proteins
                                                                    : FFAppConstants
                                                                        .NOTSELECTEDSTRING,
                                                              ),
                                                              options: List<
                                                                      String>.from(
                                                                  CtrProteinsEnum
                                                                      .values
                                                                      .map((e) =>
                                                                          e.name)
                                                                      .toList()),
                                                              optionLabels: [
                                                                'Destination',
                                                                'Origin',
                                                                'Submit Cc',
                                                                'Not Appliance',
                                                                'First Certification'
                                                              ],
                                                              onChanged:
                                                                  (val) async {
                                                                setState(() =>
                                                                    _model.cSaleDeliverProteinValue =
                                                                        val);
                                                                await _model
                                                                    .cSaleSaveRootFields(
                                                                        context);
                                                              },
                                                              width: 221.0,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              borderWidth: 2.0,
                                                              borderRadius: 8.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          1.0,
                                                                          16.0,
                                                                          1.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  true,
                                                              isSearchable:
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                              labelText:
                                                                  'Protein',
                                                              labelTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 551.0,
                                                      height: 60.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                        maxWidth: functions.containerControlWidthRv(
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                            functions.containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width))!,
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              String>(
                                                        controller: _model
                                                                .cSaleDeliverWeightValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model
                                                              .cSaleDeliverWeightValue ??= FFAppState()
                                                                      .ContractSaleData !=
                                                                  null
                                                              ? FFAppState()
                                                                  .ContractSaleData
                                                                  .weights
                                                              : FFAppConstants
                                                                  .NOTSELECTEDSTRING,
                                                        ),
                                                        options:
                                                            List<String>.from(
                                                                CtrWeightsEnum
                                                                    .values
                                                                    .map((e) =>
                                                                        e.name)
                                                                    .toList()),
                                                        optionLabels: [
                                                          'Destination',
                                                          'Origin',
                                                          'Submit Cc',
                                                          'Not Appliance',
                                                          'First Certification'
                                                        ],
                                                        onChanged: (val) async {
                                                          setState(() => _model
                                                                  .cSaleDeliverWeightValue =
                                                              val);
                                                          await _model
                                                              .cSaleSaveRootFields(
                                                                  context);
                                                        },
                                                        width: double.infinity,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderWidth: 2.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    1.0,
                                                                    16.0,
                                                                    1.0),
                                                        hidesUnderline: true,
                                                        isOverButton: true,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                        labelText: 'Weight',
                                                        labelTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 100.0,
                                          height: 24.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Text(
                                                  'Remarks',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 24.0,
                                                  alignment: WrapAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      height: 60.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions
                                                            .containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width),
                                                        maxWidth: functions
                                                            .containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width),
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .cSaleRemarkContactTextController,
                                                                  focusNode: _model
                                                                      .cSaleRemarkContactFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.cSaleRemarkContactTextController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    () => setState(
                                                                        () {}),
                                                                  ),
                                                                  autofocus:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Contact',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    suffixIcon: _model
                                                                            .cSaleRemarkContactTextController!
                                                                            .text
                                                                            .isNotEmpty
                                                                        ? InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              _model.cSaleRemarkContactTextController?.clear();
                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.clear,
                                                                              size: 24.0,
                                                                            ),
                                                                          )
                                                                        : null,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  minLines: 1,
                                                                  validator: _model
                                                                      .cSaleRemarkContactTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Builder(
                                                              builder: (context) =>
                                                                  FlutterFlowIconButton(
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                icon: Icon(
                                                                  Icons
                                                                      .search_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .white,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  if (isWeb) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap: () => _model.unfocusNode.canRequestFocus
                                                                                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                                : FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                Container(
                                                                              height: 700.0,
                                                                              width: 600.0,
                                                                              child: ModalSelectRemarksWidget(
                                                                                title: 'contact',
                                                                                modalSelect: true,
                                                                                selectedItemParameter: (seletedItem) async {
                                                                                  setState(() {
                                                                                    _model.cSaleRemarkContactTextController?.text = seletedItem;
                                                                                  });
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  } else {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                Container(
                                                                              height: 650.0,
                                                                              child: ModalSelectRemarksWidget(
                                                                                title: 'contact',
                                                                                modalSelect: false,
                                                                                selectedItemParameter: (seletedItem) async {
                                                                                  setState(() {
                                                                                    _model.cSaleRemarkContactTextController?.text = seletedItem;
                                                                                  });
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 24.0,
                                                  alignment: WrapAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      height: 60.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions
                                                            .containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width),
                                                        maxWidth: functions
                                                            .containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width),
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .cSaleRemarksShipmentTextController,
                                                                  focusNode: _model
                                                                      .cSaleRemarksShipmentFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.cSaleRemarksShipmentTextController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    () => setState(
                                                                        () {}),
                                                                  ),
                                                                  autofocus:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelText:
                                                                        'Shipment',
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Inter',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                    suffixIcon: _model
                                                                            .cSaleRemarksShipmentTextController!
                                                                            .text
                                                                            .isNotEmpty
                                                                        ? InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              _model.cSaleRemarksShipmentTextController?.clear();
                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                                Icon(
                                                                              Icons.clear,
                                                                              size: 24.0,
                                                                            ),
                                                                          )
                                                                        : null,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  minLines: 1,
                                                                  validator: _model
                                                                      .cSaleRemarksShipmentTextControllerValidator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Builder(
                                                              builder: (context) =>
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                icon: Icon(
                                                                  Icons
                                                                      .search_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .white,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  if (isWeb) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap: () => _model.unfocusNode.canRequestFocus
                                                                                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                                : FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                Container(
                                                                              height: 700.0,
                                                                              width: 600.0,
                                                                              child: ModalSelectRemarksWidget(
                                                                                title: 'shipment',
                                                                                modalSelect: true,
                                                                                selectedItemParameter: (seletedItem) async {
                                                                                  setState(() {
                                                                                    _model.cSaleRemarksShipmentTextController?.text = seletedItem;
                                                                                  });
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        setState(
                                                                            () {}));
                                                                  } else {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                Container(
                                                                              height: 650.0,
                                                                              child: ModalSelectRemarksWidget(
                                                                                title: 'shipment',
                                                                                modalSelect: false,
                                                                                selectedItemParameter: (seletedItem) async {
                                                                                  setState(() {
                                                                                    _model.cSaleRemarksShipmentTextController?.text = seletedItem;
                                                                                  });
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 24.0,
                                                  alignment: WrapAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      height: 60.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions
                                                            .containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width),
                                                        maxWidth: functions
                                                            .containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width),
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .cSaleRemarkRoutingTextController,
                                                                focusNode: _model
                                                                    .cSaleRemarkRoutingFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.cSaleRemarkRoutingTextController',
                                                                  Duration(
                                                                      milliseconds:
                                                                          2000),
                                                                  () => setState(
                                                                      () {}),
                                                                ),
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      'Routing',
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  suffixIcon: _model
                                                                          .cSaleRemarkRoutingTextController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.cSaleRemarkRoutingTextController?.clear();
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.clear,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        )
                                                                      : null,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                minLines: 1,
                                                                validator: _model
                                                                    .cSaleRemarkRoutingTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                          Builder(
                                                            builder: (context) =>
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              icon: Icon(
                                                                Icons
                                                                    .search_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                if (isWeb) {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                700.0,
                                                                            width:
                                                                                600.0,
                                                                            child:
                                                                                ModalSelectRemarksWidget(
                                                                              title: 'routing',
                                                                              modalSelect: true,
                                                                              selectedItemParameter: (seletedItem) async {
                                                                                setState(() {
                                                                                  _model.cSaleRemarkRoutingTextController?.text = seletedItem;
                                                                                });
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      setState(
                                                                          () {}));
                                                                } else {
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    enableDrag:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                650.0,
                                                                            child:
                                                                                ModalSelectRemarksWidget(
                                                                              title: 'routing',
                                                                              modalSelect: false,
                                                                              selectedItemParameter: (seletedItem) async {
                                                                                setState(() {
                                                                                  _model.cSaleRemarkRoutingTextController?.text = seletedItem;
                                                                                });
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 24.0,
                                                  alignment: WrapAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      height: 100.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions
                                                            .containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width),
                                                        maxWidth: functions
                                                            .containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width),
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .cSaleRemarkPremDiscTextController,
                                                                focusNode: _model
                                                                    .cSaleRemarkPremDiscFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.cSaleRemarkPremDiscTextController',
                                                                  Duration(
                                                                      milliseconds:
                                                                          2000),
                                                                  () => setState(
                                                                      () {}),
                                                                ),
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      'Prem/Disc',
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  suffixIcon: _model
                                                                          .cSaleRemarkPremDiscTextController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.cSaleRemarkPremDiscTextController?.clear();
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.clear,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        )
                                                                      : null,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                maxLines: 4,
                                                                minLines: 4,
                                                                validator: _model
                                                                    .cSaleRemarkPremDiscTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                          Builder(
                                                            builder: (context) =>
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              icon: Icon(
                                                                Icons
                                                                    .search_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                if (isWeb) {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                700.0,
                                                                            width:
                                                                                600.0,
                                                                            child:
                                                                                ModalSelectRemarksWidget(
                                                                              title: 'premDisc',
                                                                              modalSelect: true,
                                                                              selectedItemParameter: (seletedItem) async {
                                                                                setState(() {
                                                                                  _model.cSaleRemarkPremDiscTextController?.text = seletedItem;
                                                                                });
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      setState(
                                                                          () {}));
                                                                } else {
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    enableDrag:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                650.0,
                                                                            child:
                                                                                ModalSelectRemarksWidget(
                                                                              title: 'premDisc',
                                                                              modalSelect: false,
                                                                              selectedItemParameter: (seletedItem) async {
                                                                                setState(() {
                                                                                  _model.cSaleRemarkPremDiscTextController?.text = seletedItem;
                                                                                });
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 24.0,
                                                  alignment: WrapAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      height: 70.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions
                                                            .containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width),
                                                        maxWidth: functions
                                                            .containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width),
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .cSaleRemarkTermsTextController,
                                                                focusNode: _model
                                                                    .cSaleRemarkTermsFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.cSaleRemarkTermsTextController',
                                                                  Duration(
                                                                      milliseconds:
                                                                          2000),
                                                                  () => setState(
                                                                      () {}),
                                                                ),
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      'Terms',
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  suffixIcon: _model
                                                                          .cSaleRemarkTermsTextController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.cSaleRemarkTermsTextController?.clear();
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.clear,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        )
                                                                      : null,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                maxLines: 2,
                                                                minLines: 2,
                                                                validator: _model
                                                                    .cSaleRemarkTermsTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                          Builder(
                                                            builder: (context) =>
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              icon: Icon(
                                                                Icons
                                                                    .search_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                if (isWeb) {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                700.0,
                                                                            width:
                                                                                600.0,
                                                                            child:
                                                                                ModalSelectRemarksWidget(
                                                                              title: 'terms',
                                                                              modalSelect: true,
                                                                              selectedItemParameter: (seletedItem) async {
                                                                                setState(() {
                                                                                  _model.cSaleRemarkTermsTextController?.text = seletedItem;
                                                                                });
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      setState(
                                                                          () {}));
                                                                } else {
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    enableDrag:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                650.0,
                                                                            child:
                                                                                ModalSelectRemarksWidget(
                                                                              title: 'terms',
                                                                              modalSelect: false,
                                                                              selectedItemParameter: (seletedItem) async {
                                                                                setState(() {
                                                                                  _model.cSaleRemarkTermsTextController?.text = seletedItem;
                                                                                });
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 0.0),
                                                child: Wrap(
                                                  spacing: 0.0,
                                                  runSpacing: 24.0,
                                                  alignment: WrapAlignment
                                                      .spaceBetween,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      height: 100.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        minWidth: functions
                                                            .containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width),
                                                        minHeight: 100.0,
                                                        maxWidth: functions
                                                            .containerBodyWidthRv(
                                                                MediaQuery.sizeOf(
                                                                        context)
                                                                    .width),
                                                      ),
                                                      decoration:
                                                          BoxDecoration(),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .cSaleRemarkRemarksTextController,
                                                                focusNode: _model
                                                                    .cSaleRemarkRemarksFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.cSaleRemarkRemarksTextController',
                                                                  Duration(
                                                                      milliseconds:
                                                                          2000),
                                                                  () => setState(
                                                                      () {}),
                                                                ),
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText:
                                                                      'Remarks',
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  suffixIcon: _model
                                                                          .cSaleRemarkRemarksTextController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.cSaleRemarkRemarksTextController?.clear();
                                                                            setState(() {});
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.clear,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        )
                                                                      : null,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                maxLines: 5,
                                                                minLines: 5,
                                                                validator: _model
                                                                    .cSaleRemarkRemarksTextControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                          Builder(
                                                            builder: (context) =>
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              icon: Icon(
                                                                Icons
                                                                    .search_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .white,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                if (isWeb) {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                700.0,
                                                                            width:
                                                                                600.0,
                                                                            child:
                                                                                ModalSelectRemarksWidget(
                                                                              title: 'remarks',
                                                                              modalSelect: true,
                                                                              selectedItemParameter: (seletedItem) async {
                                                                                setState(() {
                                                                                  _model.cSaleRemarkRemarksTextController?.text = seletedItem;
                                                                                });
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      setState(
                                                                          () {}));
                                                                } else {
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    enableDrag:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                650.0,
                                                                            child:
                                                                                ModalSelectRemarksWidget(
                                                                              title: 'remarks',
                                                                              modalSelect: false,
                                                                              selectedItemParameter: (seletedItem) async {
                                                                                setState(() {
                                                                                  _model.cSaleRemarkRemarksTextController?.text = seletedItem;
                                                                                });
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 100.0,
                                          height: 24.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 100.0,
                                          constraints: BoxConstraints(
                                            minWidth:
                                                functions.containerBodyWidthRv(
                                                    MediaQuery.sizeOf(context)
                                                        .width),
                                            maxWidth:
                                                functions.containerBodyWidthRv(
                                                    MediaQuery.sizeOf(context)
                                                        .width),
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Text(
                                                    'Observation',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                child: TextFormField(
                                                  controller: _model
                                                      .cSaleNoteTextController,
                                                  focusNode:
                                                      _model.cSaleNoteFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.cSaleNoteTextController',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () => setState(() {}),
                                                  ),
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    suffixIcon: _model
                                                            .cSaleNoteTextController!
                                                            .text
                                                            .isNotEmpty
                                                        ? InkWell(
                                                            onTap: () async {
                                                              _model
                                                                  .cSaleNoteTextController
                                                                  ?.clear();
                                                              setState(() {});
                                                            },
                                                            child: Icon(
                                                              Icons.clear,
                                                              size: 24.0,
                                                            ),
                                                          )
                                                        : null,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  maxLines: 4,
                                                  minLines: 2,
                                                  validator: _model
                                                      .cSaleNoteTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 100.0,
                                          height: 24.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                ),
                                Container(
                                  width: 100.0,
                                  height: 24.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Container(
                                    width: functions.containerBodyWidthRv(
                                        MediaQuery.sizeOf(context).width),
                                    constraints: BoxConstraints(
                                      minWidth: () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        } else {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        }
                                      }(),
                                      minHeight: 50.0,
                                      maxWidth: () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        } else {
                                          return functions.containerBodyWidthRv(
                                              MediaQuery.sizeOf(context).width);
                                        }
                                      }(),
                                    ),
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 24.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await action_blocks
                                                          .resetContractSale(
                                                              context);
                                                      setState(() {
                                                        _model
                                                            .cSalePriceTypeValueController
                                                            ?.reset();
                                                        _model
                                                            .cSaleTypeSubTypeValueController
                                                            ?.reset();
                                                        _model
                                                            .cSaleTypeCommodityValueController
                                                            ?.reset();
                                                        _model
                                                            .cSaleTypeGradeValueController
                                                            ?.reset();
                                                        _model
                                                            .cSaleTypeUnitValueController
                                                            ?.reset();
                                                        _model
                                                            .cSalePriceMonthValueController
                                                            ?.reset();
                                                        _model
                                                            .cSalePriceCurrencyValueController
                                                            ?.reset();
                                                        _model
                                                            .cSalePriceYearValueController
                                                            ?.reset();
                                                        _model
                                                            .cSalePriceExchangeValueController
                                                            ?.reset();
                                                        _model
                                                            .cSaleLogisticPaymentValueController
                                                            ?.reset();
                                                        _model
                                                            .cSaleLogisticCoordinationValueController
                                                            ?.reset();
                                                        _model
                                                            .cSaleLogisticTypeValueController
                                                            ?.reset();
                                                        _model
                                                            .cSaleShipmentAPriorityValueController
                                                            ?.reset();
                                                        _model
                                                            .cSaleDeliverLocationValueController
                                                            ?.reset();
                                                        _model
                                                            .cSaleDeliverTransportValueController
                                                            ?.reset();
                                                        _model
                                                            .cSaleDeliverInspectionsValueController
                                                            ?.reset();
                                                        _model
                                                            .cSaleDeliverProteinValueController
                                                            ?.reset();
                                                        _model
                                                            .cSaleDeliverWeightValueController
                                                            ?.reset();
                                                        _model
                                                            .cSaleSymbol1ValueController
                                                            ?.reset();
                                                        _model
                                                            .cSaleSymbol2ValueController
                                                            ?.reset();
                                                      });
                                                      setState(() {
                                                        _model
                                                            .cSaleTypeCustomerNameTextController
                                                            ?.text = functions.isArrayNullOrEmpty(
                                                                FFAppState()
                                                                    .ContractSaleData
                                                                    .participants
                                                                    .map((e) => e
                                                                        .toMap())
                                                                    .toList())
                                                            ? FFAppState()
                                                                .ContractSaleData
                                                                .participants
                                                                .first
                                                                .name
                                                            : FFAppConstants
                                                                .EMPTYSTRING;
                                                        _model
                                                            .cSaleTypeContratDateTextController
                                                            ?.text = FFAppState()
                                                                    .ContractSaleData !=
                                                                null
                                                            ? functions.formatStringDateToUi(
                                                                FFAppState()
                                                                    .ContractSaleData
                                                                    .contractDate,
                                                                'dd/MM/yyyy')
                                                            : FFAppConstants
                                                                .EMPTYSTRING;
                                                        _model
                                                            .cSaleTypeQuantityTextController
                                                            ?.text = FFAppState()
                                                                    .ContractSaleData !=
                                                                null
                                                            ? functions.formatNumberDoubleToStringMask(
                                                                FFAppState()
                                                                    .ContractSaleData
                                                                    .quantity
                                                                    .toDouble(),
                                                                FFAppConstants
                                                                    .USLocateNumber,
                                                                FFAppConstants
                                                                    .USMaskNumberDecimal)!
                                                            : FFAppConstants
                                                                .EMPTYSTRING;
                                                        _model
                                                            .cSaleLogisticMinTextController
                                                            ?.text = functions
                                                                .isArrayNullOrEmpty(FFAppState()
                                                                    .ContractSaleData
                                                                    .logisticSchedule
                                                                    .map((e) => e
                                                                        .toMap())
                                                                    .toList())
                                                            ? functions.formatNumberDoubleToStringMask(
                                                                FFAppState()
                                                                    .ContractSaleData
                                                                    .logisticSchedule
                                                                    .first
                                                                    .freightCost
                                                                    .min,
                                                                FFAppConstants
                                                                    .USLocateNumber,
                                                                FFAppConstants
                                                                    .USMaskNumberDecimal)!
                                                            : FFAppConstants
                                                                .EMPTYSTRING;
                                                        _model
                                                            .cSaleLogisticMaxTextController
                                                            ?.text = functions
                                                                .isArrayNullOrEmpty(FFAppState()
                                                                    .ContractSaleData
                                                                    .logisticSchedule
                                                                    .map((e) => e
                                                                        .toMap())
                                                                    .toList())
                                                            ? functions.formatNumberDoubleToStringMask(
                                                                FFAppState()
                                                                    .ContractSaleData
                                                                    .logisticSchedule
                                                                    .first
                                                                    .freightCost
                                                                    .max,
                                                                FFAppConstants
                                                                    .USLocateNumber,
                                                                FFAppConstants
                                                                    .USMaskNumberDecimal)!
                                                            : FFAppConstants
                                                                .EMPTYSTRING;
                                                        _model
                                                            .cSaleShipmentDateFromTextController
                                                            ?.text = FFAppState()
                                                                    .ContractSaleData !=
                                                                null
                                                            ? functions.formatStringDateToUi(
                                                                FFAppState()
                                                                    .ContractSaleData
                                                                    .shippingStartDate,
                                                                'dd/MM/yyyy')
                                                            : FFAppConstants
                                                                .EMPTYSTRING;
                                                        _model
                                                            .cSaleShipmentDateToTextController
                                                            ?.text = FFAppState()
                                                                    .ContractSaleData !=
                                                                null
                                                            ? functions.formatStringDateToUi(
                                                                FFAppState()
                                                                    .ContractSaleData
                                                                    .shippingEndDate,
                                                                'dd/MM/yyyy')
                                                            : FFAppConstants
                                                                .EMPTYSTRING;
                                                        _model.cSaleRemarkContactTextController
                                                                ?.text =
                                                            functions.findRemarkInList(
                                                                FFAppState()
                                                                    .ContractSaleData
                                                                    .remarks
                                                                    .toList(),
                                                                'contact');
                                                        _model.cSaleRemarksShipmentTextController
                                                                ?.text =
                                                            functions.findRemarkInList(
                                                                FFAppState()
                                                                    .ContractSaleData
                                                                    .remarks
                                                                    .toList(),
                                                                'shipment');
                                                        _model.cSaleRemarkRoutingTextController
                                                                ?.text =
                                                            functions.findRemarkInList(
                                                                FFAppState()
                                                                    .ContractSaleData
                                                                    .remarks
                                                                    .toList(),
                                                                'routing');
                                                        _model.cSaleRemarkPremDiscTextController
                                                                ?.text =
                                                            functions.findRemarkInList(
                                                                FFAppState()
                                                                    .ContractSaleData
                                                                    .remarks
                                                                    .toList(),
                                                                'premDisc');
                                                        _model.cSaleRemarkTermsTextController
                                                                ?.text =
                                                            functions.findRemarkInList(
                                                                FFAppState()
                                                                    .ContractSaleData
                                                                    .remarks
                                                                    .toList(),
                                                                'terms');
                                                        _model.cSaleRemarkRemarksTextController
                                                                ?.text =
                                                            functions.findRemarkInList(
                                                                FFAppState()
                                                                    .ContractSaleData
                                                                    .remarks
                                                                    .toList(),
                                                                'remarks');
                                                        _model
                                                            .cSaleNoteTextController
                                                            ?.text = (FFAppState()
                                                                    .ContractSaleData
                                                                    .notes
                                                                    .isNotEmpty) ==
                                                                true
                                                            ? FFAppState()
                                                                .ContractSaleData
                                                                .notes
                                                                .first
                                                                .text
                                                            : '';
                                                        _model
                                                            .cSalePricePrice1TextController
                                                            ?.text = functions
                                                                .isArrayNullOrEmpty(FFAppState()
                                                                    .ContractSaleData
                                                                    .priceSchedule
                                                                    .map((e) => e
                                                                        .toMap())
                                                                    .toList())
                                                            ? functions.formatNumbersQuantity(
                                                                FFAppState()
                                                                    .ContractSaleData
                                                                    .priceSchedule
                                                                    .first
                                                                    .price,
                                                                FFAppConstants
                                                                    .USLocateNumber,
                                                                FFAppConstants
                                                                    .USMaskNumberDecimal)
                                                            : FFAppConstants
                                                                .EMPTYSTRING;
                                                        _model
                                                            .cSalePriceBasis1TextController
                                                            ?.text = functions
                                                                .isArrayNullOrEmpty(FFAppState()
                                                                    .ContractSaleData
                                                                    .priceSchedule
                                                                    .map((e) => e
                                                                        .toMap())
                                                                    .toList())
                                                            ? (FFAppState()
                                                                        .ContractSaleData
                                                                        .priceSchedule
                                                                        .first
                                                                        .basis !=
                                                                    0.0
                                                                ? functions
                                                                    .formatNumberDoubleToStringMask(
                                                                        (double
                                                                            basis) {
                                                                          return basis >= 0
                                                                              ? basis
                                                                              : basis * -1;
                                                                        }(FFAppState()
                                                                            .ContractSaleData
                                                                            .priceSchedule
                                                                            .first
                                                                            .basis),
                                                                        FFAppConstants
                                                                            .USLocateNumber,
                                                                        FFAppConstants
                                                                            .USMaskNumberDecimal)!
                                                                : FFAppConstants
                                                                    .EMPTYSTRING)
                                                            : FFAppConstants
                                                                .EMPTYSTRING;
                                                        _model
                                                            .cSalePriceFuture1TextController
                                                            ?.text = functions
                                                                .isArrayNullOrEmpty(FFAppState()
                                                                    .ContractSaleData
                                                                    .priceSchedule
                                                                    .map((e) => e
                                                                        .toMap())
                                                                    .toList())
                                                            ? functions.formatNumberDoubleToStringMask(
                                                                FFAppState()
                                                                    .ContractSaleData
                                                                    .priceSchedule
                                                                    .first
                                                                    .futurePrice,
                                                                FFAppConstants
                                                                    .USLocateNumber,
                                                                FFAppConstants
                                                                    .USMaskNumberDecimal)!
                                                            : FFAppConstants
                                                                .EMPTYSTRING;
                                                        _model
                                                            .cSalePriceBasis2TextController
                                                            ?.text = functions
                                                                .isArrayNullOrEmpty(FFAppState()
                                                                    .ContractSaleData
                                                                    .priceSchedule
                                                                    .map((e) => e
                                                                        .toMap())
                                                                    .toList())
                                                            ? (FFAppState()
                                                                        .ContractSaleData
                                                                        .priceSchedule
                                                                        .first
                                                                        .basis !=
                                                                    0.0
                                                                ? functions
                                                                    .formatNumberDoubleToStringMask(
                                                                        (double
                                                                            basis) {
                                                                          return basis >= 0
                                                                              ? basis
                                                                              : basis * -1;
                                                                        }(FFAppState()
                                                                            .ContractSaleData
                                                                            .priceSchedule
                                                                            .first
                                                                            .basis),
                                                                        FFAppConstants
                                                                            .USLocateNumber,
                                                                        FFAppConstants
                                                                            .USMaskNumberDecimal)!
                                                                : FFAppConstants
                                                                    .EMPTYSTRING)
                                                            : FFAppConstants
                                                                .EMPTYSTRING;
                                                      });
                                                      // UpdateAppState
                                                      FFAppState()
                                                          .updateContractSaleMetadataStruct(
                                                        (e) => e
                                                          ..backPage =
                                                              widget.backPage
                                                          ..loadAppState = false
                                                          ..edit = true,
                                                      );
                                                      await _model
                                                          .navigateBackContract(
                                                              context);
                                                      setState(() {});
                                                    },
                                                    text: 'Cancel',
                                                    options: FFButtonOptions(
                                                      width: 100.0,
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0xB6FF0010),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    var _shouldSetState = false;
                                                    if (_model.formKey
                                                                .currentState ==
                                                            null ||
                                                        !_model.formKey
                                                            .currentState!
                                                            .validate()) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .cSalePriceTypeValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .cSaleTypeSubTypeValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .cSaleTypeCommodityValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .cSaleTypeGradeValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .cSaleTypeUnitValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .cSalePriceCurrencyValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .cSalePriceMonthValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .cSalePriceYearValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .cSalePriceExchangeValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .cSaleLogisticPaymentValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .cSaleLogisticCoordinationValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .cSaleLogisticTypeValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .cSaleShipmentAPriorityValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .cSaleDeliverLocationValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .cSaleDeliverTransportValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .cSaleDeliverInspectionsValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .cSaleDeliverProteinValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .cSaleDeliverWeightValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (functions.checkMinMax(
                                                        functions.parseStringWithMaskToDouble(
                                                            _model
                                                                .cSaleLogisticMinTextController
                                                                .text,
                                                            FFAppConstants
                                                                .USLocateNumber,
                                                            FFAppConstants
                                                                .USMaskNumberDecimal),
                                                        functions.parseStringWithMaskToDouble(
                                                            _model
                                                                .cSaleLogisticMaxTextController
                                                                .text,
                                                            FFAppConstants
                                                                .USLocateNumber,
                                                            FFAppConstants
                                                                .USMaskNumberDecimal))) {
                                                      if (functions.checkDatesFromTo(
                                                          functions
                                                              .formatStringToDatetime(
                                                                  _model
                                                                      .cSaleShipmentDateFromTextController
                                                                      .text,
                                                                  'dd/MM/yyyy'),
                                                          functions.formatStringToDatetime(
                                                              _model
                                                                  .cSaleShipmentDateToTextController
                                                                  .text,
                                                              'dd/MM/yyyy'))) {
                                                        await Future.wait([
                                                          Future(() async {
                                                            // UpdateContractSaleRoot
                                                            FFAppState()
                                                                .updateContractSaleDataStruct(
                                                              (e) => e
                                                                ..type =
                                                                    CtrTypeEnum
                                                                        .sale
                                                                        .name
                                                                ..subType = _model
                                                                    .cSaleTypeSubTypeValue
                                                                ..grade = _model
                                                                    .cSaleTypeGradeValue
                                                                ..measurementUnit =
                                                                    _model
                                                                        .cSaleTypeUnitValue
                                                                ..applicationPriority =
                                                                    _model
                                                                        .cSaleShipmentAPriorityValue
                                                                ..delivered = _model
                                                                    .cSaleDeliverLocationValue
                                                                ..transport = _model
                                                                    .cSaleDeliverTransportValue
                                                                ..weights = _model
                                                                    .cSaleDeliverWeightValue
                                                                ..inspections =
                                                                    _model
                                                                        .cSaleDeliverInspectionsValue
                                                                ..proteins = _model
                                                                    .cSaleDeliverProteinValue
                                                                ..registeredById =
                                                                    FFAppState()
                                                                        .UserSession
                                                                        .id
                                                                ..registeredByName =
                                                                    FFAppState()
                                                                        .UserSession
                                                                        .firstName,
                                                            );
                                                          }),
                                                          Future(() async {
                                                            // UpdateComodityObject
                                                            FFAppState()
                                                                .updateContractSaleDataStruct(
                                                              (e) => e
                                                                ..commodity =
                                                                    CtrCommoditySchemaStruct(
                                                                  commodityId:
                                                                      _model
                                                                          .cSaleTypeCommodityValue,
                                                                  name: functions.findCommodityInList(
                                                                      FFAppState()
                                                                          .Commodities
                                                                          .toList(),
                                                                      _model
                                                                          .cSaleTypeCommodityValue!),
                                                                ),
                                                            );
                                                            await _model
                                                                .cSaleSavePriceInput(
                                                                    context);
                                                            await _model
                                                                .cSaleSaveLogisticRemarks(
                                                                    context);
                                                            await _model
                                                                .cSaleSaveLogisticRemarks(
                                                                    context);
                                                            // AddParticipant
                                                            FFAppState()
                                                                .updateContractSaleDataStruct(
                                                              (e) => e
                                                                ..updateParticipants(
                                                                  (e) => e.add(
                                                                      CtrParticipantSchemaStruct(
                                                                    peopleId:
                                                                        FFAppState()
                                                                            .UserSession
                                                                            .id,
                                                                    name: FFAppState()
                                                                        .UserSession
                                                                        .firstName,
                                                                    role: Role
                                                                        .seller
                                                                        .name,
                                                                  )),
                                                                ),
                                                            );
                                                          }),
                                                        ]);
                                                        _model.apiResultq0uCopy =
                                                            await ContractsGroup
                                                                .createContractCall
                                                                .call(
                                                          idempotence: FFAppState()
                                                              .ContractSaleMetadata
                                                              .idempotence,
                                                          dataBodyJson:
                                                              FFAppState()
                                                                  .ContractSaleData
                                                                  .toMap(),
                                                          partitionKey:
                                                              FFAppState()
                                                                  .partitionKey,
                                                          authToken:
                                                              currentAuthenticationToken,
                                                        );

                                                        _shouldSetState = true;
                                                        if ((_model
                                                                .apiResultq0uCopy
                                                                ?.succeeded ??
                                                            true)) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Saved Contract Success',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                          await action_blocks
                                                              .resetContractSale(
                                                                  context);
                                                          // UpdateAppState
                                                          FFAppState()
                                                              .updateContractSaleMetadataStruct(
                                                            (e) => e
                                                              ..backPage =
                                                                  widget
                                                                      .backPage
                                                              ..loadAppState =
                                                                  false
                                                              ..edit = true,
                                                          );
                                                          // NavigateBack
                                                          await _model
                                                              .navigateBackContract(
                                                                  context);
                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Error Saving Contract',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                            ),
                                                          );
                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        }
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'The initial date cannot be greater than or equal to the final date in the shipping section',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
                                                        );
                                                        if (_shouldSetState)
                                                          setState(() {});
                                                        return;
                                                      }
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Min value cannot be greater than Max',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                        ),
                                                      );
                                                      if (_shouldSetState)
                                                        setState(() {});
                                                      return;
                                                    }

                                                    if (_shouldSetState)
                                                      setState(() {});
                                                  },
                                                  text: 'Save',
                                                  options: FFButtonOptions(
                                                    width: 100.0,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    elevation: 3.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 24.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
