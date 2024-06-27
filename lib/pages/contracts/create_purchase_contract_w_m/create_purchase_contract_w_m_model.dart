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
import 'create_purchase_contract_w_m_widget.dart'
    show CreatePurchaseContractWMWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreatePurchaseContractWMModel
    extends FlutterFlowModel<CreatePurchaseContractWMWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (IdempotenceContract)] action in CreatePurchaseContractWM widget.
  ApiCallResponse? ctrIdepotenceApiResult;
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for CPurchasePriceType widget.
  String? cPurchasePriceTypeValue;
  FormFieldController<String>? cPurchasePriceTypeValueController;
  // State field(s) for CPurchaseSubType widget.
  String? cPurchaseSubTypeValue;
  FormFieldController<String>? cPurchaseSubTypeValueController;
  // State field(s) for TypeCustomerName widget.
  FocusNode? typeCustomerNameFocusNode;
  TextEditingController? typeCustomerNameTextController;
  String? Function(BuildContext, String?)?
      typeCustomerNameTextControllerValidator;
  String? _typeCustomerNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return '2';
    }

    return null;
  }

  // Stores action output result for [Bottom Sheet - SelectPeopleBottom] action in Button widget.
  PeopleStruct? peopleSeletedToContract;
  // State field(s) for typeContratDate widget.
  FocusNode? typeContratDateFocusNode;
  TextEditingController? typeContratDateTextController;
  String? Function(BuildContext, String?)?
      typeContratDateTextControllerValidator;
  String? _typeContratDateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return '1';
    }

    return null;
  }

  DateTime? datePicked1;
  // State field(s) for TypeCommodity widget.
  String? typeCommodityValue;
  FormFieldController<String>? typeCommodityValueController;
  // State field(s) for TypeGrade widget.
  int? typeGradeValue;
  FormFieldController<int>? typeGradeValueController;
  // State field(s) for TypeQuantity widget.
  FocusNode? typeQuantityFocusNode;
  TextEditingController? typeQuantityTextController;
  String? Function(BuildContext, String?)? typeQuantityTextControllerValidator;
  String? _typeQuantityTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return '0';
    }

    return null;
  }

  // State field(s) for TypeUnit widget.
  String? typeUnitValue;
  FormFieldController<String>? typeUnitValueController;
  // State field(s) for price_currency widget.
  String? priceCurrencyValue;
  FormFieldController<String>? priceCurrencyValueController;
  // State field(s) for CPurchasePricePrice1 widget.
  FocusNode? cPurchasePricePrice1FocusNode;
  TextEditingController? cPurchasePricePrice1TextController;
  String? Function(BuildContext, String?)?
      cPurchasePricePrice1TextControllerValidator;
  // State field(s) for CPurchaseSymbol1 widget.
  int? cPurchaseSymbol1Value;
  FormFieldController<int>? cPurchaseSymbol1ValueController;
  // State field(s) for CPurchasePriceBasis1 widget.
  FocusNode? cPurchasePriceBasis1FocusNode;
  TextEditingController? cPurchasePriceBasis1TextController;
  String? Function(BuildContext, String?)?
      cPurchasePriceBasis1TextControllerValidator;
  // State field(s) for CPurchasePriceFuture1 widget.
  FocusNode? cPurchasePriceFuture1FocusNode;
  TextEditingController? cPurchasePriceFuture1TextController;
  String? Function(BuildContext, String?)?
      cPurchasePriceFuture1TextControllerValidator;
  // State field(s) for CPurchaseSymbol2 widget.
  int? cPurchaseSymbol2Value;
  FormFieldController<int>? cPurchaseSymbol2ValueController;
  // State field(s) for CPurchasePriceBasis2 widget.
  FocusNode? cPurchasePriceBasis2FocusNode;
  TextEditingController? cPurchasePriceBasis2TextController;
  String? Function(BuildContext, String?)?
      cPurchasePriceBasis2TextControllerValidator;
  // State field(s) for price_month widget.
  String? priceMonthValue;
  FormFieldController<String>? priceMonthValueController;
  // State field(s) for price_year widget.
  int? priceYearValue;
  FormFieldController<int>? priceYearValueController;
  // State field(s) for price_exchange widget.
  String? priceExchangeValue;
  FormFieldController<String>? priceExchangeValueController;
  // State field(s) for logisticPayment widget.
  String? logisticPaymentValue;
  FormFieldController<String>? logisticPaymentValueController;
  // State field(s) for logisticCoordination widget.
  String? logisticCoordinationValue;
  FormFieldController<String>? logisticCoordinationValueController;
  // State field(s) for logistic_type widget.
  String? logisticTypeValue;
  FormFieldController<String>? logisticTypeValueController;
  // State field(s) for logistic_min widget.
  FocusNode? logisticMinFocusNode;
  TextEditingController? logisticMinTextController;
  String? Function(BuildContext, String?)? logisticMinTextControllerValidator;
  String? _logisticMinTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return '0';
    }

    return null;
  }

  // State field(s) for logistic_max widget.
  FocusNode? logisticMaxFocusNode;
  TextEditingController? logisticMaxTextController;
  String? Function(BuildContext, String?)? logisticMaxTextControllerValidator;
  String? _logisticMaxTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return '0';
    }

    return null;
  }

  // State field(s) for shipment_dateFrom widget.
  FocusNode? shipmentDateFromFocusNode;
  TextEditingController? shipmentDateFromTextController;
  String? Function(BuildContext, String?)?
      shipmentDateFromTextControllerValidator;
  String? _shipmentDateFromTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return '1';
    }

    return null;
  }

  DateTime? datePicked2;
  // State field(s) for shipment_dateTo widget.
  FocusNode? shipmentDateToFocusNode;
  TextEditingController? shipmentDateToTextController;
  String? Function(BuildContext, String?)?
      shipmentDateToTextControllerValidator;
  String? _shipmentDateToTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return '1';
    }

    return null;
  }

  DateTime? datePicked3;
  // State field(s) for shipment_ApplicationPrio widget.
  int? shipmentApplicationPrioValue;
  FormFieldController<int>? shipmentApplicationPrioValueController;
  // State field(s) for deliver_location widget.
  String? deliverLocationValue;
  FormFieldController<String>? deliverLocationValueController;
  // State field(s) for deliver_transport widget.
  String? deliverTransportValue;
  FormFieldController<String>? deliverTransportValueController;
  // State field(s) for deliver_inspections widget.
  String? deliverInspectionsValue;
  FormFieldController<String>? deliverInspectionsValueController;
  // State field(s) for deliver_protein widget.
  String? deliverProteinValue;
  FormFieldController<String>? deliverProteinValueController;
  // State field(s) for deliver_weight widget.
  String? deliverWeightValue;
  FormFieldController<String>? deliverWeightValueController;
  // State field(s) for remarkContact widget.
  FocusNode? remarkContactFocusNode;
  TextEditingController? remarkContactTextController;
  String? Function(BuildContext, String?)? remarkContactTextControllerValidator;
  // State field(s) for remarksShipment widget.
  FocusNode? remarksShipmentFocusNode;
  TextEditingController? remarksShipmentTextController;
  String? Function(BuildContext, String?)?
      remarksShipmentTextControllerValidator;
  // State field(s) for remarkRouting widget.
  FocusNode? remarkRoutingFocusNode;
  TextEditingController? remarkRoutingTextController;
  String? Function(BuildContext, String?)? remarkRoutingTextControllerValidator;
  // State field(s) for remarkPremDisc widget.
  FocusNode? remarkPremDiscFocusNode;
  TextEditingController? remarkPremDiscTextController;
  String? Function(BuildContext, String?)?
      remarkPremDiscTextControllerValidator;
  // State field(s) for remarkTerms widget.
  FocusNode? remarkTermsFocusNode;
  TextEditingController? remarkTermsTextController;
  String? Function(BuildContext, String?)? remarkTermsTextControllerValidator;
  // State field(s) for remarkRemarks widget.
  FocusNode? remarkRemarksFocusNode;
  TextEditingController? remarkRemarksTextController;
  String? Function(BuildContext, String?)? remarkRemarksTextControllerValidator;
  // State field(s) for notes widget.
  FocusNode? notesFocusNode;
  TextEditingController? notesTextController;
  String? Function(BuildContext, String?)? notesTextControllerValidator;
  // Stores action output result for [Backend Call - API (CreateContract)] action in Button widget.
  ApiCallResponse? apiResultq0uCopy;
  // Stores action output result for [Backend Call - API (CreateContract)] action in Button widget.
  ApiCallResponse? apiResultq0uCopyCopy;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    typeCustomerNameTextControllerValidator =
        _typeCustomerNameTextControllerValidator;
    typeContratDateTextControllerValidator =
        _typeContratDateTextControllerValidator;
    typeQuantityTextControllerValidator = _typeQuantityTextControllerValidator;
    logisticMinTextControllerValidator = _logisticMinTextControllerValidator;
    logisticMaxTextControllerValidator = _logisticMaxTextControllerValidator;
    shipmentDateFromTextControllerValidator =
        _shipmentDateFromTextControllerValidator;
    shipmentDateToTextControllerValidator =
        _shipmentDateToTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    typeCustomerNameFocusNode?.dispose();
    typeCustomerNameTextController?.dispose();

    typeContratDateFocusNode?.dispose();
    typeContratDateTextController?.dispose();

    typeQuantityFocusNode?.dispose();
    typeQuantityTextController?.dispose();

    cPurchasePricePrice1FocusNode?.dispose();
    cPurchasePricePrice1TextController?.dispose();

    cPurchasePriceBasis1FocusNode?.dispose();
    cPurchasePriceBasis1TextController?.dispose();

    cPurchasePriceFuture1FocusNode?.dispose();
    cPurchasePriceFuture1TextController?.dispose();

    cPurchasePriceBasis2FocusNode?.dispose();
    cPurchasePriceBasis2TextController?.dispose();

    logisticMinFocusNode?.dispose();
    logisticMinTextController?.dispose();

    logisticMaxFocusNode?.dispose();
    logisticMaxTextController?.dispose();

    shipmentDateFromFocusNode?.dispose();
    shipmentDateFromTextController?.dispose();

    shipmentDateToFocusNode?.dispose();
    shipmentDateToTextController?.dispose();

    remarkContactFocusNode?.dispose();
    remarkContactTextController?.dispose();

    remarksShipmentFocusNode?.dispose();
    remarksShipmentTextController?.dispose();

    remarkRoutingFocusNode?.dispose();
    remarkRoutingTextController?.dispose();

    remarkPremDiscFocusNode?.dispose();
    remarkPremDiscTextController?.dispose();

    remarkTermsFocusNode?.dispose();
    remarkTermsTextController?.dispose();

    remarkRemarksFocusNode?.dispose();
    remarkRemarksTextController?.dispose();

    notesFocusNode?.dispose();
    notesTextController?.dispose();
  }

  /// Action blocks.
  Future navigateBackContract(BuildContext context) async {
    await Future.wait([
      Future(() async {
        if (FFAppState().ContractPurchaseMetadata.backPage ==
            Pages.detail_contract) {
          context.goNamed(
            'DetailContractWM',
            queryParameters: {
              'contractIdParam': serializeParam(
                widget.contractId,
                ParamType.String,
              ),
            }.withoutNulls,
          );

          return;
        } else {
          return;
        }
      }),
      Future(() async {
        if (FFAppState().ContractPurchaseMetadata.backPage ==
            Pages.list_purchase_contract) {
          context.goNamed('ListPurshaseContractsW');

          return;
        } else {
          return;
        }
      }),
    ]);
  }

  Future cleanPurchaseContract(BuildContext context) async {
    // CleanSubObjects
    FFAppState().updateContractPurchaseStruct(
      (e) => e
        ..participants = []
        ..priceSchedule = []
        ..logisticSchedule = []
        ..remarks = []
        ..notes = []
        ..commodity = null,
    );
    FFAppState().ContractPurchase = ContractSaleSchemaStruct();
  }

  Future saveLogisticInput(BuildContext context) async {
    if (!FFAppState().ContractPurchaseMetadata.incomplete) {
      // CleanLogististicpriceInList
      FFAppState().updateContractPurchaseStruct(
        (e) => e..logisticSchedule = [],
      );
      // AddLogisticPriceInList
      FFAppState().updateContractPurchaseStruct(
        (e) => e
          ..updateLogisticSchedule(
            (e) => e.add(CtrLogisticPriceSchemaStruct(
              logisticPaymentResponsability: logisticPaymentValue,
              logisticCoordinationResponsability: logisticCoordinationValue,
              freightCost: CtrLgScheFreightCostSchemaStruct(
                type: logisticTypeValue,
                min: functions.parseStringWithMaskToDouble(
                    logisticMinTextController.text,
                    FFAppConstants.USLocateNumber,
                    FFAppConstants.USMaskNumber),
                max: functions.parseStringWithMaskToDouble(
                    logisticMaxTextController.text,
                    FFAppConstants.USLocateNumber,
                    FFAppConstants.USMaskNumber),
              ),
              freightCostMeasurementUnit: typeUnitValue,
              paymentCurrency: priceCurrencyValue,
            )),
          ),
      );
    }
  }

  Future savePriceInput(BuildContext context) async {
    if (!FFAppState().ContractPurchaseMetadata.incomplete) {
      // CleanPriceScheduleInList
      FFAppState().updateContractPurchaseStruct(
        (e) => e..priceSchedule = [],
      );
      if (cPurchasePriceTypeValue == 'basis') {
        // AddBasisPriceScheduleInList
        FFAppState().updateContractPurchaseStruct(
          (e) => e
            ..updatePriceSchedule(
              (e) => e.add(CtrPriceScheduleSchemaStruct(
                pricingType: cPurchasePriceTypeValue,
                price: 0.0,
                basis: (double basis, int symbol) {
                  return basis != 0 ? basis * symbol : 0.0;
                }(
                    functions.parseStringWithMaskToDouble(
                        cPurchasePriceBasis2TextController.text,
                        FFAppConstants.USLocateNumber,
                        FFAppConstants.USMaskNumberDecimal),
                    cPurchaseSymbol2Value!),
                futurePrice: 0.0,
                basisOperation: CtrBasisOperationEnum.add.name,
                optionMonth: priceMonthValue,
                optionYear: priceYearValue,
                exchange: priceExchangeValue,
                paymentCurrency: priceCurrencyValue,
              )),
            ),
        );
      } else {
        // AddFixedPriceScheduleInList
        FFAppState().updateContractPurchaseStruct(
          (e) => e
            ..updatePriceSchedule(
              (e) => e.add(CtrPriceScheduleSchemaStruct(
                pricingType: cPurchasePriceTypeValue,
                price: functions.parseStringWithMaskToDouble(
                    cPurchasePricePrice1TextController.text,
                    FFAppConstants.USLocateNumber,
                    FFAppConstants.USMaskNumberDecimal),
                basis: (double basis, int symbol) {
                  return basis != 0 ? basis * symbol : 0.0;
                }(
                    functions.parseStringWithMaskToDouble(
                        cPurchasePriceBasis1TextController.text,
                        FFAppConstants.USLocateNumber,
                        FFAppConstants.USMaskNumberDecimal),
                    cPurchaseSymbol1Value!),
                futurePrice: functions.parseStringWithMaskToDouble(
                    cPurchasePriceFuture1TextController.text,
                    FFAppConstants.USLocateNumber,
                    FFAppConstants.USMaskNumberDecimal),
                basisOperation: CtrBasisOperationEnum.add.name,
                optionMonth: priceMonthValue,
                optionYear: priceYearValue,
                exchange: priceExchangeValue,
                paymentCurrency: priceCurrencyValue,
              )),
            ),
        );
      }
    }
  }
}
