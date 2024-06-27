import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/base/side_nav/side_nav_widget.dart';
import '/components/contracts/modal_select_remarks/modal_select_remarks_widget.dart';
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
import 'create_purchase_contract_w_m_model.dart';
export 'create_purchase_contract_w_m_model.dart';

class CreatePurchaseContractWMWidget extends StatefulWidget {
  const CreatePurchaseContractWMWidget({
    super.key,
    this.contractId,
    this.backPage,
    bool? edit,
  }) : this.edit = edit ?? false;

  final String? contractId;
  final Pages? backPage;
  final bool edit;

  @override
  State<CreatePurchaseContractWMWidget> createState() =>
      _CreatePurchaseContractWMWidgetState();
}

class _CreatePurchaseContractWMWidgetState
    extends State<CreatePurchaseContractWMWidget> {
  late CreatePurchaseContractWMModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatePurchaseContractWMModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().ContractPurchaseMetadata.idempotence != null &&
          FFAppState().ContractPurchaseMetadata.idempotence != '') {
        // Desactivate Form To Update
        FFAppState().updateContractPurchaseMetadataStruct(
          (e) => e..incomplete = true,
        );
      } else {
        await _model.cleanPurchaseContract(context);
        setState(() {});
        _model.ctrIdepotenceApiResult =
            await ContractsGroup.idempotenceContractCall.call(
          partitionKey: FFAppState().partitionKey,
          authToken: currentAuthenticationToken,
        );

        if ((_model.ctrIdepotenceApiResult?.succeeded ?? true)) {
          FFAppState().updateContractPurchaseMetadataStruct(
            (e) => e
              ..idempotence = ContractsGroup.idempotenceContractCall.idPotence(
                (_model.ctrIdepotenceApiResult?.jsonBody ?? ''),
              ),
          );
        }
      }

      setState(() {
        _model.typeCustomerNameTextController?.text =
            functions.isArrayNullOrEmpty(FFAppState()
                    .ContractPurchase
                    .participants
                    .map((e) => e.toMap())
                    .toList()
                    .toList())
                ? FFAppState().ContractPurchase.participants.first.name
                : FFAppConstants.EMPTYSTRING;
        _model.typeContratDateTextController?.text =
            FFAppState().ContractPurchase != null
                ? functions.formatStringDateToUi(
                    FFAppState().ContractPurchase.contractDate, 'dd/MM/yyyy')
                : FFAppConstants.EMPTYSTRING;
        _model.typeQuantityTextController?.text =
            FFAppState().ContractPurchase != null
                ? functions.formatNumberDoubleToStringMask(
                    FFAppState().ContractPurchase.quantity.toDouble(),
                    FFAppConstants.USLocateNumber,
                    FFAppConstants.USMaskNumber)!
                : FFAppConstants.EMPTYSTRING;
        _model.cPurchasePriceBasis1TextController?.text = functions
                .isArrayNullOrEmpty(FFAppState()
                    .ContractPurchase
                    .priceSchedule
                    .map((e) => e.toMap())
                    .toList()
                    .toList())
            ? (FFAppState().ContractPurchase.priceSchedule.first.basis != 0.0
                ? functions.formatNumberDoubleToStringMask(
                    (double basis) {
                      return basis >= 0 ? basis : basis * -1;
                    }(FFAppState().ContractPurchase.priceSchedule.first.basis),
                    FFAppConstants.USLocateNumber,
                    FFAppConstants.USMaskNumberDecimal)!
                : FFAppConstants.EMPTYSTRING)
            : FFAppConstants.EMPTYSTRING;
        _model.cPurchasePriceFuture1TextController?.text = functions
                .isArrayNullOrEmpty(FFAppState()
                    .ContractPurchase
                    .priceSchedule
                    .map((e) => e.toMap())
                    .toList()
                    .toList())
            ? functions.formatNumberDoubleToStringMask(
                FFAppState().ContractPurchase.priceSchedule.first.futurePrice,
                FFAppConstants.USLocateNumber,
                FFAppConstants.USMaskNumberDecimal)!
            : FFAppConstants.EMPTYSTRING;
        _model.cPurchasePricePrice1TextController?.text =
            functions.isArrayNullOrEmpty(FFAppState()
                    .ContractPurchase
                    .priceSchedule
                    .map((e) => e.toMap())
                    .toList()
                    .toList())
                ? functions.formatNumberDoubleToStringMask(
                    FFAppState().ContractPurchase.priceSchedule.first.price,
                    FFAppConstants.USLocateNumber,
                    FFAppConstants.USMaskNumberDecimal)!
                : FFAppConstants.EMPTYSTRING;
        _model.logisticMaxTextController?.text = functions.isArrayNullOrEmpty(
                FFAppState()
                    .ContractPurchase
                    .logisticSchedule
                    .map((e) => e.toMap())
                    .toList()
                    .toList())
            ? functions.formatNumberDoubleToStringMask(
                FFAppState()
                    .ContractPurchase
                    .logisticSchedule
                    .first
                    .freightCost
                    .max,
                FFAppConstants.USLocateNumber,
                FFAppConstants.USMaskNumberDecimal)!
            : FFAppConstants.EMPTYSTRING;
        _model.shipmentDateFromTextController?.text =
            FFAppState().ContractPurchase != null
                ? functions.formatStringDateToUi(
                    FFAppState().ContractPurchase.shippingStartDate,
                    'dd/MM/yyyy')
                : FFAppConstants.EMPTYSTRING;
        _model.logisticMinTextController?.text = functions.isArrayNullOrEmpty(
                FFAppState()
                    .ContractPurchase
                    .logisticSchedule
                    .map((e) => e.toMap())
                    .toList()
                    .toList())
            ? functions.formatNumberDoubleToStringMask(
                FFAppState()
                    .ContractPurchase
                    .logisticSchedule
                    .first
                    .freightCost
                    .min,
                FFAppConstants.USLocateNumber,
                FFAppConstants.USMaskNumberDecimal)!
            : FFAppConstants.EMPTYSTRING;
        _model.shipmentDateToTextController?.text =
            FFAppState().ContractPurchase != null
                ? functions.formatStringDateToUi(
                    FFAppState().ContractPurchase.shippingEndDate, 'dd/MM/yyyy')
                : FFAppConstants.EMPTYSTRING;
        _model.remarkContactTextController?.text = functions.findRemarkInList(
            FFAppState().ContractPurchase.remarks.toList(), 'contact');
        _model.remarksShipmentTextController?.text = functions.findRemarkInList(
            FFAppState().ContractPurchase.remarks.toList(), 'shipment');
        _model.remarkRoutingTextController?.text = functions.findRemarkInList(
            FFAppState().ContractPurchase.remarks.toList(), 'routing');
        _model.remarkPremDiscTextController?.text = functions.findRemarkInList(
            FFAppState().ContractPurchase.remarks.toList(), 'premDisc');
        _model.remarkTermsTextController?.text = functions.findRemarkInList(
            FFAppState().ContractPurchase.remarks.toList(), 'terms');
        _model.remarkRemarksTextController?.text = functions.findRemarkInList(
            FFAppState().ContractPurchase.remarks.toList(), 'remarks');
        _model.notesTextController?.text =
            (FFAppState().ContractPurchase.notes.isNotEmpty) == true
                ? FFAppState().ContractPurchase.notes.first.text
                : ' ';
      });
      setState(() {
        _model.cPurchasePriceTypeValueController?.reset();
        _model.cPurchaseSubTypeValueController?.reset();
        _model.typeCommodityValueController?.reset();
        _model.typeGradeValueController?.reset();
        _model.typeUnitValueController?.reset();
        _model.priceMonthValueController?.reset();
        _model.priceYearValueController?.reset();
        _model.priceCurrencyValueController?.reset();
        _model.priceExchangeValueController?.reset();
        _model.logisticPaymentValueController?.reset();
        _model.logisticCoordinationValueController?.reset();
        _model.logisticTypeValueController?.reset();
        _model.shipmentApplicationPrioValueController?.reset();
        _model.deliverLocationValueController?.reset();
        _model.deliverTransportValueController?.reset();
        _model.deliverProteinValueController?.reset();
        _model.deliverInspectionsValueController?.reset();
        _model.deliverWeightValueController?.reset();
        _model.cPurchaseSymbol1ValueController?.reset();
      });
      // Activate Form To Update
      FFAppState().updateContractPurchaseMetadataStruct(
        (e) => e
          ..incomplete = false
          ..loadAppState = true
          ..backPage = widget.backPage,
      );
      if (!(FFAppState().Commodities.isNotEmpty)) {
        await action_blocks.getCommodities(context);
        setState(() {});
      }
    });

    _model.typeCustomerNameTextController ??= TextEditingController(
        text: functions.isArrayNullOrEmpty(FFAppState()
                .ContractPurchase
                .participants
                .map((e) => e.toMap())
                .toList()
                .toList())
            ? FFAppState().ContractPurchase.participants.first.name
            : FFAppConstants.EMPTYSTRING);
    _model.typeCustomerNameFocusNode ??= FocusNode();
    _model.typeCustomerNameFocusNode!.addListener(
      () async {
        if (!FFAppState().ContractPurchaseMetadata.incomplete) {
          // cleanListPeople
          FFAppState().updateContractPurchaseStruct(
            (e) => e..participants = [],
          );
          // AddNewItem
          FFAppState().updateContractPurchaseStruct(
            (e) => e
              ..updateParticipants(
                (e) => e.add(CtrParticipantSchemaStruct(
                  peopleId: '663536e15f6d6f2a9d152380',
                  name: _model.typeCustomerNameTextController.text,
                  role: 'seller',
                )),
              ),
          );
        }
      },
    );
    _model.typeContratDateTextController ??= TextEditingController(
        text: FFAppState().ContractPurchase != null
            ? functions.formatStringDateToUi(
                FFAppState().ContractPurchase.contractDate, 'dd/MM/yyyy')
            : FFAppConstants.EMPTYSTRING);
    _model.typeContratDateFocusNode ??= FocusNode();
    _model.typeContratDateFocusNode!.addListener(() => setState(() {}));
    _model.typeQuantityTextController ??= TextEditingController(
        text: FFAppState().ContractPurchase != null
            ? functions.formatNumberDoubleToStringMask(
                FFAppState().ContractPurchase.quantity.toDouble(),
                FFAppConstants.USLocateNumber,
                FFAppConstants.USMaskNumber)
            : FFAppConstants.EMPTYSTRING);
    _model.typeQuantityFocusNode ??= FocusNode();
    _model.typeQuantityFocusNode!.addListener(
      () async {
        if (!FFAppState().ContractPurchaseMetadata.incomplete) {
          FFAppState().updateContractPurchaseStruct(
            (e) => e
              ..quantity = functions.parseDoubleToInt(
                  functions.parseStringWithMaskToDouble(
                      _model.typeQuantityTextController.text,
                      FFAppConstants.USLocateNumber,
                      FFAppConstants.USMaskNumber)),
          );
        }
      },
    );
    _model.cPurchasePricePrice1TextController ??= TextEditingController(
        text: functions.isArrayNullOrEmpty(FFAppState()
                .ContractPurchase
                .priceSchedule
                .map((e) => e.toMap())
                .toList()
                .toList())
            ? functions.formatNumberDoubleToStringMask(
                FFAppState().ContractPurchase.priceSchedule.first.price,
                FFAppConstants.USLocateNumber,
                FFAppConstants.USMaskNumberDecimal)
            : FFAppConstants.EMPTYSTRING);
    _model.cPurchasePricePrice1FocusNode ??= FocusNode();
    _model.cPurchasePricePrice1FocusNode!.addListener(
      () async {
        await _model.savePriceInput(context);
      },
    );
    _model.cPurchasePriceBasis1TextController ??= TextEditingController(
        text: functions.isArrayNullOrEmpty(FFAppState()
                .ContractPurchase
                .priceSchedule
                .map((e) => e.toMap())
                .toList()
                .toList())
            ? (FFAppState().ContractPurchase.priceSchedule.first.basis != 0.0
                ? functions.formatNumberDoubleToStringMask(
                    (double basis) {
                      return basis >= 0 ? basis : basis * -1;
                    }(FFAppState().ContractPurchase.priceSchedule.first.basis),
                    FFAppConstants.USLocateNumber,
                    FFAppConstants.USMaskNumberDecimal)
                : FFAppConstants.EMPTYSTRING)
            : FFAppConstants.EMPTYSTRING);
    _model.cPurchasePriceBasis1FocusNode ??= FocusNode();
    _model.cPurchasePriceBasis1FocusNode!.addListener(
      () async {
        await _model.savePriceInput(context);
      },
    );
    _model.cPurchasePriceFuture1TextController ??= TextEditingController(
        text: functions.isArrayNullOrEmpty(FFAppState()
                .ContractPurchase
                .priceSchedule
                .map((e) => e.toMap())
                .toList()
                .toList())
            ? functions.formatNumberDoubleToStringMask(
                FFAppState().ContractPurchase.priceSchedule.first.futurePrice,
                FFAppConstants.USLocateNumber,
                FFAppConstants.USMaskNumberDecimal)
            : FFAppConstants.EMPTYSTRING);
    _model.cPurchasePriceFuture1FocusNode ??= FocusNode();
    _model.cPurchasePriceFuture1FocusNode!.addListener(
      () async {
        await _model.savePriceInput(context);
      },
    );
    _model.cPurchasePriceBasis2TextController ??= TextEditingController(
        text: functions.isArrayNullOrEmpty(FFAppState()
                .ContractPurchase
                .priceSchedule
                .map((e) => e.toMap())
                .toList()
                .toList())
            ? (FFAppState().ContractPurchase.priceSchedule.first.basis != 0.0
                ? functions.formatNumberDoubleToStringMask(
                    (double basis) {
                      return basis >= 0 ? basis : basis * -1;
                    }(FFAppState().ContractPurchase.priceSchedule.first.basis),
                    FFAppConstants.USLocateNumber,
                    FFAppConstants.USMaskNumberDecimal)
                : FFAppConstants.EMPTYSTRING)
            : FFAppConstants.EMPTYSTRING);
    _model.cPurchasePriceBasis2FocusNode ??= FocusNode();
    _model.cPurchasePriceBasis2FocusNode!.addListener(
      () async {
        await _model.savePriceInput(context);
      },
    );
    _model.logisticMinTextController ??= TextEditingController(
        text: functions.isArrayNullOrEmpty(FFAppState()
                .ContractPurchase
                .logisticSchedule
                .map((e) => e.toMap())
                .toList()
                .toList())
            ? functions.formatNumberDoubleToStringMask(
                FFAppState()
                    .ContractPurchase
                    .logisticSchedule
                    .first
                    .freightCost
                    .min,
                FFAppConstants.USLocateNumber,
                FFAppConstants.USMaskNumberDecimal)
            : FFAppConstants.EMPTYSTRING);
    _model.logisticMinFocusNode ??= FocusNode();
    _model.logisticMinFocusNode!.addListener(
      () async {
        await _model.saveLogisticInput(context);
      },
    );
    _model.logisticMaxTextController ??= TextEditingController(
        text: functions.isArrayNullOrEmpty(FFAppState()
                .ContractPurchase
                .logisticSchedule
                .map((e) => e.toMap())
                .toList()
                .toList())
            ? functions.formatNumberDoubleToStringMask(
                FFAppState()
                    .ContractPurchase
                    .logisticSchedule
                    .first
                    .freightCost
                    .max,
                FFAppConstants.USLocateNumber,
                FFAppConstants.USMaskNumberDecimal)
            : FFAppConstants.EMPTYSTRING);
    _model.logisticMaxFocusNode ??= FocusNode();
    _model.logisticMaxFocusNode!.addListener(
      () async {
        await _model.saveLogisticInput(context);
      },
    );
    _model.shipmentDateFromTextController ??= TextEditingController(
        text: FFAppState().ContractPurchase != null
            ? functions.formatStringDateToUi(
                FFAppState().ContractPurchase.shippingStartDate, 'dd/MM/yyyy')
            : FFAppConstants.EMPTYSTRING);
    _model.shipmentDateFromFocusNode ??= FocusNode();
    _model.shipmentDateFromFocusNode!.addListener(() => setState(() {}));
    _model.shipmentDateToTextController ??= TextEditingController(
        text: FFAppState().ContractPurchase != null
            ? functions.formatStringDateToUi(
                FFAppState().ContractPurchase.shippingEndDate, 'dd/MM/yyyy')
            : FFAppConstants.EMPTYSTRING);
    _model.shipmentDateToFocusNode ??= FocusNode();
    _model.shipmentDateToFocusNode!.addListener(() => setState(() {}));
    _model.remarkContactTextController ??= TextEditingController(
        text: functions.findRemarkInList(
            FFAppState().ContractPurchase.remarks.toList(), 'contact'));
    _model.remarkContactFocusNode ??= FocusNode();
    _model.remarkContactFocusNode!.addListener(
      () async {
        if (!FFAppState().ContractPurchaseMetadata.incomplete) {
          // CleanRemarksInList
          FFAppState().updateContractPurchaseStruct(
            (e) => e..remarks = [],
          );
          FFAppState().updateContractPurchaseStruct(
            (e) => e
              ..remarks = functions
                  .ctrCreateRemarkInList(
                      _model.remarkContactTextController.text,
                      _model.remarksShipmentTextController.text,
                      _model.remarkRoutingTextController.text,
                      _model.remarkPremDiscTextController.text,
                      _model.remarkTermsTextController.text,
                      _model.remarkRemarksTextController.text)
                  .toList(),
          );
        }
      },
    );
    _model.remarksShipmentTextController ??= TextEditingController(
        text: functions.findRemarkInList(
            FFAppState().ContractPurchase.remarks.toList(), 'shipment'));
    _model.remarksShipmentFocusNode ??= FocusNode();
    _model.remarksShipmentFocusNode!.addListener(
      () async {
        if (!FFAppState().ContractPurchaseMetadata.incomplete) {
          // CleanRemarksInList
          FFAppState().updateContractPurchaseStruct(
            (e) => e..remarks = [],
          );
          FFAppState().updateContractPurchaseStruct(
            (e) => e
              ..remarks = functions
                  .ctrCreateRemarkInList(
                      _model.remarkContactTextController.text,
                      _model.remarksShipmentTextController.text,
                      _model.remarkRoutingTextController.text,
                      _model.remarkPremDiscTextController.text,
                      _model.remarkTermsTextController.text,
                      _model.remarkRemarksTextController.text)
                  .toList(),
          );
        }
      },
    );
    _model.remarkRoutingTextController ??= TextEditingController(
        text: functions.findRemarkInList(
            FFAppState().ContractPurchase.remarks.toList(), 'routing'));
    _model.remarkRoutingFocusNode ??= FocusNode();
    _model.remarkRoutingFocusNode!.addListener(
      () async {
        if (!FFAppState().ContractPurchaseMetadata.incomplete) {
          // CleanRemarksInList
          FFAppState().updateContractPurchaseStruct(
            (e) => e..remarks = [],
          );
          FFAppState().updateContractPurchaseStruct(
            (e) => e
              ..remarks = functions
                  .ctrCreateRemarkInList(
                      _model.remarkContactTextController.text,
                      _model.remarksShipmentTextController.text,
                      _model.remarkRoutingTextController.text,
                      _model.remarkPremDiscTextController.text,
                      _model.remarkTermsTextController.text,
                      _model.remarkRemarksTextController.text)
                  .toList(),
          );
        }
      },
    );
    _model.remarkPremDiscTextController ??= TextEditingController(
        text: functions.findRemarkInList(
            FFAppState().ContractPurchase.remarks.toList(), 'premDisc'));
    _model.remarkPremDiscFocusNode ??= FocusNode();
    _model.remarkPremDiscFocusNode!.addListener(
      () async {
        if (!FFAppState().ContractPurchaseMetadata.incomplete) {
          // CleanRemarksInList
          FFAppState().updateContractPurchaseStruct(
            (e) => e..remarks = [],
          );
          FFAppState().updateContractPurchaseStruct(
            (e) => e
              ..remarks = functions
                  .ctrCreateRemarkInList(
                      _model.remarkContactTextController.text,
                      _model.remarksShipmentTextController.text,
                      _model.remarkRoutingTextController.text,
                      _model.remarkPremDiscTextController.text,
                      _model.remarkTermsTextController.text,
                      _model.remarkRemarksTextController.text)
                  .toList(),
          );
        }
      },
    );
    _model.remarkTermsTextController ??= TextEditingController(
        text: functions.findRemarkInList(
            FFAppState().ContractPurchase.remarks.toList(), 'terms'));
    _model.remarkTermsFocusNode ??= FocusNode();
    _model.remarkTermsFocusNode!.addListener(
      () async {
        if (!FFAppState().ContractPurchaseMetadata.incomplete) {
          // CleanRemarksInList
          FFAppState().updateContractPurchaseStruct(
            (e) => e..remarks = [],
          );
          FFAppState().updateContractPurchaseStruct(
            (e) => e
              ..remarks = functions
                  .ctrCreateRemarkInList(
                      _model.remarkContactTextController.text,
                      _model.remarksShipmentTextController.text,
                      _model.remarkRoutingTextController.text,
                      _model.remarkPremDiscTextController.text,
                      _model.remarkTermsTextController.text,
                      _model.remarkRemarksTextController.text)
                  .toList(),
          );
        }
      },
    );
    _model.remarkRemarksTextController ??= TextEditingController(
        text: functions.findRemarkInList(
            FFAppState().ContractPurchase.remarks.toList(), 'remarks'));
    _model.remarkRemarksFocusNode ??= FocusNode();
    _model.remarkRemarksFocusNode!.addListener(
      () async {
        if (!FFAppState().ContractPurchaseMetadata.incomplete) {
          // CleanRemarksInList
          FFAppState().updateContractPurchaseStruct(
            (e) => e..remarks = [],
          );
          FFAppState().updateContractPurchaseStruct(
            (e) => e
              ..remarks = functions
                  .ctrCreateRemarkInList(
                      _model.remarkContactTextController.text,
                      _model.remarksShipmentTextController.text,
                      _model.remarkRoutingTextController.text,
                      _model.remarkPremDiscTextController.text,
                      _model.remarkTermsTextController.text,
                      _model.remarkRemarksTextController.text)
                  .toList(),
          );
        }
      },
    );
    _model.notesTextController ??= TextEditingController(
        text: (FFAppState().ContractPurchase.notes.isNotEmpty) == true
            ? FFAppState().ContractPurchase.notes.first.text
            : ' ');
    _model.notesFocusNode ??= FocusNode();
    _model.notesFocusNode!.addListener(
      () async {
        if (!FFAppState().ContractPurchaseMetadata.incomplete) {
          // CleanNotesInList
          FFAppState().updateContractPurchaseStruct(
            (e) => e..notes = [],
          );
          FFAppState().updateContractPurchaseStruct(
            (e) => e
              ..notes = functions
                  .ctrCreateNotesInList(
                      FFAppState().UserSession.auth0Id,
                      FFAppState().UserSession.firstName,
                      _model.notesTextController.text,
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
                  selectedNav: Pages.purchase_contracts,
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
                                      children: [],
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
                                                                .cPurchasePriceTypeValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model
                                                              .cPurchasePriceTypeValue ??= functions
                                                                  .isArrayNullOrEmpty(FFAppState()
                                                                      .ContractPurchase
                                                                      .priceSchedule
                                                                      .map((e) => e
                                                                          .toMap())
                                                                      .toList())
                                                              ? FFAppState()
                                                                  .ContractPurchase
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
                                                                  .cPurchasePriceTypeValue =
                                                              val);
                                                          await _model
                                                              .savePriceInput(
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
                                                                .cPurchaseSubTypeValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model
                                                              .cPurchaseSubTypeValue ??= FFAppState()
                                                                      .ContractPurchase !=
                                                                  null
                                                              ? FFAppState()
                                                                  .ContractPurchase
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
                                                                  .cPurchaseSubTypeValue =
                                                              val);
                                                          if (!FFAppState()
                                                              .ContractPurchaseMetadata
                                                              .incomplete) {
                                                            FFAppState()
                                                                .updateContractPurchaseStruct(
                                                              (e) => e
                                                                ..subType = _model
                                                                    .cPurchaseSubTypeValue,
                                                            );
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
                                                                    .typeCustomerNameTextController,
                                                                focusNode: _model
                                                                    .typeCustomerNameFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.typeCustomerNameTextController',
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
                                                                    .typeCustomerNameTextControllerValidator
                                                                    .asValidator(
                                                                        context),
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
                                                                    .typeContratDateTextController,
                                                                focusNode: _model
                                                                    .typeContratDateFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.typeContratDateTextController',
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
                                                                          .typeContratDateTextController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.typeContratDateTextController?.clear();
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
                                                                    .typeContratDateTextControllerValidator
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
                                                                            .typeContratDateTextController
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
                                                                            .typeContratDateTextController
                                                                            ?.text = dateTimeFormat(
                                                                          'dd/MM/yyyy',
                                                                          _model
                                                                              .datePicked1,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        );
                                                                        _model
                                                                            .typeContratDateTextController
                                                                            ?.selection = TextSelection.collapsed(offset: _model.typeContratDateTextController!.text.length);
                                                                      });
                                                                    }),
                                                                    Future(
                                                                        () async {
                                                                      FFAppState()
                                                                          .updateContractPurchaseStruct(
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
                                                                .typeCommodityValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model
                                                              .typeCommodityValue ??= FFAppState()
                                                                      .ContractPurchase !=
                                                                  null
                                                              ? FFAppState()
                                                                  .ContractPurchase
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
                                                                  .typeCommodityValue =
                                                              val);
                                                          if (!FFAppState()
                                                              .ContractPurchaseMetadata
                                                              .incomplete) {
                                                            // UpdateComodityObject
                                                            FFAppState()
                                                                .updateContractPurchaseStruct(
                                                              (e) => e
                                                                ..commodity =
                                                                    CtrCommoditySchemaStruct(
                                                                  commodityId:
                                                                      _model
                                                                          .typeCommodityValue,
                                                                  name: functions.findCommodityInList(
                                                                      FFAppState()
                                                                          .Commodities
                                                                          .toList(),
                                                                      _model
                                                                          .typeCommodityValue!),
                                                                ),
                                                            );
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
                                                                        .typeGradeValueController ??=
                                                                    FormFieldController<
                                                                        int>(
                                                                  _model
                                                                      .typeGradeValue ??= FFAppState()
                                                                              .ContractPurchase !=
                                                                          null
                                                                      ? FFAppState()
                                                                          .ContractPurchase
                                                                          .grade
                                                                      : 0,
                                                                ),
                                                                options: List<
                                                                    int>.from([
                                                                  1,
                                                                  2,
                                                                  3,
                                                                  4,
                                                                  5
                                                                ]),
                                                                optionLabels: [
                                                                  '#1',
                                                                  '#2',
                                                                  '#3',
                                                                  '#4',
                                                                  '#5'
                                                                ],
                                                                onChanged:
                                                                    (val) async {
                                                                  setState(() =>
                                                                      _model.typeGradeValue =
                                                                          val);
                                                                  if (!FFAppState()
                                                                      .ContractPurchaseMetadata
                                                                      .incomplete) {
                                                                    FFAppState()
                                                                        .updateContractPurchaseStruct(
                                                                      (e) => e
                                                                        ..grade =
                                                                            _model.typeGradeValue,
                                                                    );
                                                                  }
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
                                                                      .typeQuantityTextController,
                                                                  focusNode: _model
                                                                      .typeQuantityFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.typeQuantityTextController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            1000),
                                                                    () async {
                                                                      setState(
                                                                          () {
                                                                        _model.typeQuantityTextController?.text = functions.formatNumberStringToStringMask(
                                                                            _model.typeQuantityTextController.text,
                                                                            FFAppConstants.USLocateNumber,
                                                                            FFAppConstants.USMaskNumber);
                                                                      });
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
                                                                            .typeQuantityTextController!
                                                                            .text
                                                                            .isNotEmpty
                                                                        ? InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              _model.typeQuantityTextController?.clear();
                                                                              setState(() {
                                                                                _model.typeQuantityTextController?.text = functions.formatNumberStringToStringMask(_model.typeQuantityTextController.text, FFAppConstants.USLocateNumber, FFAppConstants.USMaskNumber);
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
                                                                  keyboardType:
                                                                      TextInputType
                                                                          .number,
                                                                  validator: _model
                                                                      .typeQuantityTextControllerValidator
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
                                                                        .typeUnitValueController ??=
                                                                    FormFieldController<
                                                                        String>(
                                                                  _model
                                                                      .typeUnitValue ??= FFAppState()
                                                                              .ContractPurchase !=
                                                                          null
                                                                      ? FFAppState()
                                                                          .ContractPurchase
                                                                          .measurementUnit
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
                                                                      _model.typeUnitValue =
                                                                          val);
                                                                  if (!FFAppState()
                                                                      .ContractPurchaseMetadata
                                                                      .incomplete) {
                                                                    FFAppState()
                                                                        .updateContractPurchaseStruct(
                                                                      (e) => e
                                                                        ..measurementUnit =
                                                                            _model.typeUnitValue,
                                                                    );
                                                                  }
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
                                                                .priceCurrencyValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model
                                                              .priceCurrencyValue ??= functions
                                                                  .isArrayNullOrEmpty(FFAppState()
                                                                      .ContractPurchase
                                                                      .priceSchedule
                                                                      .map((e) => e
                                                                          .toMap())
                                                                      .toList())
                                                              ? FFAppState()
                                                                  .ContractPurchase
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
                                                                  .priceCurrencyValue =
                                                              val);
                                                          await _model
                                                              .savePriceInput(
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
                                              if (_model
                                                      .cPurchasePriceTypeValue ==
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
                                                                .cPurchasePricePrice1TextController,
                                                            focusNode: _model
                                                                .cPurchasePricePrice1FocusNode,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.cPurchasePricePrice1TextController',
                                                              Duration(
                                                                  milliseconds:
                                                                      1000),
                                                              () async {
                                                                // Set Format Price
                                                                setState(() {
                                                                  _model.cPurchasePricePrice1TextController?.text = functions.formatNumberStringToStringMask(
                                                                      _model
                                                                          .cPurchasePricePrice1TextController
                                                                          .text,
                                                                      FFAppConstants
                                                                          .USLocateNumber,
                                                                      FFAppConstants
                                                                          .USMaskNumberDecimal);
                                                                  _model.cPurchasePricePrice1TextController
                                                                          ?.selection =
                                                                      TextSelection.collapsed(
                                                                          offset: _model
                                                                              .cPurchasePricePrice1TextController!
                                                                              .text
                                                                              .length);
                                                                });
                                                                setState(() {
                                                                  _model.cPurchaseSymbol1ValueController?.value = functions.contractSymbolToZero(
                                                                      _model
                                                                          .cPurchasePriceBasis1TextController
                                                                          .text,
                                                                      FFAppConstants
                                                                          .USLocateNumber,
                                                                      FFAppConstants
                                                                          .USMaskNumberDecimal);
                                                                });
                                                                setState(() {
                                                                  _model.cPurchasePriceBasis1TextController?.text = functions.formatNumberStringToStringMask(
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
                                                                  _model.cPurchasePriceBasis1TextController
                                                                          ?.selection =
                                                                      TextSelection.collapsed(
                                                                          offset: _model
                                                                              .cPurchasePriceBasis1TextController!
                                                                              .text
                                                                              .length);
                                                                });
                                                                setState(() {
                                                                  _model.cPurchasePriceFuture1TextController?.text = functions.formatNumberStringToStringMask(
                                                                      _model
                                                                          .cPurchasePricePrice1TextController
                                                                          .text,
                                                                      FFAppConstants
                                                                          .USLocateNumber,
                                                                      FFAppConstants
                                                                          .USMaskNumberDecimal);
                                                                  _model.cPurchasePriceFuture1TextController
                                                                          ?.selection =
                                                                      TextSelection.collapsed(
                                                                          offset: _model
                                                                              .cPurchasePriceFuture1TextController!
                                                                              .text
                                                                              .length);
                                                                });
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
                                                                      .cPurchasePricePrice1TextController!
                                                                      .text
                                                                      .isNotEmpty
                                                                  ? InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        _model
                                                                            .cPurchasePricePrice1TextController
                                                                            ?.clear(); // Set Format Price
                                                                        setState(
                                                                            () {
                                                                          _model.cPurchasePricePrice1TextController?.text = functions.formatNumberStringToStringMask(
                                                                              _model.cPurchasePricePrice1TextController.text,
                                                                              FFAppConstants.USLocateNumber,
                                                                              FFAppConstants.USMaskNumberDecimal);
                                                                          _model
                                                                              .cPurchasePricePrice1TextController
                                                                              ?.selection = TextSelection.collapsed(offset: _model.cPurchasePricePrice1TextController!.text.length);
                                                                        });
                                                                        setState(
                                                                            () {
                                                                          _model.cPurchaseSymbol1ValueController?.value = functions.contractSymbolToZero(
                                                                              _model.cPurchasePriceBasis1TextController.text,
                                                                              FFAppConstants.USLocateNumber,
                                                                              FFAppConstants.USMaskNumberDecimal);
                                                                        });
                                                                        setState(
                                                                            () {
                                                                          _model.cPurchasePriceBasis1TextController?.text = functions.formatNumberStringToStringMask(
                                                                              functions.formatNumbersQuantity(0.0, FFAppConstants.USLocateNumber, FFAppConstants.USMaskNumberDecimal),
                                                                              FFAppConstants.USLocateNumber,
                                                                              FFAppConstants.USMaskNumberDecimal);
                                                                          _model
                                                                              .cPurchasePriceBasis1TextController
                                                                              ?.selection = TextSelection.collapsed(offset: _model.cPurchasePriceBasis1TextController!.text.length);
                                                                        });
                                                                        setState(
                                                                            () {
                                                                          _model.cPurchasePriceFuture1TextController?.text = functions.formatNumberStringToStringMask(
                                                                              _model.cPurchasePricePrice1TextController.text,
                                                                              FFAppConstants.USLocateNumber,
                                                                              FFAppConstants.USMaskNumberDecimal);
                                                                          _model
                                                                              .cPurchasePriceFuture1TextController
                                                                              ?.selection = TextSelection.collapsed(offset: _model.cPurchasePriceFuture1TextController!.text.length);
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
                                                                .cPurchasePricePrice1TextControllerValidator
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
                                                                          .cPurchaseSymbol1ValueController ??=
                                                                      FormFieldController<
                                                                          int>(
                                                                    _model
                                                                        .cPurchaseSymbol1Value ??= functions.isArrayNullOrEmpty(FFAppState()
                                                                            .ContractPurchase
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
                                                                            .ContractPurchase
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
                                                                        _model.cPurchaseSymbol1Value =
                                                                            val);
                                                                    setState(
                                                                        () {
                                                                      _model.cPurchasePriceFuture1TextController?.text = functions.contractCalcFuture(
                                                                          _model
                                                                              .cPurchasePriceBasis1TextController
                                                                              .text,
                                                                          _model
                                                                              .cPurchasePricePrice1TextController
                                                                              .text,
                                                                          _model
                                                                              .cPurchaseSymbol1Value!,
                                                                          FFAppConstants
                                                                              .USLocateNumber,
                                                                          FFAppConstants
                                                                              .USMaskNumberDecimal)!;
                                                                      _model.cPurchasePriceFuture1TextController?.selection = TextSelection.collapsed(
                                                                          offset: _model
                                                                              .cPurchasePriceFuture1TextController!
                                                                              .text
                                                                              .length);
                                                                    });
                                                                    await _model
                                                                        .savePriceInput(
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
                                                                      .cPurchasePriceBasis1TextController,
                                                                  focusNode: _model
                                                                      .cPurchasePriceBasis1FocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.cPurchasePriceBasis1TextController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            1000),
                                                                    () async {
                                                                      setState(
                                                                          () {
                                                                        _model.cPurchasePriceBasis1TextController?.text = functions.formatNumberStringToStringMask(
                                                                            _model.cPurchasePriceBasis1TextController.text,
                                                                            FFAppConstants.USLocateNumber,
                                                                            FFAppConstants.USMaskNumberDecimal);
                                                                      });
                                                                      setState(
                                                                          () {
                                                                        _model.cPurchasePriceFuture1TextController?.text = functions.contractCalcFuture(
                                                                            _model.cPurchasePriceBasis1TextController.text,
                                                                            _model.cPurchasePricePrice1TextController.text,
                                                                            _model.cPurchaseSymbol1Value!,
                                                                            FFAppConstants.USLocateNumber,
                                                                            FFAppConstants.USMaskNumberDecimal)!;
                                                                      });
                                                                      setState(
                                                                          () {
                                                                        _model.cPurchaseSymbol1ValueController?.value = functions.contractSymbolToZero(
                                                                            _model.cPurchasePriceBasis1TextController.text,
                                                                            FFAppConstants.USLocateNumber,
                                                                            FFAppConstants.USMaskNumberDecimal);
                                                                      });
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
                                                                            .cPurchasePriceBasis1TextController!
                                                                            .text
                                                                            .isNotEmpty
                                                                        ? InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              _model.cPurchasePriceBasis1TextController?.clear();
                                                                              setState(() {
                                                                                _model.cPurchasePriceBasis1TextController?.text = functions.formatNumberStringToStringMask(_model.cPurchasePriceBasis1TextController.text, FFAppConstants.USLocateNumber, FFAppConstants.USMaskNumberDecimal);
                                                                              });
                                                                              setState(() {
                                                                                _model.cPurchasePriceFuture1TextController?.text = functions.contractCalcFuture(_model.cPurchasePriceBasis1TextController.text, _model.cPurchasePricePrice1TextController.text, _model.cPurchaseSymbol1Value!, FFAppConstants.USLocateNumber, FFAppConstants.USMaskNumberDecimal)!;
                                                                              });
                                                                              setState(() {
                                                                                _model.cPurchaseSymbol1ValueController?.value = functions.contractSymbolToZero(_model.cPurchasePriceBasis1TextController.text, FFAppConstants.USLocateNumber, FFAppConstants.USMaskNumberDecimal);
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
                                                                      .cPurchasePriceBasis1TextControllerValidator
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
                                                                      .cPurchasePriceFuture1TextController,
                                                                  focusNode: _model
                                                                      .cPurchasePriceFuture1FocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.cPurchasePriceFuture1TextController',
                                                                    Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    () async {
                                                                      setState(
                                                                          () {
                                                                        _model.cPurchasePriceFuture1TextController?.text = functions.formatNumberStringToStringMask(
                                                                            _model.cPurchasePriceFuture1TextController.text,
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
                                                                            .cPurchasePriceFuture1TextController!
                                                                            .text
                                                                            .isNotEmpty
                                                                        ? InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              _model.cPurchasePriceFuture1TextController?.clear();
                                                                              setState(() {
                                                                                _model.cPurchasePriceFuture1TextController?.text = functions.formatNumberStringToStringMask(_model.cPurchasePriceFuture1TextController.text, FFAppConstants.USLocateNumber, FFAppConstants.USMaskNumber);
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
                                                                      .cPurchasePriceFuture1TextControllerValidator
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
                                              if (_model
                                                      .cPurchasePriceTypeValue ==
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
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child:
                                                                  FlutterFlowDropDown<
                                                                      int>(
                                                                controller: _model
                                                                        .cPurchaseSymbol2ValueController ??=
                                                                    FormFieldController<
                                                                        int>(
                                                                  _model
                                                                      .cPurchaseSymbol2Value ??= functions.isArrayNullOrEmpty(FFAppState()
                                                                          .ContractPurchase
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
                                                                          .ContractPurchase
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
                                                                      _model.cPurchaseSymbol2Value =
                                                                          val);
                                                                  await _model
                                                                      .savePriceInput(
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
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 6,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .cPurchasePriceBasis2TextController,
                                                                focusNode: _model
                                                                    .cPurchasePriceBasis2FocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.cPurchasePriceBasis2TextController',
                                                                  Duration(
                                                                      milliseconds:
                                                                          1000),
                                                                  () async {
                                                                    setState(
                                                                        () {
                                                                      _model.cPurchasePriceBasis2TextController?.text = functions.formatNumberStringToStringMask(
                                                                          _model
                                                                              .cPurchasePriceBasis2TextController
                                                                              .text,
                                                                          FFAppConstants
                                                                              .USLocateNumber,
                                                                          FFAppConstants
                                                                              .USMaskNumberDecimal);
                                                                    });
                                                                    setState(
                                                                        () {
                                                                      _model.cPurchaseSymbol2ValueController?.value = functions.contractSymbolToZero(
                                                                          _model
                                                                              .cPurchasePriceBasis2TextController
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
                                                                          .cPurchasePriceBasis2TextController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.cPurchasePriceBasis2TextController?.clear();
                                                                            setState(() {
                                                                              _model.cPurchasePriceBasis2TextController?.text = functions.formatNumberStringToStringMask(_model.cPurchasePriceBasis2TextController.text, FFAppConstants.USLocateNumber, FFAppConstants.USMaskNumberDecimal);
                                                                            });
                                                                            setState(() {
                                                                              _model.cPurchaseSymbol2ValueController?.value = functions.contractSymbolToZero(_model.cPurchasePriceBasis2TextController.text, FFAppConstants.USLocateNumber, FFAppConstants.USMaskNumberDecimal);
                                                                            });
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
                                                                validator: _model
                                                                    .cPurchasePriceBasis2TextControllerValidator
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
                                                                        .priceMonthValueController ??=
                                                                    FormFieldController<
                                                                        String>(
                                                                  _model
                                                                      .priceMonthValue ??= functions.isArrayNullOrEmpty(FFAppState()
                                                                          .ContractPurchase
                                                                          .priceSchedule
                                                                          .map((e) => e
                                                                              .toMap())
                                                                          .toList())
                                                                      ? FFAppState()
                                                                          .ContractPurchase
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
                                                                      _model.priceMonthValue =
                                                                          val);
                                                                  await _model
                                                                      .savePriceInput(
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
                                                                        .priceYearValueController ??=
                                                                    FormFieldController<
                                                                        int>(
                                                                  _model
                                                                      .priceYearValue ??= functions.isArrayNullOrEmpty(FFAppState()
                                                                          .ContractPurchase
                                                                          .priceSchedule
                                                                          .map((e) => e
                                                                              .toMap())
                                                                          .toList())
                                                                      ? FFAppState()
                                                                          .ContractPurchase
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
                                                                      _model.priceYearValue =
                                                                          val);
                                                                  await _model
                                                                      .savePriceInput(
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
                                                                .priceExchangeValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model
                                                              .priceExchangeValue ??= functions
                                                                  .isArrayNullOrEmpty(FFAppState()
                                                                      .ContractPurchase
                                                                      .priceSchedule
                                                                      .map((e) => e
                                                                          .toMap())
                                                                      .toList())
                                                              ? FFAppState()
                                                                  .ContractPurchase
                                                                  .priceSchedule
                                                                  .first
                                                                  .exchange
                                                              : FFAppConstants
                                                                  .NOTSELECTEDSTRING,
                                                        ),
                                                        options:
                                                            List<String>.from([
                                                          'Chicago futures trade market',
                                                          'Chicago Board of Trade'
                                                        ]),
                                                        optionLabels: [
                                                          'Chicago futures trade market',
                                                          'Chicago Board of Trade'
                                                        ],
                                                        onChanged: (val) async {
                                                          setState(() => _model
                                                                  .priceExchangeValue =
                                                              val);
                                                          await _model
                                                              .savePriceInput(
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
                                                                .logisticPaymentValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model
                                                              .logisticPaymentValue ??= functions
                                                                  .isArrayNullOrEmpty(FFAppState()
                                                                      .ContractPurchase
                                                                      .logisticSchedule
                                                                      .map((e) => e
                                                                          .toMap())
                                                                      .toList())
                                                              ? FFAppState()
                                                                  .ContractPurchase
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
                                                                  .logisticPaymentValue =
                                                              val);
                                                          await _model
                                                              .saveLogisticInput(
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
                                                                .logisticCoordinationValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model
                                                              .logisticCoordinationValue ??= functions
                                                                  .isArrayNullOrEmpty(FFAppState()
                                                                      .ContractPurchase
                                                                      .logisticSchedule
                                                                      .map((e) => e
                                                                          .toMap())
                                                                      .toList())
                                                              ? FFAppState()
                                                                  .ContractPurchase
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
                                                                  .logisticCoordinationValue =
                                                              val);
                                                          await _model
                                                              .saveLogisticInput(
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
                                                                .logisticTypeValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model
                                                              .logisticTypeValue ??= functions
                                                                  .isArrayNullOrEmpty(FFAppState()
                                                                      .ContractPurchase
                                                                      .logisticSchedule
                                                                      .map((e) => e
                                                                          .toMap())
                                                                      .toList())
                                                              ? FFAppState()
                                                                  .ContractPurchase
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
                                                                  .logisticTypeValue =
                                                              val);
                                                          await _model
                                                              .saveLogisticInput(
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
                                                                  .logisticMinTextController,
                                                              focusNode: _model
                                                                  .logisticMinFocusNode,
                                                              onChanged: (_) =>
                                                                  EasyDebounce
                                                                      .debounce(
                                                                '_model.logisticMinTextController',
                                                                Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                () async {
                                                                  setState(() {
                                                                    _model.logisticMinTextController?.text = functions.formatNumberStringToStringMask(
                                                                        _model
                                                                            .logisticMinTextController
                                                                            .text,
                                                                        FFAppConstants
                                                                            .USLocateNumber,
                                                                        FFAppConstants
                                                                            .USMaskNumberDecimal);
                                                                  });
                                                                },
                                                              ),
                                                              autofocus: true,
                                                              textCapitalization:
                                                                  TextCapitalization
                                                                      .none,
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
                                                                        .logisticMinTextController!
                                                                        .text
                                                                        .isNotEmpty
                                                                    ? InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          _model
                                                                              .logisticMinTextController
                                                                              ?.clear();
                                                                          setState(
                                                                              () {
                                                                            _model.logisticMinTextController?.text = functions.formatNumberStringToStringMask(
                                                                                _model.logisticMinTextController.text,
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
                                                                  .logisticMinTextControllerValidator
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
                                                                  .logisticMaxTextController,
                                                              focusNode: _model
                                                                  .logisticMaxFocusNode,
                                                              onChanged: (_) =>
                                                                  EasyDebounce
                                                                      .debounce(
                                                                '_model.logisticMaxTextController',
                                                                Duration(
                                                                    milliseconds:
                                                                        1000),
                                                                () async {
                                                                  setState(() {
                                                                    _model.logisticMaxTextController?.text = functions.formatNumberStringToStringMask(
                                                                        _model
                                                                            .logisticMaxTextController
                                                                            .text,
                                                                        FFAppConstants
                                                                            .USLocateNumber,
                                                                        FFAppConstants
                                                                            .USMaskNumberDecimal);
                                                                  });
                                                                },
                                                              ),
                                                              autofocus: true,
                                                              textCapitalization:
                                                                  TextCapitalization
                                                                      .none,
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
                                                                        .logisticMaxTextController!
                                                                        .text
                                                                        .isNotEmpty
                                                                    ? InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          _model
                                                                              .logisticMaxTextController
                                                                              ?.clear();
                                                                          setState(
                                                                              () {
                                                                            _model.logisticMaxTextController?.text = functions.formatNumberStringToStringMask(
                                                                                _model.logisticMaxTextController.text,
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
                                                                  .logisticMaxTextControllerValidator
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
                                                                    .shipmentDateFromTextController,
                                                                focusNode: _model
                                                                    .shipmentDateFromFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.shipmentDateFromTextController',
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
                                                                          .shipmentDateFromTextController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.shipmentDateFromTextController?.clear();
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
                                                                    .shipmentDateFromTextControllerValidator
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
                                                                          .shipmentDateFromTextController
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
                                                                      _model.shipmentDateFromTextController
                                                                              ?.text =
                                                                          dateTimeFormat(
                                                                        'dd/MM/yyyy',
                                                                        _model
                                                                            .datePicked2,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      );
                                                                      _model.shipmentDateFromTextController?.selection = TextSelection.collapsed(
                                                                          offset: _model
                                                                              .shipmentDateFromTextController!
                                                                              .text
                                                                              .length);
                                                                    });
                                                                  }),
                                                                  Future(
                                                                      () async {
                                                                    FFAppState()
                                                                        .updateContractPurchaseStruct(
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
                                                                    .shipmentDateToTextController,
                                                                focusNode: _model
                                                                    .shipmentDateToFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.shipmentDateToTextController',
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
                                                                          .shipmentDateToTextController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.shipmentDateToTextController?.clear();
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
                                                                    .shipmentDateToTextControllerValidator
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
                                                                          .shipmentDateToTextController
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
                                                                      _model.shipmentDateToTextController
                                                                              ?.text =
                                                                          dateTimeFormat(
                                                                        'dd/MM/yyyy',
                                                                        _model
                                                                            .datePicked3,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      );
                                                                      _model.shipmentDateToTextController?.selection = TextSelection.collapsed(
                                                                          offset: _model
                                                                              .shipmentDateToTextController!
                                                                              .text
                                                                              .length);
                                                                    });
                                                                  }),
                                                                  Future(
                                                                      () async {
                                                                    FFAppState()
                                                                        .updateContractPurchaseStruct(
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
                                                                .shipmentApplicationPrioValueController ??=
                                                            FormFieldController<
                                                                int>(
                                                          _model
                                                              .shipmentApplicationPrioValue ??= FFAppState()
                                                                      .ContractPurchase !=
                                                                  null
                                                              ? FFAppState()
                                                                  .ContractPurchase
                                                                  .applicationPriority
                                                              : 0,
                                                        ),
                                                        options:
                                                            List<int>.from([
                                                          1,
                                                          2,
                                                          3,
                                                          4,
                                                          5,
                                                          6,
                                                          7,
                                                          8,
                                                          9
                                                        ]),
                                                        optionLabels: [
                                                          '#1',
                                                          '#2',
                                                          '#3',
                                                          '#4',
                                                          '#5',
                                                          '#6',
                                                          '#7',
                                                          '#8',
                                                          '#9'
                                                        ],
                                                        onChanged: (val) async {
                                                          setState(() => _model
                                                                  .shipmentApplicationPrioValue =
                                                              val);
                                                          if (!FFAppState()
                                                              .ContractPurchaseMetadata
                                                              .incomplete) {
                                                            FFAppState()
                                                                .updateContractPurchaseStruct(
                                                              (e) => e
                                                                ..applicationPriority =
                                                                    _model
                                                                        .shipmentApplicationPrioValue,
                                                            );
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
                                                                .deliverLocationValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model
                                                              .deliverLocationValue ??= FFAppState()
                                                                      .ContractPurchase !=
                                                                  null
                                                              ? FFAppState()
                                                                  .ContractPurchase
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
                                                                  .deliverLocationValue =
                                                              val);
                                                          FFAppState()
                                                              .updateContractPurchaseStruct(
                                                            (e) => e
                                                              ..delivered = _model
                                                                  .deliverLocationValue,
                                                          );
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
                                                                      .deliverTransportValueController ??=
                                                                  FormFieldController<
                                                                      String>(
                                                                _model
                                                                    .deliverTransportValue ??= FFAppState()
                                                                            .ContractPurchase !=
                                                                        null
                                                                    ? FFAppState()
                                                                        .ContractPurchase
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
                                                                    _model.deliverTransportValue =
                                                                        val);
                                                                FFAppState()
                                                                    .updateContractPurchaseStruct(
                                                                  (e) => e
                                                                    ..transport =
                                                                        _model
                                                                            .deliverTransportValue,
                                                                );
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
                                                                      .deliverInspectionsValueController ??=
                                                                  FormFieldController<
                                                                      String>(
                                                                _model
                                                                    .deliverInspectionsValue ??= FFAppState()
                                                                            .ContractPurchase !=
                                                                        null
                                                                    ? FFAppState()
                                                                        .ContractPurchase
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
                                                                    _model.deliverInspectionsValue =
                                                                        val);
                                                                FFAppState()
                                                                    .updateContractPurchaseStruct(
                                                                  (e) => e
                                                                    ..inspections =
                                                                        _model
                                                                            .deliverInspectionsValue,
                                                                );
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
                                                                      .deliverProteinValueController ??=
                                                                  FormFieldController<
                                                                      String>(
                                                                _model
                                                                    .deliverProteinValue ??= FFAppState()
                                                                            .ContractPurchase !=
                                                                        null
                                                                    ? FFAppState()
                                                                        .ContractPurchase
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
                                                                    _model.deliverProteinValue =
                                                                        val);
                                                                FFAppState()
                                                                    .updateContractPurchaseStruct(
                                                                  (e) => e
                                                                    ..proteins =
                                                                        _model
                                                                            .deliverProteinValue,
                                                                );
                                                                setState(() {});
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
                                                                .deliverWeightValueController ??=
                                                            FormFieldController<
                                                                String>(
                                                          _model
                                                              .deliverWeightValue ??= FFAppState()
                                                                      .ContractPurchase !=
                                                                  null
                                                              ? FFAppState()
                                                                  .ContractPurchase
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
                                                                  .deliverWeightValue =
                                                              val);
                                                          FFAppState()
                                                              .updateContractPurchaseStruct(
                                                            (e) => e
                                                              ..weights = _model
                                                                  .deliverWeightValue,
                                                          );
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
                                                                      .remarkContactTextController,
                                                                  focusNode: _model
                                                                      .remarkContactFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.remarkContactTextController',
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
                                                                            .remarkContactTextController!
                                                                            .text
                                                                            .isNotEmpty
                                                                        ? InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              _model.remarkContactTextController?.clear();
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
                                                                      .remarkContactTextControllerValidator
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
                                                                                    _model.remarkContactTextController?.text = seletedItem;
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
                                                                                    _model.remarkContactTextController?.text = seletedItem;
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
                                                                      .remarksShipmentTextController,
                                                                  focusNode: _model
                                                                      .remarksShipmentFocusNode,
                                                                  onChanged: (_) =>
                                                                      EasyDebounce
                                                                          .debounce(
                                                                    '_model.remarksShipmentTextController',
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
                                                                            .remarksShipmentTextController!
                                                                            .text
                                                                            .isNotEmpty
                                                                        ? InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              _model.remarksShipmentTextController?.clear();
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
                                                                      .remarksShipmentTextControllerValidator
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
                                                                                    _model.remarksShipmentTextController?.text = seletedItem;
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
                                                                                    _model.remarksShipmentTextController?.text = seletedItem;
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
                                                                    .remarkRoutingTextController,
                                                                focusNode: _model
                                                                    .remarkRoutingFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.remarkRoutingTextController',
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
                                                                          .remarkRoutingTextController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.remarkRoutingTextController?.clear();
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
                                                                    .remarkRoutingTextControllerValidator
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
                                                                                  _model.remarkRoutingTextController?.text = seletedItem;
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
                                                                                  _model.remarkRoutingTextController?.text = seletedItem;
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
                                                                    .remarkPremDiscTextController,
                                                                focusNode: _model
                                                                    .remarkPremDiscFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.remarkPremDiscTextController',
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
                                                                          .remarkPremDiscTextController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.remarkPremDiscTextController?.clear();
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
                                                                    .remarkPremDiscTextControllerValidator
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
                                                                                  _model.remarkPremDiscTextController?.text = seletedItem;
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
                                                                                  _model.remarkPremDiscTextController?.text = seletedItem;
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
                                                                    .remarkTermsTextController,
                                                                focusNode: _model
                                                                    .remarkTermsFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.remarkTermsTextController',
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
                                                                          .remarkTermsTextController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.remarkTermsTextController?.clear();
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
                                                                    .remarkTermsTextControllerValidator
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
                                                                                  _model.remarkTermsTextController?.text = seletedItem;
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
                                                                                  _model.remarkTermsTextController?.text = seletedItem;
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
                                                                    .remarkRemarksTextController,
                                                                focusNode: _model
                                                                    .remarkRemarksFocusNode,
                                                                onChanged: (_) =>
                                                                    EasyDebounce
                                                                        .debounce(
                                                                  '_model.remarkRemarksTextController',
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
                                                                          .remarkRemarksTextController!
                                                                          .text
                                                                          .isNotEmpty
                                                                      ? InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            _model.remarkRemarksTextController?.clear();
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
                                                                    .remarkRemarksTextControllerValidator
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
                                                                                  _model.remarkRemarksTextController?.text = seletedItem;
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
                                                                                  _model.remarkRemarksTextController?.text = seletedItem;
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
                                                      .notesTextController,
                                                  focusNode:
                                                      _model.notesFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.notesTextController',
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
                                                            .notesTextController!
                                                            .text
                                                            .isNotEmpty
                                                        ? InkWell(
                                                            onTap: () async {
                                                              _model
                                                                  .notesTextController
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
                                                      .notesTextControllerValidator
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
                                                      // CleanAppState
                                                      FFAppState()
                                                              .ContractPurchase =
                                                          ContractSaleSchemaStruct();
                                                      FFAppState()
                                                              .ContractPurchaseMetadata =
                                                          ContractPurchaseMetadataStruct();
                                                      setState(() {
                                                        _model
                                                            .cPurchasePriceTypeValueController
                                                            ?.reset();
                                                        _model
                                                            .cPurchaseSubTypeValueController
                                                            ?.reset();
                                                        _model
                                                            .typeCommodityValueController
                                                            ?.reset();
                                                        _model
                                                            .typeGradeValueController
                                                            ?.reset();
                                                        _model
                                                            .typeUnitValueController
                                                            ?.reset();
                                                        _model
                                                            .priceMonthValueController
                                                            ?.reset();
                                                        _model
                                                            .priceCurrencyValueController
                                                            ?.reset();
                                                        _model
                                                            .priceYearValueController
                                                            ?.reset();
                                                        _model
                                                            .priceExchangeValueController
                                                            ?.reset();
                                                        _model
                                                            .logisticPaymentValueController
                                                            ?.reset();
                                                        _model
                                                            .logisticCoordinationValueController
                                                            ?.reset();
                                                        _model
                                                            .logisticTypeValueController
                                                            ?.reset();
                                                        _model
                                                            .shipmentApplicationPrioValueController
                                                            ?.reset();
                                                        _model
                                                            .deliverLocationValueController
                                                            ?.reset();
                                                        _model
                                                            .deliverTransportValueController
                                                            ?.reset();
                                                        _model
                                                            .deliverInspectionsValueController
                                                            ?.reset();
                                                        _model
                                                            .deliverProteinValueController
                                                            ?.reset();
                                                        _model
                                                            .deliverWeightValueController
                                                            ?.reset();
                                                      });
                                                      setState(() {
                                                        _model
                                                            .typeCustomerNameTextController
                                                            ?.text = functions.isArrayNullOrEmpty(
                                                                FFAppState()
                                                                    .ContractPurchase
                                                                    .participants
                                                                    .map((e) => e
                                                                        .toMap())
                                                                    .toList())
                                                            ? FFAppState()
                                                                .ContractPurchase
                                                                .participants
                                                                .first
                                                                .name
                                                            : FFAppConstants
                                                                .EMPTYSTRING;
                                                        _model
                                                            .typeContratDateTextController
                                                            ?.text = FFAppState()
                                                                    .ContractPurchase !=
                                                                null
                                                            ? functions.formatStringDateToUi(
                                                                FFAppState()
                                                                    .ContractPurchase
                                                                    .contractDate,
                                                                'dd/MM/yyyy')
                                                            : FFAppConstants
                                                                .EMPTYSTRING;
                                                        _model
                                                            .typeQuantityTextController
                                                            ?.text = FFAppState()
                                                                    .ContractPurchase !=
                                                                null
                                                            ? functions.formatNumberDoubleToStringMask(
                                                                FFAppState()
                                                                    .ContractPurchase
                                                                    .quantity
                                                                    .toDouble(),
                                                                FFAppConstants
                                                                    .USLocateNumber,
                                                                FFAppConstants
                                                                    .USMaskNumber)!
                                                            : FFAppConstants
                                                                .EMPTYSTRING;
                                                        _model
                                                            .cPurchasePriceBasis1TextController
                                                            ?.text = functions
                                                                .isArrayNullOrEmpty(FFAppState()
                                                                    .ContractPurchase
                                                                    .priceSchedule
                                                                    .map((e) => e
                                                                        .toMap())
                                                                    .toList())
                                                            ? (FFAppState()
                                                                        .ContractPurchase
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
                                                                            .ContractPurchase
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
                                                            .cPurchasePriceFuture1TextController
                                                            ?.text = functions
                                                                .isArrayNullOrEmpty(FFAppState()
                                                                    .ContractPurchase
                                                                    .priceSchedule
                                                                    .map((e) => e
                                                                        .toMap())
                                                                    .toList())
                                                            ? functions.formatNumberDoubleToStringMask(
                                                                FFAppState()
                                                                    .ContractPurchase
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
                                                            .cPurchasePricePrice1TextController
                                                            ?.text = functions
                                                                .isArrayNullOrEmpty(FFAppState()
                                                                    .ContractPurchase
                                                                    .priceSchedule
                                                                    .map((e) => e
                                                                        .toMap())
                                                                    .toList())
                                                            ? functions.formatNumberDoubleToStringMask(
                                                                FFAppState()
                                                                    .ContractPurchase
                                                                    .priceSchedule
                                                                    .first
                                                                    .price,
                                                                FFAppConstants
                                                                    .USLocateNumber,
                                                                FFAppConstants
                                                                    .USMaskNumberDecimal)!
                                                            : FFAppConstants
                                                                .EMPTYSTRING;
                                                        _model
                                                            .logisticMinTextController
                                                            ?.text = functions
                                                                .isArrayNullOrEmpty(FFAppState()
                                                                    .ContractPurchase
                                                                    .logisticSchedule
                                                                    .map((e) => e
                                                                        .toMap())
                                                                    .toList())
                                                            ? functions.formatNumberDoubleToStringMask(
                                                                FFAppState()
                                                                    .ContractPurchase
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
                                                            .logisticMaxTextController
                                                            ?.text = functions
                                                                .isArrayNullOrEmpty(FFAppState()
                                                                    .ContractPurchase
                                                                    .logisticSchedule
                                                                    .map((e) => e
                                                                        .toMap())
                                                                    .toList())
                                                            ? functions.formatNumberDoubleToStringMask(
                                                                FFAppState()
                                                                    .ContractPurchase
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
                                                            .shipmentDateFromTextController
                                                            ?.text = FFAppState()
                                                                    .ContractPurchase !=
                                                                null
                                                            ? functions.formatStringDateToUi(
                                                                FFAppState()
                                                                    .ContractPurchase
                                                                    .shippingStartDate,
                                                                'dd/MM/yyyy')
                                                            : FFAppConstants
                                                                .EMPTYSTRING;
                                                        _model
                                                            .shipmentDateToTextController
                                                            ?.text = FFAppState()
                                                                    .ContractPurchase !=
                                                                null
                                                            ? functions.formatStringDateToUi(
                                                                FFAppState()
                                                                    .ContractPurchase
                                                                    .shippingEndDate,
                                                                'dd/MM/yyyy')
                                                            : FFAppConstants
                                                                .EMPTYSTRING;
                                                        _model.remarkContactTextController
                                                                ?.text =
                                                            functions.findRemarkInList(
                                                                FFAppState()
                                                                    .ContractPurchase
                                                                    .remarks
                                                                    .toList(),
                                                                'contact');
                                                        _model.remarksShipmentTextController
                                                                ?.text =
                                                            functions.findRemarkInList(
                                                                FFAppState()
                                                                    .ContractPurchase
                                                                    .remarks
                                                                    .toList(),
                                                                'shipment');
                                                        _model.remarkRoutingTextController
                                                                ?.text =
                                                            functions.findRemarkInList(
                                                                FFAppState()
                                                                    .ContractPurchase
                                                                    .remarks
                                                                    .toList(),
                                                                'routing');
                                                        _model.remarkPremDiscTextController
                                                                ?.text =
                                                            functions.findRemarkInList(
                                                                FFAppState()
                                                                    .ContractPurchase
                                                                    .remarks
                                                                    .toList(),
                                                                'premDisc');
                                                        _model.remarkTermsTextController
                                                                ?.text =
                                                            functions.findRemarkInList(
                                                                FFAppState()
                                                                    .ContractPurchase
                                                                    .remarks
                                                                    .toList(),
                                                                'terms');
                                                        _model.remarkRemarksTextController
                                                                ?.text =
                                                            functions.findRemarkInList(
                                                                FFAppState()
                                                                    .ContractPurchase
                                                                    .remarks
                                                                    .toList(),
                                                                'remarks');
                                                        _model
                                                            .notesTextController
                                                            ?.text = (FFAppState()
                                                                    .ContractPurchase
                                                                    .notes
                                                                    .isNotEmpty) ==
                                                                true
                                                            ? FFAppState()
                                                                .ContractPurchase
                                                                .notes
                                                                .first
                                                                .text
                                                            : ' ';
                                                      });
                                                      // UpdateAppState
                                                      FFAppState()
                                                          .updateContractPurchaseMetadataStruct(
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
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onDoubleTap: () async {
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
                                                            .cPurchasePriceTypeValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .cPurchaseSubTypeValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .typeCommodityValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model.typeGradeValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model.typeUnitValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .priceCurrencyValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .priceMonthValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model.priceYearValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .priceExchangeValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .logisticPaymentValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .logisticCoordinationValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .logisticTypeValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .shipmentApplicationPrioValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .deliverLocationValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .deliverTransportValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .deliverInspectionsValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .deliverProteinValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (_model
                                                            .deliverWeightValue ==
                                                        null) {
                                                      return;
                                                    }
                                                    if (functions.checkMinMax(
                                                        FFAppState()
                                                            .ContractPurchase
                                                            .logisticSchedule
                                                            .first
                                                            .freightCost
                                                            .min,
                                                        FFAppState()
                                                            .ContractPurchase
                                                            .logisticSchedule
                                                            .first
                                                            .freightCost
                                                            .max)) {
                                                      if (functions.checkDatesFromTo(
                                                          functions
                                                              .formatStringToDatetime(
                                                                  _model
                                                                      .shipmentDateFromTextController
                                                                      .text,
                                                                  'dd/MM/yyyy'),
                                                          functions.formatStringToDatetime(
                                                              _model
                                                                  .shipmentDateToTextController
                                                                  .text,
                                                              'dd/MM/yyyy'))) {
                                                        await Future.wait([
                                                          Future(() async {
                                                            // UpdateContractSaleRoot
                                                            FFAppState()
                                                                .updateContractPurchaseStruct(
                                                              (e) => e
                                                                ..type =
                                                                    CtrTypeEnum
                                                                        .purchase
                                                                        .name
                                                                ..subType = _model
                                                                    .cPurchaseSubTypeValue
                                                                ..grade = _model
                                                                    .typeGradeValue
                                                                ..measurementUnit =
                                                                    _model
                                                                        .typeUnitValue
                                                                ..delivered = _model
                                                                    .deliverLocationValue
                                                                ..transport = _model
                                                                    .deliverTransportValue
                                                                ..weights = _model
                                                                    .deliverWeightValue
                                                                ..inspections =
                                                                    _model
                                                                        .deliverInspectionsValue
                                                                ..proteins = _model
                                                                    .deliverProteinValue
                                                                ..applicationPriority =
                                                                    _model
                                                                        .shipmentApplicationPrioValue
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
                                                            // CleanCommodityObject
                                                            FFAppState()
                                                                .updateContractPurchaseStruct(
                                                              (e) => e
                                                                ..commodity =
                                                                    null,
                                                            );
                                                            // UpdateComodityObject
                                                            FFAppState()
                                                                .updateContractPurchaseStruct(
                                                              (e) => e
                                                                ..commodity =
                                                                    CtrCommoditySchemaStruct(
                                                                  commodityId:
                                                                      _model
                                                                          .typeCommodityValue,
                                                                  name: functions.findCommodityInList(
                                                                      FFAppState()
                                                                          .Commodities
                                                                          .toList(),
                                                                      _model
                                                                          .typeCommodityValue!),
                                                                ),
                                                            );
                                                          }),
                                                        ]);
                                                        _model.apiResultq0uCopyCopy =
                                                            await ContractsGroup
                                                                .createContractCall
                                                                .call(
                                                          idempotence: FFAppState()
                                                              .ContractPurchaseMetadata
                                                              .idempotence,
                                                          dataBodyJson:
                                                              FFAppState()
                                                                  .ContractPurchase
                                                                  .toMap(),
                                                          partitionKey:
                                                              FFAppState()
                                                                  .partitionKey,
                                                          authToken:
                                                              currentAuthenticationToken,
                                                        );

                                                        _shouldSetState = true;
                                                        if ((_model
                                                                .apiResultq0uCopyCopy
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
                                                          // CleanContractAState
                                                          FFAppState()
                                                                  .ContractPurchase =
                                                              ContractSaleSchemaStruct();
                                                          FFAppState()
                                                                  .ContractPurchaseMetadata =
                                                              ContractPurchaseMetadataStruct();
                                                          // UpdateAppState
                                                          FFAppState()
                                                              .updateContractPurchaseMetadataStruct(
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
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      var _shouldSetState =
                                                          false;
                                                      if (_model.formKey
                                                                  .currentState ==
                                                              null ||
                                                          !_model.formKey
                                                              .currentState!
                                                              .validate()) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .cPurchasePriceTypeValue ==
                                                          null) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .cPurchaseSubTypeValue ==
                                                          null) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .typeCommodityValue ==
                                                          null) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .typeGradeValue ==
                                                          null) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .typeUnitValue ==
                                                          null) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .priceCurrencyValue ==
                                                          null) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .priceMonthValue ==
                                                          null) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .priceYearValue ==
                                                          null) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .priceExchangeValue ==
                                                          null) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .logisticPaymentValue ==
                                                          null) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .logisticCoordinationValue ==
                                                          null) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .logisticTypeValue ==
                                                          null) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .shipmentApplicationPrioValue ==
                                                          null) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .deliverLocationValue ==
                                                          null) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .deliverTransportValue ==
                                                          null) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .deliverInspectionsValue ==
                                                          null) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .deliverProteinValue ==
                                                          null) {
                                                        return;
                                                      }
                                                      if (_model
                                                              .deliverWeightValue ==
                                                          null) {
                                                        return;
                                                      }
                                                      if (functions.checkMinMax(
                                                          FFAppState()
                                                              .ContractPurchase
                                                              .logisticSchedule
                                                              .first
                                                              .freightCost
                                                              .min,
                                                          FFAppState()
                                                              .ContractPurchase
                                                              .logisticSchedule
                                                              .first
                                                              .freightCost
                                                              .max)) {
                                                        if (functions.checkDatesFromTo(
                                                            functions.formatStringToDatetime(
                                                                _model
                                                                    .shipmentDateFromTextController
                                                                    .text,
                                                                'dd/MM/yyyy'),
                                                            functions.formatStringToDatetime(
                                                                _model
                                                                    .shipmentDateToTextController
                                                                    .text,
                                                                'dd/MM/yyyy'))) {
                                                          await Future.wait([
                                                            Future(() async {
                                                              // UpdateContractSaleRoot
                                                              FFAppState()
                                                                  .updateContractPurchaseStruct(
                                                                (e) => e
                                                                  ..type =
                                                                      CtrTypeEnum
                                                                          .purchase
                                                                          .name
                                                                  ..subType = _model
                                                                      .cPurchaseSubTypeValue
                                                                  ..grade = _model
                                                                      .typeGradeValue
                                                                  ..measurementUnit =
                                                                      _model
                                                                          .typeUnitValue
                                                                  ..delivered =
                                                                      _model
                                                                          .deliverLocationValue
                                                                  ..transport =
                                                                      _model
                                                                          .deliverTransportValue
                                                                  ..weights = _model
                                                                      .deliverWeightValue
                                                                  ..inspections =
                                                                      _model
                                                                          .deliverInspectionsValue
                                                                  ..proteins =
                                                                      _model
                                                                          .deliverProteinValue
                                                                  ..applicationPriority =
                                                                      _model
                                                                          .shipmentApplicationPrioValue
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
                                                              // CleanCommodityObject
                                                              FFAppState()
                                                                  .updateContractPurchaseStruct(
                                                                (e) => e
                                                                  ..commodity =
                                                                      null,
                                                              );
                                                              // UpdateComodityObject
                                                              FFAppState()
                                                                  .updateContractPurchaseStruct(
                                                                (e) => e
                                                                  ..commodity =
                                                                      CtrCommoditySchemaStruct(
                                                                    commodityId:
                                                                        _model
                                                                            .typeCommodityValue,
                                                                    name: functions.findCommodityInList(
                                                                        FFAppState()
                                                                            .Commodities
                                                                            .toList(),
                                                                        _model
                                                                            .typeCommodityValue!),
                                                                  ),
                                                              );
                                                              // AddParticipant
                                                              FFAppState()
                                                                  .updateContractPurchaseStruct(
                                                                (e) => e
                                                                  ..updateParticipants(
                                                                    (e) => e.add(
                                                                        CtrParticipantSchemaStruct(
                                                                      peopleId: FFAppState()
                                                                          .UserSession
                                                                          .id,
                                                                      name: FFAppState()
                                                                          .UserSession
                                                                          .firstName,
                                                                      role:
                                                                          'buyer',
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
                                                                .ContractPurchaseMetadata
                                                                .idempotence,
                                                            dataBodyJson:
                                                                FFAppState()
                                                                    .ContractPurchase
                                                                    .toMap(),
                                                            partitionKey:
                                                                FFAppState()
                                                                    .partitionKey,
                                                            authToken:
                                                                currentAuthenticationToken,
                                                          );

                                                          _shouldSetState =
                                                              true;
                                                          if ((_model
                                                                  .apiResultq0uCopy
                                                                  ?.succeeded ??
                                                              true)) {
                                                            ScaffoldMessenger
                                                                    .of(context)
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
                                                            // CleanContractAState
                                                            FFAppState()
                                                                    .ContractPurchase =
                                                                ContractSaleSchemaStruct();
                                                            FFAppState()
                                                                    .ContractPurchaseMetadata =
                                                                ContractPurchaseMetadataStruct();
                                                            // UpdateAppState
                                                            FFAppState()
                                                                .updateContractPurchaseMetadataStruct(
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
                                                            ScaffoldMessenger
                                                                    .of(context)
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
                                                              'Min value cannot be greater than Max',
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

                                                      if (_shouldSetState)
                                                        setState(() {});
                                                    },
                                                    text: 'Save',
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
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
