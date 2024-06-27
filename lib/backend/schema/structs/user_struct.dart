// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? id,
    String? auth0Id,
    String? firstName,
    String? lastName,
    String? profilePicture,
    String? callingCode,
    String? phoneNumber,
    String? email,
    String? costumer,
    String? address,
  })  : _id = id,
        _auth0Id = auth0Id,
        _firstName = firstName,
        _lastName = lastName,
        _profilePicture = profilePicture,
        _callingCode = callingCode,
        _phoneNumber = phoneNumber,
        _email = email,
        _costumer = costumer,
        _address = address;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "auth0_id" field.
  String? _auth0Id;
  String get auth0Id => _auth0Id ?? '';
  set auth0Id(String? val) => _auth0Id = val;

  bool hasAuth0Id() => _auth0Id != null;

  // "firstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "profilePicture" field.
  String? _profilePicture;
  String get profilePicture => _profilePicture ?? '';
  set profilePicture(String? val) => _profilePicture = val;

  bool hasProfilePicture() => _profilePicture != null;

  // "callingCode" field.
  String? _callingCode;
  String get callingCode => _callingCode ?? '';
  set callingCode(String? val) => _callingCode = val;

  bool hasCallingCode() => _callingCode != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "costumer" field.
  String? _costumer;
  String get costumer => _costumer ?? '';
  set costumer(String? val) => _costumer = val;

  bool hasCostumer() => _costumer != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        id: data['id'] as String?,
        auth0Id: data['auth0_id'] as String?,
        firstName: data['firstName'] as String?,
        lastName: data['lastName'] as String?,
        profilePicture: data['profilePicture'] as String?,
        callingCode: data['callingCode'] as String?,
        phoneNumber: data['phoneNumber'] as String?,
        email: data['email'] as String?,
        costumer: data['costumer'] as String?,
        address: data['address'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'auth0_id': _auth0Id,
        'firstName': _firstName,
        'lastName': _lastName,
        'profilePicture': _profilePicture,
        'callingCode': _callingCode,
        'phoneNumber': _phoneNumber,
        'email': _email,
        'costumer': _costumer,
        'address': _address,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'auth0_id': serializeParam(
          _auth0Id,
          ParamType.String,
        ),
        'firstName': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'lastName': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'profilePicture': serializeParam(
          _profilePicture,
          ParamType.String,
        ),
        'callingCode': serializeParam(
          _callingCode,
          ParamType.String,
        ),
        'phoneNumber': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'costumer': serializeParam(
          _costumer,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        auth0Id: deserializeParam(
          data['auth0_id'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['firstName'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['lastName'],
          ParamType.String,
          false,
        ),
        profilePicture: deserializeParam(
          data['profilePicture'],
          ParamType.String,
          false,
        ),
        callingCode: deserializeParam(
          data['callingCode'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phoneNumber'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        costumer: deserializeParam(
          data['costumer'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        id == other.id &&
        auth0Id == other.auth0Id &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        profilePicture == other.profilePicture &&
        callingCode == other.callingCode &&
        phoneNumber == other.phoneNumber &&
        email == other.email &&
        costumer == other.costumer &&
        address == other.address;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        auth0Id,
        firstName,
        lastName,
        profilePicture,
        callingCode,
        phoneNumber,
        email,
        costumer,
        address
      ]);
}

UserStruct createUserStruct({
  String? id,
  String? auth0Id,
  String? firstName,
  String? lastName,
  String? profilePicture,
  String? callingCode,
  String? phoneNumber,
  String? email,
  String? costumer,
  String? address,
}) =>
    UserStruct(
      id: id,
      auth0Id: auth0Id,
      firstName: firstName,
      lastName: lastName,
      profilePicture: profilePicture,
      callingCode: callingCode,
      phoneNumber: phoneNumber,
      email: email,
      costumer: costumer,
      address: address,
    );
