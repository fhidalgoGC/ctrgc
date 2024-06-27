import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_UserSession')) {
        try {
          final serializedData = prefs.getString('ff_UserSession') ?? '{}';
          _UserSession =
              UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_rememberMe')) {
        try {
          final serializedData = prefs.getString('ff_rememberMe') ?? '{}';
          _rememberMe =
              RememberMeStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _partitionKey = prefs.getString('ff_partitionKey') ?? _partitionKey;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_ContractPurchase')) {
        try {
          final serializedData = prefs.getString('ff_ContractPurchase') ?? '{}';
          _ContractPurchase = ContractSaleSchemaStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_ContractSaleData')) {
        try {
          final serializedData = prefs.getString('ff_ContractSaleData') ?? '{}';
          _ContractSaleData =
              ContractSalePurchaseSchemaStruct.fromSerializableMap(
                  jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_ContractSaleMetadata')) {
        try {
          final serializedData =
              prefs.getString('ff_ContractSaleMetadata') ?? '{}';
          _ContractSaleMetadata =
              ContractSaleMetadataStruct.fromSerializableMap(
                  jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_ContractPurchaseMetadata')) {
        try {
          final serializedData =
              prefs.getString('ff_ContractPurchaseMetadata') ?? '{}';
          _ContractPurchaseMetadata =
              ContractPurchaseMetadataStruct.fromSerializableMap(
                  jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_ENVIROMENTS')) {
        try {
          final serializedData = prefs.getString('ff_ENVIROMENTS') ?? '{}';
          _ENVIROMENTS =
              EnviromentsStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _Commodities = prefs
              .getStringList('ff_Commodities')
              ?.map((x) {
                try {
                  return CommoditiesStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Commodities;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  UserStruct _UserSession = UserStruct.fromSerializableMap(jsonDecode('{}'));
  UserStruct get UserSession => _UserSession;
  set UserSession(UserStruct value) {
    _UserSession = value;
    prefs.setString('ff_UserSession', value.serialize());
  }

  void updateUserSessionStruct(Function(UserStruct) updateFn) {
    updateFn(_UserSession);
    prefs.setString('ff_UserSession', _UserSession.serialize());
  }

  RememberMeStruct _rememberMe = RememberMeStruct();
  RememberMeStruct get rememberMe => _rememberMe;
  set rememberMe(RememberMeStruct value) {
    _rememberMe = value;
    prefs.setString('ff_rememberMe', value.serialize());
  }

  void updateRememberMeStruct(Function(RememberMeStruct) updateFn) {
    updateFn(_rememberMe);
    prefs.setString('ff_rememberMe', _rememberMe.serialize());
  }

  String _partitionKey = '65242e39c5c836f89ecb3356';
  String get partitionKey => _partitionKey;
  set partitionKey(String value) {
    _partitionKey = value;
    prefs.setString('ff_partitionKey', value);
  }

  ContractSaleSchemaStruct _ContractPurchase = ContractSaleSchemaStruct();
  ContractSaleSchemaStruct get ContractPurchase => _ContractPurchase;
  set ContractPurchase(ContractSaleSchemaStruct value) {
    _ContractPurchase = value;
    prefs.setString('ff_ContractPurchase', value.serialize());
  }

  void updateContractPurchaseStruct(
      Function(ContractSaleSchemaStruct) updateFn) {
    updateFn(_ContractPurchase);
    prefs.setString('ff_ContractPurchase', _ContractPurchase.serialize());
  }

  PeopleCreateStruct _userCreateStage = PeopleCreateStruct();
  PeopleCreateStruct get userCreateStage => _userCreateStage;
  set userCreateStage(PeopleCreateStruct value) {
    _userCreateStage = value;
  }

  void updateUserCreateStageStruct(Function(PeopleCreateStruct) updateFn) {
    updateFn(_userCreateStage);
  }

  CreateSubContractSchemaStruct _createSubContractState =
      CreateSubContractSchemaStruct();
  CreateSubContractSchemaStruct get createSubContractState =>
      _createSubContractState;
  set createSubContractState(CreateSubContractSchemaStruct value) {
    _createSubContractState = value;
  }

  void updateCreateSubContractStateStruct(
      Function(CreateSubContractSchemaStruct) updateFn) {
    updateFn(_createSubContractState);
  }

  String _subContractId = '';
  String get subContractId => _subContractId;
  set subContractId(String value) {
    _subContractId = value;
  }

  ContractSalePurchaseSchemaStruct _ContractSaleData =
      ContractSalePurchaseSchemaStruct();
  ContractSalePurchaseSchemaStruct get ContractSaleData => _ContractSaleData;
  set ContractSaleData(ContractSalePurchaseSchemaStruct value) {
    _ContractSaleData = value;
    prefs.setString('ff_ContractSaleData', value.serialize());
  }

  void updateContractSaleDataStruct(
      Function(ContractSalePurchaseSchemaStruct) updateFn) {
    updateFn(_ContractSaleData);
    prefs.setString('ff_ContractSaleData', _ContractSaleData.serialize());
  }

  ContractSaleMetadataStruct _ContractSaleMetadata =
      ContractSaleMetadataStruct();
  ContractSaleMetadataStruct get ContractSaleMetadata => _ContractSaleMetadata;
  set ContractSaleMetadata(ContractSaleMetadataStruct value) {
    _ContractSaleMetadata = value;
    prefs.setString('ff_ContractSaleMetadata', value.serialize());
  }

  void updateContractSaleMetadataStruct(
      Function(ContractSaleMetadataStruct) updateFn) {
    updateFn(_ContractSaleMetadata);
    prefs.setString(
        'ff_ContractSaleMetadata', _ContractSaleMetadata.serialize());
  }

  ContractPurchaseMetadataStruct _ContractPurchaseMetadata =
      ContractPurchaseMetadataStruct();
  ContractPurchaseMetadataStruct get ContractPurchaseMetadata =>
      _ContractPurchaseMetadata;
  set ContractPurchaseMetadata(ContractPurchaseMetadataStruct value) {
    _ContractPurchaseMetadata = value;
    prefs.setString('ff_ContractPurchaseMetadata', value.serialize());
  }

  void updateContractPurchaseMetadataStruct(
      Function(ContractPurchaseMetadataStruct) updateFn) {
    updateFn(_ContractPurchaseMetadata);
    prefs.setString(
        'ff_ContractPurchaseMetadata', _ContractPurchaseMetadata.serialize());
  }

  EnviromentsStruct _ENVIROMENTS = EnviromentsStruct();
  EnviromentsStruct get ENVIROMENTS => _ENVIROMENTS;
  set ENVIROMENTS(EnviromentsStruct value) {
    _ENVIROMENTS = value;
    prefs.setString('ff_ENVIROMENTS', value.serialize());
  }

  void updateENVIROMENTSStruct(Function(EnviromentsStruct) updateFn) {
    updateFn(_ENVIROMENTS);
    prefs.setString('ff_ENVIROMENTS', _ENVIROMENTS.serialize());
  }

  List<CommoditiesStruct> _Commodities = [];
  List<CommoditiesStruct> get Commodities => _Commodities;
  set Commodities(List<CommoditiesStruct> value) {
    _Commodities = value;
    prefs.setStringList(
        'ff_Commodities', value.map((x) => x.serialize()).toList());
  }

  void addToCommodities(CommoditiesStruct value) {
    Commodities.add(value);
    prefs.setStringList(
        'ff_Commodities', _Commodities.map((x) => x.serialize()).toList());
  }

  void removeFromCommodities(CommoditiesStruct value) {
    Commodities.remove(value);
    prefs.setStringList(
        'ff_Commodities', _Commodities.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCommodities(int index) {
    Commodities.removeAt(index);
    prefs.setStringList(
        'ff_Commodities', _Commodities.map((x) => x.serialize()).toList());
  }

  void updateCommoditiesAtIndex(
    int index,
    CommoditiesStruct Function(CommoditiesStruct) updateFn,
  ) {
    Commodities[index] = updateFn(_Commodities[index]);
    prefs.setStringList(
        'ff_Commodities', _Commodities.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCommodities(int index, CommoditiesStruct value) {
    Commodities.insert(index, value);
    prefs.setStringList(
        'ff_Commodities', _Commodities.map((x) => x.serialize()).toList());
  }

  SettledSubContractStruct _SettledSubContractState =
      SettledSubContractStruct();
  SettledSubContractStruct get SettledSubContractState =>
      _SettledSubContractState;
  set SettledSubContractState(SettledSubContractStruct value) {
    _SettledSubContractState = value;
  }

  void updateSettledSubContractStateStruct(
      Function(SettledSubContractStruct) updateFn) {
    updateFn(_SettledSubContractState);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
