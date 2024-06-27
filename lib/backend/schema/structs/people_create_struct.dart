// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PeopleCreateStruct extends BaseStruct {
  PeopleCreateStruct({
    String? idempotenceId,
    String? name,
    String? lastName,
    String? fullName,
    String? role,
    String? email,
    String? callingCode,
    String? phoneNumber,
    String? countryId,
    String? country,
    String? stateId,
    String? state,
    String? cityId,
    String? city,
    String? countrySlug,
    String? addressLine1,
  })  : _idempotenceId = idempotenceId,
        _name = name,
        _lastName = lastName,
        _fullName = fullName,
        _role = role,
        _email = email,
        _callingCode = callingCode,
        _phoneNumber = phoneNumber,
        _countryId = countryId,
        _country = country,
        _stateId = stateId,
        _state = state,
        _cityId = cityId,
        _city = city,
        _countrySlug = countrySlug,
        _addressLine1 = addressLine1;

  // "idempotenceId" field.
  String? _idempotenceId;
  String get idempotenceId => _idempotenceId ?? '';
  set idempotenceId(String? val) => _idempotenceId = val;

  bool hasIdempotenceId() => _idempotenceId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "lastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;

  bool hasFullName() => _fullName != null;

  // "role" field.
  String? _role;
  String get role => _role ?? 'seller';
  set role(String? val) => _role = val;

  bool hasRole() => _role != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

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

  // "country_id" field.
  String? _countryId;
  String get countryId => _countryId ?? '';
  set countryId(String? val) => _countryId = val;

  bool hasCountryId() => _countryId != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  // "state_id" field.
  String? _stateId;
  String get stateId => _stateId ?? '';
  set stateId(String? val) => _stateId = val;

  bool hasStateId() => _stateId != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;

  bool hasState() => _state != null;

  // "city_id" field.
  String? _cityId;
  String get cityId => _cityId ?? '';
  set cityId(String? val) => _cityId = val;

  bool hasCityId() => _cityId != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "country_slug" field.
  String? _countrySlug;
  String get countrySlug => _countrySlug ?? '';
  set countrySlug(String? val) => _countrySlug = val;

  bool hasCountrySlug() => _countrySlug != null;

  // "addressLine1" field.
  String? _addressLine1;
  String get addressLine1 => _addressLine1 ?? '';
  set addressLine1(String? val) => _addressLine1 = val;

  bool hasAddressLine1() => _addressLine1 != null;

  static PeopleCreateStruct fromMap(Map<String, dynamic> data) =>
      PeopleCreateStruct(
        idempotenceId: data['idempotenceId'] as String?,
        name: data['name'] as String?,
        lastName: data['lastName'] as String?,
        fullName: data['full_name'] as String?,
        role: data['role'] as String?,
        email: data['email'] as String?,
        callingCode: data['callingCode'] as String?,
        phoneNumber: data['phoneNumber'] as String?,
        countryId: data['country_id'] as String?,
        country: data['country'] as String?,
        stateId: data['state_id'] as String?,
        state: data['state'] as String?,
        cityId: data['city_id'] as String?,
        city: data['city'] as String?,
        countrySlug: data['country_slug'] as String?,
        addressLine1: data['addressLine1'] as String?,
      );

  static PeopleCreateStruct? maybeFromMap(dynamic data) => data is Map
      ? PeopleCreateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'idempotenceId': _idempotenceId,
        'name': _name,
        'lastName': _lastName,
        'full_name': _fullName,
        'role': _role,
        'email': _email,
        'callingCode': _callingCode,
        'phoneNumber': _phoneNumber,
        'country_id': _countryId,
        'country': _country,
        'state_id': _stateId,
        'state': _state,
        'city_id': _cityId,
        'city': _city,
        'country_slug': _countrySlug,
        'addressLine1': _addressLine1,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'idempotenceId': serializeParam(
          _idempotenceId,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'lastName': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'full_name': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
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
        'country_id': serializeParam(
          _countryId,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'state_id': serializeParam(
          _stateId,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'city_id': serializeParam(
          _cityId,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'country_slug': serializeParam(
          _countrySlug,
          ParamType.String,
        ),
        'addressLine1': serializeParam(
          _addressLine1,
          ParamType.String,
        ),
      }.withoutNulls;

  static PeopleCreateStruct fromSerializableMap(Map<String, dynamic> data) =>
      PeopleCreateStruct(
        idempotenceId: deserializeParam(
          data['idempotenceId'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['lastName'],
          ParamType.String,
          false,
        ),
        fullName: deserializeParam(
          data['full_name'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
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
        countryId: deserializeParam(
          data['country_id'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        stateId: deserializeParam(
          data['state_id'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        cityId: deserializeParam(
          data['city_id'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        countrySlug: deserializeParam(
          data['country_slug'],
          ParamType.String,
          false,
        ),
        addressLine1: deserializeParam(
          data['addressLine1'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PeopleCreateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PeopleCreateStruct &&
        idempotenceId == other.idempotenceId &&
        name == other.name &&
        lastName == other.lastName &&
        fullName == other.fullName &&
        role == other.role &&
        email == other.email &&
        callingCode == other.callingCode &&
        phoneNumber == other.phoneNumber &&
        countryId == other.countryId &&
        country == other.country &&
        stateId == other.stateId &&
        state == other.state &&
        cityId == other.cityId &&
        city == other.city &&
        countrySlug == other.countrySlug &&
        addressLine1 == other.addressLine1;
  }

  @override
  int get hashCode => const ListEquality().hash([
        idempotenceId,
        name,
        lastName,
        fullName,
        role,
        email,
        callingCode,
        phoneNumber,
        countryId,
        country,
        stateId,
        state,
        cityId,
        city,
        countrySlug,
        addressLine1
      ]);
}

PeopleCreateStruct createPeopleCreateStruct({
  String? idempotenceId,
  String? name,
  String? lastName,
  String? fullName,
  String? role,
  String? email,
  String? callingCode,
  String? phoneNumber,
  String? countryId,
  String? country,
  String? stateId,
  String? state,
  String? cityId,
  String? city,
  String? countrySlug,
  String? addressLine1,
}) =>
    PeopleCreateStruct(
      idempotenceId: idempotenceId,
      name: name,
      lastName: lastName,
      fullName: fullName,
      role: role,
      email: email,
      callingCode: callingCode,
      phoneNumber: phoneNumber,
      countryId: countryId,
      country: country,
      stateId: stateId,
      state: state,
      cityId: cityId,
      city: city,
      countrySlug: countrySlug,
      addressLine1: addressLine1,
    );
