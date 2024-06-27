// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContractSaleMetadataStruct extends BaseStruct {
  ContractSaleMetadataStruct({
    bool? incomplete,
    String? idempotence,
    bool? loadAppState,
    Pages? backPage,
    bool? edit,
  })  : _incomplete = incomplete,
        _idempotence = idempotence,
        _loadAppState = loadAppState,
        _backPage = backPage,
        _edit = edit;

  // "incomplete" field.
  bool? _incomplete;
  bool get incomplete => _incomplete ?? false;
  set incomplete(bool? val) => _incomplete = val;

  bool hasIncomplete() => _incomplete != null;

  // "Idempotence" field.
  String? _idempotence;
  String get idempotence => _idempotence ?? '';
  set idempotence(String? val) => _idempotence = val;

  bool hasIdempotence() => _idempotence != null;

  // "loadAppState" field.
  bool? _loadAppState;
  bool get loadAppState => _loadAppState ?? false;
  set loadAppState(bool? val) => _loadAppState = val;

  bool hasLoadAppState() => _loadAppState != null;

  // "backPage" field.
  Pages? _backPage;
  Pages? get backPage => _backPage;
  set backPage(Pages? val) => _backPage = val;

  bool hasBackPage() => _backPage != null;

  // "edit" field.
  bool? _edit;
  bool get edit => _edit ?? false;
  set edit(bool? val) => _edit = val;

  bool hasEdit() => _edit != null;

  static ContractSaleMetadataStruct fromMap(Map<String, dynamic> data) =>
      ContractSaleMetadataStruct(
        incomplete: data['incomplete'] as bool?,
        idempotence: data['Idempotence'] as String?,
        loadAppState: data['loadAppState'] as bool?,
        backPage: deserializeEnum<Pages>(data['backPage']),
        edit: data['edit'] as bool?,
      );

  static ContractSaleMetadataStruct? maybeFromMap(dynamic data) => data is Map
      ? ContractSaleMetadataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'incomplete': _incomplete,
        'Idempotence': _idempotence,
        'loadAppState': _loadAppState,
        'backPage': _backPage?.serialize(),
        'edit': _edit,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'incomplete': serializeParam(
          _incomplete,
          ParamType.bool,
        ),
        'Idempotence': serializeParam(
          _idempotence,
          ParamType.String,
        ),
        'loadAppState': serializeParam(
          _loadAppState,
          ParamType.bool,
        ),
        'backPage': serializeParam(
          _backPage,
          ParamType.Enum,
        ),
        'edit': serializeParam(
          _edit,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ContractSaleMetadataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ContractSaleMetadataStruct(
        incomplete: deserializeParam(
          data['incomplete'],
          ParamType.bool,
          false,
        ),
        idempotence: deserializeParam(
          data['Idempotence'],
          ParamType.String,
          false,
        ),
        loadAppState: deserializeParam(
          data['loadAppState'],
          ParamType.bool,
          false,
        ),
        backPage: deserializeParam<Pages>(
          data['backPage'],
          ParamType.Enum,
          false,
        ),
        edit: deserializeParam(
          data['edit'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ContractSaleMetadataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContractSaleMetadataStruct &&
        incomplete == other.incomplete &&
        idempotence == other.idempotence &&
        loadAppState == other.loadAppState &&
        backPage == other.backPage &&
        edit == other.edit;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([incomplete, idempotence, loadAppState, backPage, edit]);
}

ContractSaleMetadataStruct createContractSaleMetadataStruct({
  bool? incomplete,
  String? idempotence,
  bool? loadAppState,
  Pages? backPage,
  bool? edit,
}) =>
    ContractSaleMetadataStruct(
      incomplete: incomplete,
      idempotence: idempotence,
      loadAppState: loadAppState,
      backPage: backPage,
      edit: edit,
    );
