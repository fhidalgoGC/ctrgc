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
import 'create_sale_contract_w_m_widget.dart' show CreateSaleContractWMWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateSaleContractWMModel
    extends FlutterFlowModel<CreateSaleContractWMWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (IdempotenceContract)] action in CreateSaleContractWM widget.
  ApiCallResponse? ctrIdepotenceApiResult;
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for CSalePriceType widget.
  String? cSalePriceTypeValue;
  FormFieldController<String>? cSalePriceTypeValueController;
  // State field(s) for CSaleTypeSubType widget.
  String? cSaleTypeSubTypeValue;
  FormFieldController<String>? cSaleTypeSubTypeValueController;
  // State field(s) for CSaleTypeCustomerName widget.
  FocusNode? cSaleTypeCustomerNameFocusNode;
  TextEditingController? cSaleTypeCustomerNameTextController;
  String? Function(BuildContext, String?)?
      cSaleTypeCustomerNameTextControllerValidator;
  String? _cSaleTypeCustomerNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return '2';
    }

    return null;
  }

  // Stores action output result for [Bottom Sheet - SelectPeopleBottom] action in SaleCustomerSearch widget.
  PeopleStruct? peopleSeletedToContract;
  // State field(s) for CSaleTypeContratDate widget.
  FocusNode? cSaleTypeContratDateFocusNode;
  TextEditingController? cSaleTypeContratDateTextController;
  String? Function(BuildContext, String?)?
      cSaleTypeContratDateTextControllerValidator;
  String? _cSaleTypeContratDateTextControllerValidator(
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
  // State field(s) for CSaleTypeCommodity widget.
  String? cSaleTypeCommodityValue;
  FormFieldController<String>? cSaleTypeCommodityValueController;
  // State field(s) for CSaleTypeGrade widget.
  int? cSaleTypeGradeValue;
  FormFieldController<int>? cSaleTypeGradeValueController;
  // State field(s) for CSaleTypeQuantity widget.
  FocusNode? cSaleTypeQuantityFocusNode;
  TextEditingController? cSaleTypeQuantityTextController;
  String? Function(BuildContext, String?)?
      cSaleTypeQuantityTextControllerValidator;
  String? _cSaleTypeQuantityTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return '0';
    }

    return null;
  }

  // State field(s) for CSaleTypeUnit widget.
  String? cSaleTypeUnitValue;
  FormFieldController<String>? cSaleTypeUnitValueController;
  // State field(s) for CSalePriceCurrency widget.
  String? cSalePriceCurrencyValue;
  FormFieldController<String>? cSalePriceCurrencyValueController;
  // State field(s) for CSalePricePrice1 widget.
  FocusNode? cSalePricePrice1FocusNode;
  TextEditingController? cSalePricePrice1TextController;
  String? Function(BuildContext, String?)?
      cSalePricePrice1TextControllerValidator;
  // State field(s) for CSaleSymbol1 widget.
  int? cSaleSymbol1Value;
  FormFieldController<int>? cSaleSymbol1ValueController;
  // State field(s) for CSalePriceBasis1 widget.
  FocusNode? cSalePriceBasis1FocusNode;
  TextEditingController? cSalePriceBasis1TextController;
  String? Function(BuildContext, String?)?
      cSalePriceBasis1TextControllerValidator;
  // State field(s) for CSalePriceFuture1 widget.
  FocusNode? cSalePriceFuture1FocusNode;
  TextEditingController? cSalePriceFuture1TextController;
  String? Function(BuildContext, String?)?
      cSalePriceFuture1TextControllerValidator;
  // State field(s) for CSaleSymbol2 widget.
  int? cSaleSymbol2Value;
  FormFieldController<int>? cSaleSymbol2ValueController;
  // State field(s) for CSalePriceBasis2 widget.
  FocusNode? cSalePriceBasis2FocusNode;
  TextEditingController? cSalePriceBasis2TextController;
  String? Function(BuildContext, String?)?
      cSalePriceBasis2TextControllerValidator;
  // State field(s) for CSalePriceMonth widget.
  String? cSalePriceMonthValue;
  FormFieldController<String>? cSalePriceMonthValueController;
  // State field(s) for CSalePriceYear widget.
  int? cSalePriceYearValue;
  FormFieldController<int>? cSalePriceYearValueController;
  // State field(s) for CSalePriceExchange widget.
  String? cSalePriceExchangeValue;
  FormFieldController<String>? cSalePriceExchangeValueController;
  // State field(s) for CSaleLogisticPayment widget.
  String? cSaleLogisticPaymentValue;
  FormFieldController<String>? cSaleLogisticPaymentValueController;
  // State field(s) for CSaleLogisticCoordination widget.
  String? cSaleLogisticCoordinationValue;
  FormFieldController<String>? cSaleLogisticCoordinationValueController;
  // State field(s) for CSaleLogisticType widget.
  String? cSaleLogisticTypeValue;
  FormFieldController<String>? cSaleLogisticTypeValueController;
  // State field(s) for CSaleLogisticMin widget.
  FocusNode? cSaleLogisticMinFocusNode;
  TextEditingController? cSaleLogisticMinTextController;
  String? Function(BuildContext, String?)?
      cSaleLogisticMinTextControllerValidator;
  String? _cSaleLogisticMinTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return '0';
    }

    return null;
  }

  // State field(s) for CSaleLogisticMax widget.
  FocusNode? cSaleLogisticMaxFocusNode;
  TextEditingController? cSaleLogisticMaxTextController;
  String? Function(BuildContext, String?)?
      cSaleLogisticMaxTextControllerValidator;
  String? _cSaleLogisticMaxTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 1) {
      return '0';
    }

    return null;
  }

  // State field(s) for CSaleShipmentDateFrom widget.
  FocusNode? cSaleShipmentDateFromFocusNode;
  TextEditingController? cSaleShipmentDateFromTextController;
  String? Function(BuildContext, String?)?
      cSaleShipmentDateFromTextControllerValidator;
  String? _cSaleShipmentDateFromTextControllerValidator(
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
  // State field(s) for CSaleShipmentDateTo widget.
  FocusNode? cSaleShipmentDateToFocusNode;
  TextEditingController? cSaleShipmentDateToTextController;
  String? Function(BuildContext, String?)?
      cSaleShipmentDateToTextControllerValidator;
  String? _cSaleShipmentDateToTextControllerValidator(
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
  // State field(s) for CSaleShipmentAPriority widget.
  int? cSaleShipmentAPriorityValue;
  FormFieldController<int>? cSaleShipmentAPriorityValueController;
  // State field(s) for CSaleDeliverLocation widget.
  String? cSaleDeliverLocationValue;
  FormFieldController<String>? cSaleDeliverLocationValueController;
  // State field(s) for CSaleDeliverTransport widget.
  String? cSaleDeliverTransportValue;
  FormFieldController<String>? cSaleDeliverTransportValueController;
  // State field(s) for CSaleDeliverInspections widget.
  String? cSaleDeliverInspectionsValue;
  FormFieldController<String>? cSaleDeliverInspectionsValueController;
  // State field(s) for CSaleDeliverProtein widget.
  String? cSaleDeliverProteinValue;
  FormFieldController<String>? cSaleDeliverProteinValueController;
  // State field(s) for CSaleDeliverWeight widget.
  String? cSaleDeliverWeightValue;
  FormFieldController<String>? cSaleDeliverWeightValueController;
  // State field(s) for CSaleRemarkContact widget.
  FocusNode? cSaleRemarkContactFocusNode;
  TextEditingController? cSaleRemarkContactTextController;
  String? Function(BuildContext, String?)?
      cSaleRemarkContactTextControllerValidator;
  // State field(s) for CSaleRemarksShipment widget.
  FocusNode? cSaleRemarksShipmentFocusNode;
  TextEditingController? cSaleRemarksShipmentTextController;
  String? Function(BuildContext, String?)?
      cSaleRemarksShipmentTextControllerValidator;
  // State field(s) for CSaleRemarkRouting widget.
  FocusNode? cSaleRemarkRoutingFocusNode;
  TextEditingController? cSaleRemarkRoutingTextController;
  String? Function(BuildContext, String?)?
      cSaleRemarkRoutingTextControllerValidator;
  // State field(s) for CSaleRemarkPremDisc widget.
  FocusNode? cSaleRemarkPremDiscFocusNode;
  TextEditingController? cSaleRemarkPremDiscTextController;
  String? Function(BuildContext, String?)?
      cSaleRemarkPremDiscTextControllerValidator;
  // State field(s) for CSaleRemarkTerms widget.
  FocusNode? cSaleRemarkTermsFocusNode;
  TextEditingController? cSaleRemarkTermsTextController;
  String? Function(BuildContext, String?)?
      cSaleRemarkTermsTextControllerValidator;
  // State field(s) for CSaleRemarkRemarks widget.
  FocusNode? cSaleRemarkRemarksFocusNode;
  TextEditingController? cSaleRemarkRemarksTextController;
  String? Function(BuildContext, String?)?
      cSaleRemarkRemarksTextControllerValidator;
  // State field(s) for CSaleNote widget.
  FocusNode? cSaleNoteFocusNode;
  TextEditingController? cSaleNoteTextController;
  String? Function(BuildContext, String?)? cSaleNoteTextControllerValidator;
  // Stores action output result for [Backend Call - API (CreateContract)] action in Button widget.
  ApiCallResponse? apiResultq0uCopy;

  @override
  void initState(BuildContext context) {
    sideNavModel = createModel(context, () => SideNavModel());
    cSaleTypeCustomerNameTextControllerValidator =
        _cSaleTypeCustomerNameTextControllerValidator;
    cSaleTypeContratDateTextControllerValidator =
        _cSaleTypeContratDateTextControllerValidator;
    cSaleTypeQuantityTextControllerValidator =
        _cSaleTypeQuantityTextControllerValidator;
    cSaleLogisticMinTextControllerValidator =
        _cSaleLogisticMinTextControllerValidator;
    cSaleLogisticMaxTextControllerValidator =
        _cSaleLogisticMaxTextControllerValidator;
    cSaleShipmentDateFromTextControllerValidator =
        _cSaleShipmentDateFromTextControllerValidator;
    cSaleShipmentDateToTextControllerValidator =
        _cSaleShipmentDateToTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    sideNavModel.dispose();
    cSaleTypeCustomerNameFocusNode?.dispose();
    cSaleTypeCustomerNameTextController?.dispose();

    cSaleTypeContratDateFocusNode?.dispose();
    cSaleTypeContratDateTextController?.dispose();

    cSaleTypeQuantityFocusNode?.dispose();
    cSaleTypeQuantityTextController?.dispose();

    cSalePricePrice1FocusNode?.dispose();
    cSalePricePrice1TextController?.dispose();

    cSalePriceBasis1FocusNode?.dispose();
    cSalePriceBasis1TextController?.dispose();

    cSalePriceFuture1FocusNode?.dispose();
    cSalePriceFuture1TextController?.dispose();

    cSalePriceBasis2FocusNode?.dispose();
    cSalePriceBasis2TextController?.dispose();

    cSaleLogisticMinFocusNode?.dispose();
    cSaleLogisticMinTextController?.dispose();

    cSaleLogisticMaxFocusNode?.dispose();
    cSaleLogisticMaxTextController?.dispose();

    cSaleShipmentDateFromFocusNode?.dispose();
    cSaleShipmentDateFromTextController?.dispose();

    cSaleShipmentDateToFocusNode?.dispose();
    cSaleShipmentDateToTextController?.dispose();

    cSaleRemarkContactFocusNode?.dispose();
    cSaleRemarkContactTextController?.dispose();

    cSaleRemarksShipmentFocusNode?.dispose();
    cSaleRemarksShipmentTextController?.dispose();

    cSaleRemarkRoutingFocusNode?.dispose();
    cSaleRemarkRoutingTextController?.dispose();

    cSaleRemarkPremDiscFocusNode?.dispose();
    cSaleRemarkPremDiscTextController?.dispose();

    cSaleRemarkTermsFocusNode?.dispose();
    cSaleRemarkTermsTextController?.dispose();

    cSaleRemarkRemarksFocusNode?.dispose();
    cSaleRemarkRemarksTextController?.dispose();

    cSaleNoteFocusNode?.dispose();
    cSaleNoteTextController?.dispose();
  }

  /// Action blocks.
  Future navigateBackContract(BuildContext context) async {
    await Future.wait([
      Future(() async {
        if (FFAppState().ContractSaleMetadata.backPage ==
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
        if (FFAppState().ContractSaleMetadata.backPage ==
            Pages.list_sale_contract) {
          context.goNamed('ListSaleContractsW');

          return;
        } else {
          return;
        }
      }),
    ]);
  }

  Future cleanSaleContract(BuildContext context) async {
    // CleanSubObjects
    FFAppState().updateContractSaleDataStruct(
      (e) => e
        ..commodity = null
        ..participants = []
        ..priceSchedule = []
        ..logisticSchedule = []
        ..remarks = []
        ..notes = [],
    );
    // Clean
    FFAppState().ContractSaleData = ContractSalePurchaseSchemaStruct();
  }

  Future cSaleSavePriceInput(BuildContext context) async {
    if (!FFAppState().ContractSaleMetadata.incomplete) {
      // CleanPriceScheduleInList
      FFAppState().updateContractSaleDataStruct(
        (e) => e..priceSchedule = [],
      );
      if (cSalePriceTypeValue == 'basis') {
        // AddFixedPriceScheduleInList
        FFAppState().updateContractSaleDataStruct(
          (e) => e
            ..updatePriceSchedule(
              (e) => e.add(CtrPriceScheduleSchemaStruct(
                pricingType: cSalePriceTypeValue,
                price: 0.0,
                basis: (double basis, int symbol) {
                  return basis != 0 ? basis * symbol : 0.0;
                }(
                    functions.parseStringWithMaskToDouble(
                        cSalePriceBasis2TextController.text,
                        FFAppConstants.USLocateNumber,
                        FFAppConstants.USMaskNumberDecimal),
                    cSaleSymbol2Value!),
                futurePrice: 0.0,
                basisOperation: CtrBasisOperationEnum.add.name,
                optionMonth: cSalePriceMonthValue,
                optionYear: cSalePriceYearValue,
                exchange: cSalePriceExchangeValue,
                paymentCurrency: cSalePriceCurrencyValue,
              )),
            ),
        );
      } else {
        // AddFixedPriceScheduleInList
        FFAppState().updateContractSaleDataStruct(
          (e) => e
            ..updatePriceSchedule(
              (e) => e.add(CtrPriceScheduleSchemaStruct(
                pricingType: cSalePriceTypeValue,
                price: functions.parseStringWithMaskToDouble(
                    cSalePricePrice1TextController.text,
                    FFAppConstants.USLocateNumber,
                    FFAppConstants.USMaskNumberDecimal),
                basis: (double basis, int symbol) {
                  return basis != 0 ? basis * symbol : 0.0;
                }(
                    functions.parseStringWithMaskToDouble(
                        cSalePriceBasis1TextController.text,
                        FFAppConstants.USLocateNumber,
                        FFAppConstants.USMaskNumberDecimal),
                    cSaleSymbol1Value!),
                futurePrice: functions.parseStringWithMaskToDouble(
                    cSalePriceFuture1TextController.text,
                    FFAppConstants.USLocateNumber,
                    FFAppConstants.USMaskNumberDecimal),
                basisOperation: CtrBasisOperationEnum.add.name,
                optionMonth: cSalePriceMonthValue,
                optionYear: cSalePriceYearValue,
                exchange: cSalePriceExchangeValue,
                paymentCurrency: cSalePriceCurrencyValue,
              )),
            ),
        );
      }
    }
  }

  Future cSaleSaveLogisticPrice(BuildContext context) async {
    if (!FFAppState().ContractSaleMetadata.incomplete) {
      // CleanLogististicpriceInList
      FFAppState().updateContractSaleDataStruct(
        (e) => e..logisticSchedule = [],
      );
      // AddLogisticPriceInList
      FFAppState().updateContractSaleDataStruct(
        (e) => e
          ..updateLogisticSchedule(
            (e) => e.add(CtrLogisticPriceSchemaStruct(
              logisticPaymentResponsability: cSaleLogisticPaymentValue,
              logisticCoordinationResponsability:
                  cSaleLogisticCoordinationValue,
              freightCost: CtrLgScheFreightCostSchemaStruct(
                type: cSaleLogisticTypeValue,
                min: functions.parseStringWithMaskToDouble(
                    cSaleLogisticMinTextController.text,
                    FFAppConstants.USLocateNumber,
                    FFAppConstants.USMaskNumberDecimal),
                max: functions.parseStringWithMaskToDouble(
                    cSaleLogisticMaxTextController.text,
                    FFAppConstants.USLocateNumber,
                    FFAppConstants.USMaskNumberDecimal),
              ),
              freightCostMeasurementUnit: cSaleTypeUnitValue,
              paymentCurrency: cSalePriceCurrencyValue,
            )),
          ),
      );
    }
  }

  Future cSaleSaveLogisticRemarks(BuildContext context) async {
    if (!FFAppState().ContractSaleMetadata.incomplete) {
      // CleanRemarksInList
      FFAppState().updateContractSaleDataStruct(
        (e) => e..remarks = [],
      );
      FFAppState().updateContractSaleDataStruct(
        (e) => e
          ..remarks = functions
              .ctrCreateRemarkInList(
                  cSaleRemarkContactTextController.text,
                  cSaleRemarksShipmentTextController.text,
                  cSaleRemarkRoutingTextController.text,
                  cSaleRemarkPremDiscTextController.text,
                  cSaleRemarkTermsTextController.text,
                  cSaleRemarkRemarksTextController.text)
              .toList(),
      );
    }
  }

  Future cSaleSaveRootFields(BuildContext context) async {
    if (!FFAppState().ContractSaleMetadata.incomplete) {
      FFAppState().updateContractSaleDataStruct(
        (e) => e
          ..subType = cSaleTypeSubTypeValue
          ..grade = cSaleTypeGradeValue
          ..quantity = functions.parseStringWithMaskToInteger(
              cSaleTypeQuantityTextController.text,
              FFAppConstants.USLocateNumber,
              FFAppConstants.USMaskNumber)
          ..measurementUnit = cSaleTypeUnitValue
          ..applicationPriority = cSaleShipmentAPriorityValue
          ..delivered = cSaleDeliverLocationValue
          ..transport = cSaleDeliverTransportValue
          ..proteins = cSaleDeliverProteinValue
          ..weights = cSaleDeliverWeightValue
          ..inspections = cSaleDeliverInspectionsValue,
      );
    }
  }
}
