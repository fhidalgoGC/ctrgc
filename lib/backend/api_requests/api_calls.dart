import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';
import 'interceptors.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Grainchain Identity Group Code

class GrainchainIdentityGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://q745qbsif9.execute-api.us-west-2.amazonaws.com/prod';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [auth_token]',
  };
  static CustomerProfileCall customerProfileCall = CustomerProfileCall();
}

class CustomerProfileCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = GrainchainIdentityGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CustomerProfile ',
      apiUrl: '${baseUrl}/identity/customers',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.firstName''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.lastName''',
      ));
  String? profilePicture(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.profilePicture''',
      ));
  String? callingCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.phone[:].callingCode''',
      ));
  String? phoneNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.phone[:].phoneNumber''',
      ));
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.id''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.email''',
      ));
  String? auth0Id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.auth0''',
      ));
}

/// End Grainchain Identity Group Code

/// Start CRM People Group Code

class CRMPeopleGroup {
  static String getBaseUrl({
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken = '',
  }) =>
      'https://crm-prod.grainchain.io/api/v1/';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [auth_token]',
  };
  static PeopleCall peopleCall = PeopleCall();
  static PeopleTwoCall peopleTwoCall = PeopleTwoCall();
  static IdempotencePeopleCall idempotencePeopleCall = IdempotencePeopleCall();
  static CreatePeopleCall createPeopleCall = CreatePeopleCall();
  static PeopleByIdCall peopleByIdCall = PeopleByIdCall();
}

class PeopleCall {
  Future<ApiCallResponse> call({
    String? role = '',
    String? all = 'true',
    int? page,
    int? limit,
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken = '',
  }) async {
    final baseUrl = CRMPeopleGroup.getBaseUrl(
      partitionKey: partitionKey,
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'People',
      apiUrl: '${baseUrl}crm-people/people',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'filter':
            "{\"_partitionKey\":\"${partitionKey}\",\"roles.slug\":\"${role}\"}",
        'all': all,
        'page': page,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? pageSize(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$._meta.page_size''',
      ));
  int? pageNumber(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$._meta.page_number''',
      ));
  int? totalElements(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$._meta.total_elements''',
      ));
  int? totalPages(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$._meta.total_pages''',
      ));
  List? peopleList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class PeopleTwoCall {
  Future<ApiCallResponse> call({
    String? role = '',
    String? all = 'true',
    int? page,
    int? limit,
    String? filterValue = '',
    int? order = 1,
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken = '',
  }) async {
    final baseUrl = CRMPeopleGroup.getBaseUrl(
      partitionKey: partitionKey,
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'PeopleTwo',
      apiUrl: '${baseUrl}crm-people/people',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'filter': "${filterValue}",
        'all': all,
        'page': page,
        'limit': limit,
        'sort[first_name]': order,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? pageSize(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$._meta.page_size''',
      ));
  int? pageNumber(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$._meta.page_number''',
      ));
  int? totalElements(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$._meta.total_elements''',
      ));
  int? totalPages(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$._meta.total_pages''',
      ));
  List? peopleList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class IdempotencePeopleCall {
  Future<ApiCallResponse> call({
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken = '',
  }) async {
    final baseUrl = CRMPeopleGroup.getBaseUrl(
      partitionKey: partitionKey,
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "_partitionKey": "organization_id=${partitionKey}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'IdempotencePeople',
      apiUrl: '${baseUrl}crm-people/people',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? idempotenceKey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.key''',
      ));
}

class CreatePeopleCall {
  Future<ApiCallResponse> call({
    String? idempotenceId = '',
    String? bodyName = '',
    String? bodyLastName = '',
    String? bodyRole = '',
    String? bodyEmail = '',
    String? bodyCallingCode = '',
    String? bodyPhoneNumber = '',
    String? fullName = '',
    String? organizationName = '',
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken = '',
  }) async {
    final baseUrl = CRMPeopleGroup.getBaseUrl(
      partitionKey: partitionKey,
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "first_name": "${bodyName}",
  "last_name": "${bodyLastName}",
  "full_name": "${fullName}",
  "organization_name": "${organizationName}",
  "roles": [
    {
      "slug": "${bodyRole}"
    }
  ],
  "emails": [
    {
      "value": "${bodyEmail}",
      "type": "principal",
      "verified": false
    }
  ],
  "phones": [
    {
      "calling_code": "${bodyCallingCode}",
      "phone_number": "${bodyPhoneNumber}",
      "type": "principal",
      "verified": false
    }
  ],
  "_partitionKey": "${partitionKey}",
  "active": true,
  "person_type": "natural_person_sp_buyer_seller"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreatePeople',
      apiUrl: '${baseUrl}crm-people/people/${idempotenceId}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PeopleByIdCall {
  Future<ApiCallResponse> call({
    String? peopleId = '',
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken = '',
  }) async {
    final baseUrl = CRMPeopleGroup.getBaseUrl(
      partitionKey: partitionKey,
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'People by Id',
      apiUrl: '${baseUrl}crm-people/people/${peopleId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? respFirstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.first_name''',
      ));
  String? respLastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.last_name''',
      ));
  String? respRole(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.roles[:].slug''',
      ));
  String? respEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.emails[:].value''',
      ));
  String? respPhoneNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.phones[:].phone_number''',
      ));
  String? respCallingCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.phones[:].calling_code''',
      ));
  String? respOrganizationName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.organization_name''',
      ));
}

/// End CRM People Group Code

/// Start CRM Commodity Group Code

class CRMCommodityGroup {
  static String getBaseUrl({
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken = '',
  }) =>
      'https://crm-prod.grainchain.io/api/v1/';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [auth_token]',
  };
  static CommoditiesCall commoditiesCall = CommoditiesCall();
}

class CommoditiesCall {
  Future<ApiCallResponse> call({
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken = '',
  }) async {
    final baseUrl = CRMCommodityGroup.getBaseUrl(
      partitionKey: partitionKey,
      authToken: authToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'Commodities',
        apiUrl: '${baseUrl}commodities/commodities',
        callType: ApiCallType.GET,
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        params: {
          'page': 1,
          'limit': 20,
          'filter': "{\"_partitionKey\":\"${partitionKey}\"}",
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    ResponseGetApiCommodities(),
  ];

  List<String>? ids(dynamic response) => (getJsonField(
        response,
        r'''$.data[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? names(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<CommoditiesStruct>? data(dynamic response) => (getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => CommoditiesStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

/// End CRM Commodity Group Code

/// Start CRM Locations Group Code

class CRMLocationsGroup {
  static String getBaseUrl({
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik16UXpSa0U1TVRFelEwTTVRakU1TWpoRVJUTTBSRU00UmtGQ1JqZEVRVUpDTWpjM09FWTFPQSJ9.eyJodHRwOi8vd3d3LmdyYWluY2hhaW4uaW8vcm9sZXMiOlsiRHJpdmVyIiwicGFydGljaXBhbnQiXSwiaXNzIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NWY0MDExZWM3M2VkYzEwMDNkNmNlODNhIiwiYXVkIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vYXBpL3YyLyIsImlhdCI6MTcxNjgyMjI2MSwiZXhwIjoxNzE5NDE0MjYxLCJzY29wZSI6InJlYWQ6Y3VycmVudF91c2VyIHVwZGF0ZTpjdXJyZW50X3VzZXJfbWV0YWRhdGEgZGVsZXRlOmN1cnJlbnRfdXNlcl9tZXRhZGF0YSBjcmVhdGU6Y3VycmVudF91c2VyX21ldGFkYXRhIGNyZWF0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIGRlbGV0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIHVwZGF0ZTpjdXJyZW50X3VzZXJfaWRlbnRpdGllcyIsImd0eSI6InBhc3N3b3JkIiwiYXpwIjoiQjRHV0dRTHk4ZjNUanFXYmx0NXVRUmpzUmVjWmxtbTMifQ.hGUoVqI2qhhjYxGdp5Y3pTgUvY1idSIkF9JHTEei0kDOAQ-TTJAp7MfbNSr-Tcf4436TTcv-HxjyD0l9eGWOd7G3xrY4Albw3TKZfQ3jAHwc-286J8Huh1tAE_U0OjHRn402zM0ASISS8PS1UDNre6-gvXXS70u8j-xEnf9HBc74BcYFzt4f3cAeSWct639xdREb7xVMcjg4sVLSY90CJM_YV8FdmAk_PDTErqTrRun6ln90Bu5q4EgPdjB0lT0ytHrKn7getxD-B5Ep-IALotx5j9H6eD4UnHGmnDeGala6YBFr5-1bwSUyZccX9EkYSHLaIgndn1-LyR1Q0Kdeyg',
  }) =>
      'https://crm-prod.grainchain.io/api/v1/crm-locations';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [auth_token]',
  };
  static CreateLocationCall createLocationCall = CreateLocationCall();
  static CountriesCall countriesCall = CountriesCall();
  static StatesCall statesCall = StatesCall();
  static CitiesCall citiesCall = CitiesCall();
  static AddressPeopleCall addressPeopleCall = AddressPeopleCall();
  static AddressUpdateCall addressUpdateCall = AddressUpdateCall();
}

class CreateLocationCall {
  Future<ApiCallResponse> call({
    String? addressLine1 = '',
    String? countryId = '',
    String? countryName = '',
    String? stateId = '',
    String? stateName = '',
    String? cityId = '',
    String? cityName = '',
    String? ownerId = '',
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik16UXpSa0U1TVRFelEwTTVRakU1TWpoRVJUTTBSRU00UmtGQ1JqZEVRVUpDTWpjM09FWTFPQSJ9.eyJodHRwOi8vd3d3LmdyYWluY2hhaW4uaW8vcm9sZXMiOlsiRHJpdmVyIiwicGFydGljaXBhbnQiXSwiaXNzIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NWY0MDExZWM3M2VkYzEwMDNkNmNlODNhIiwiYXVkIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vYXBpL3YyLyIsImlhdCI6MTcxNjgyMjI2MSwiZXhwIjoxNzE5NDE0MjYxLCJzY29wZSI6InJlYWQ6Y3VycmVudF91c2VyIHVwZGF0ZTpjdXJyZW50X3VzZXJfbWV0YWRhdGEgZGVsZXRlOmN1cnJlbnRfdXNlcl9tZXRhZGF0YSBjcmVhdGU6Y3VycmVudF91c2VyX21ldGFkYXRhIGNyZWF0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIGRlbGV0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIHVwZGF0ZTpjdXJyZW50X3VzZXJfaWRlbnRpdGllcyIsImd0eSI6InBhc3N3b3JkIiwiYXpwIjoiQjRHV0dRTHk4ZjNUanFXYmx0NXVRUmpzUmVjWmxtbTMifQ.hGUoVqI2qhhjYxGdp5Y3pTgUvY1idSIkF9JHTEei0kDOAQ-TTJAp7MfbNSr-Tcf4436TTcv-HxjyD0l9eGWOd7G3xrY4Albw3TKZfQ3jAHwc-286J8Huh1tAE_U0OjHRn402zM0ASISS8PS1UDNre6-gvXXS70u8j-xEnf9HBc74BcYFzt4f3cAeSWct639xdREb7xVMcjg4sVLSY90CJM_YV8FdmAk_PDTErqTrRun6ln90Bu5q4EgPdjB0lT0ytHrKn7getxD-B5Ep-IALotx5j9H6eD4UnHGmnDeGala6YBFr5-1bwSUyZccX9EkYSHLaIgndn1-LyR1Q0Kdeyg',
  }) async {
    final baseUrl = CRMLocationsGroup.getBaseUrl(
      partitionKey: partitionKey,
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "owner_id": "${ownerId}",
  "type": [
    "personal"
  ],
  "address_line_1": "${addressLine1}",
  "address_line_2": "",
  "country_id": "${countryId}",
  "country": "${countryName}",
  "state_id": "${stateId}",
  "state": "${stateName}",
  "city_id": "${cityId}",
  "city": "${cityName}",
  "neighborhood": "",
  "zip_code": "",
  "latitude": "",
  "longitude": "",
  "elevation": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateLocation',
      apiUrl: '${baseUrl}/address',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CountriesCall {
  Future<ApiCallResponse> call({
    String? locationType = 'countries',
    int? page = 1,
    int? limit = 10,
    String? filter = '{}',
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik16UXpSa0U1TVRFelEwTTVRakU1TWpoRVJUTTBSRU00UmtGQ1JqZEVRVUpDTWpjM09FWTFPQSJ9.eyJodHRwOi8vd3d3LmdyYWluY2hhaW4uaW8vcm9sZXMiOlsiRHJpdmVyIiwicGFydGljaXBhbnQiXSwiaXNzIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NWY0MDExZWM3M2VkYzEwMDNkNmNlODNhIiwiYXVkIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vYXBpL3YyLyIsImlhdCI6MTcxNjgyMjI2MSwiZXhwIjoxNzE5NDE0MjYxLCJzY29wZSI6InJlYWQ6Y3VycmVudF91c2VyIHVwZGF0ZTpjdXJyZW50X3VzZXJfbWV0YWRhdGEgZGVsZXRlOmN1cnJlbnRfdXNlcl9tZXRhZGF0YSBjcmVhdGU6Y3VycmVudF91c2VyX21ldGFkYXRhIGNyZWF0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIGRlbGV0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIHVwZGF0ZTpjdXJyZW50X3VzZXJfaWRlbnRpdGllcyIsImd0eSI6InBhc3N3b3JkIiwiYXpwIjoiQjRHV0dRTHk4ZjNUanFXYmx0NXVRUmpzUmVjWmxtbTMifQ.hGUoVqI2qhhjYxGdp5Y3pTgUvY1idSIkF9JHTEei0kDOAQ-TTJAp7MfbNSr-Tcf4436TTcv-HxjyD0l9eGWOd7G3xrY4Albw3TKZfQ3jAHwc-286J8Huh1tAE_U0OjHRn402zM0ASISS8PS1UDNre6-gvXXS70u8j-xEnf9HBc74BcYFzt4f3cAeSWct639xdREb7xVMcjg4sVLSY90CJM_YV8FdmAk_PDTErqTrRun6ln90Bu5q4EgPdjB0lT0ytHrKn7getxD-B5Ep-IALotx5j9H6eD4UnHGmnDeGala6YBFr5-1bwSUyZccX9EkYSHLaIgndn1-LyR1Q0Kdeyg',
  }) async {
    final baseUrl = CRMLocationsGroup.getBaseUrl(
      partitionKey: partitionKey,
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Countries',
      apiUrl: '${baseUrl}/countries/find-countries',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'page': page,
        'limit': limit,
        'filter': "${filter}",
        'sort': "{\"names.en\":1}",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? countryListResponse(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  int? currentPageResponse(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$._meta.page_number''',
      ));
}

class StatesCall {
  Future<ApiCallResponse> call({
    int? page = 1,
    int? limit = 10,
    String? countrySlug = 'USA',
    String? filter = '{}',
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik16UXpSa0U1TVRFelEwTTVRakU1TWpoRVJUTTBSRU00UmtGQ1JqZEVRVUpDTWpjM09FWTFPQSJ9.eyJodHRwOi8vd3d3LmdyYWluY2hhaW4uaW8vcm9sZXMiOlsiRHJpdmVyIiwicGFydGljaXBhbnQiXSwiaXNzIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NWY0MDExZWM3M2VkYzEwMDNkNmNlODNhIiwiYXVkIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vYXBpL3YyLyIsImlhdCI6MTcxNjgyMjI2MSwiZXhwIjoxNzE5NDE0MjYxLCJzY29wZSI6InJlYWQ6Y3VycmVudF91c2VyIHVwZGF0ZTpjdXJyZW50X3VzZXJfbWV0YWRhdGEgZGVsZXRlOmN1cnJlbnRfdXNlcl9tZXRhZGF0YSBjcmVhdGU6Y3VycmVudF91c2VyX21ldGFkYXRhIGNyZWF0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIGRlbGV0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIHVwZGF0ZTpjdXJyZW50X3VzZXJfaWRlbnRpdGllcyIsImd0eSI6InBhc3N3b3JkIiwiYXpwIjoiQjRHV0dRTHk4ZjNUanFXYmx0NXVRUmpzUmVjWmxtbTMifQ.hGUoVqI2qhhjYxGdp5Y3pTgUvY1idSIkF9JHTEei0kDOAQ-TTJAp7MfbNSr-Tcf4436TTcv-HxjyD0l9eGWOd7G3xrY4Albw3TKZfQ3jAHwc-286J8Huh1tAE_U0OjHRn402zM0ASISS8PS1UDNre6-gvXXS70u8j-xEnf9HBc74BcYFzt4f3cAeSWct639xdREb7xVMcjg4sVLSY90CJM_YV8FdmAk_PDTErqTrRun6ln90Bu5q4EgPdjB0lT0ytHrKn7getxD-B5Ep-IALotx5j9H6eD4UnHGmnDeGala6YBFr5-1bwSUyZccX9EkYSHLaIgndn1-LyR1Q0Kdeyg',
  }) async {
    final baseUrl = CRMLocationsGroup.getBaseUrl(
      partitionKey: partitionKey,
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'States',
      apiUrl: '${baseUrl}/states/find-states',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'page': page,
        'limit': limit,
        'filter': filter,
        'sort': "{\"name\":1}",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? countryListResponse(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  int? currentPageResponse(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$._meta.page_number''',
      ));
}

class CitiesCall {
  Future<ApiCallResponse> call({
    int? page = 1,
    int? limit = 10,
    String? filter = '',
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik16UXpSa0U1TVRFelEwTTVRakU1TWpoRVJUTTBSRU00UmtGQ1JqZEVRVUpDTWpjM09FWTFPQSJ9.eyJodHRwOi8vd3d3LmdyYWluY2hhaW4uaW8vcm9sZXMiOlsiRHJpdmVyIiwicGFydGljaXBhbnQiXSwiaXNzIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NWY0MDExZWM3M2VkYzEwMDNkNmNlODNhIiwiYXVkIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vYXBpL3YyLyIsImlhdCI6MTcxNjgyMjI2MSwiZXhwIjoxNzE5NDE0MjYxLCJzY29wZSI6InJlYWQ6Y3VycmVudF91c2VyIHVwZGF0ZTpjdXJyZW50X3VzZXJfbWV0YWRhdGEgZGVsZXRlOmN1cnJlbnRfdXNlcl9tZXRhZGF0YSBjcmVhdGU6Y3VycmVudF91c2VyX21ldGFkYXRhIGNyZWF0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIGRlbGV0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIHVwZGF0ZTpjdXJyZW50X3VzZXJfaWRlbnRpdGllcyIsImd0eSI6InBhc3N3b3JkIiwiYXpwIjoiQjRHV0dRTHk4ZjNUanFXYmx0NXVRUmpzUmVjWmxtbTMifQ.hGUoVqI2qhhjYxGdp5Y3pTgUvY1idSIkF9JHTEei0kDOAQ-TTJAp7MfbNSr-Tcf4436TTcv-HxjyD0l9eGWOd7G3xrY4Albw3TKZfQ3jAHwc-286J8Huh1tAE_U0OjHRn402zM0ASISS8PS1UDNre6-gvXXS70u8j-xEnf9HBc74BcYFzt4f3cAeSWct639xdREb7xVMcjg4sVLSY90CJM_YV8FdmAk_PDTErqTrRun6ln90Bu5q4EgPdjB0lT0ytHrKn7getxD-B5Ep-IALotx5j9H6eD4UnHGmnDeGala6YBFr5-1bwSUyZccX9EkYSHLaIgndn1-LyR1Q0Kdeyg',
  }) async {
    final baseUrl = CRMLocationsGroup.getBaseUrl(
      partitionKey: partitionKey,
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Cities',
      apiUrl: '${baseUrl}/cities/find-cities',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'page': page,
        'limit': limit,
        'filter': filter,
        'sort': "{\"name\":1}",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? countryListResponse(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  int? currentPageResponse(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$._meta.page_number''',
      ));
}

class AddressPeopleCall {
  Future<ApiCallResponse> call({
    String? ownerId = '',
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik16UXpSa0U1TVRFelEwTTVRakU1TWpoRVJUTTBSRU00UmtGQ1JqZEVRVUpDTWpjM09FWTFPQSJ9.eyJodHRwOi8vd3d3LmdyYWluY2hhaW4uaW8vcm9sZXMiOlsiRHJpdmVyIiwicGFydGljaXBhbnQiXSwiaXNzIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NWY0MDExZWM3M2VkYzEwMDNkNmNlODNhIiwiYXVkIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vYXBpL3YyLyIsImlhdCI6MTcxNjgyMjI2MSwiZXhwIjoxNzE5NDE0MjYxLCJzY29wZSI6InJlYWQ6Y3VycmVudF91c2VyIHVwZGF0ZTpjdXJyZW50X3VzZXJfbWV0YWRhdGEgZGVsZXRlOmN1cnJlbnRfdXNlcl9tZXRhZGF0YSBjcmVhdGU6Y3VycmVudF91c2VyX21ldGFkYXRhIGNyZWF0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIGRlbGV0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIHVwZGF0ZTpjdXJyZW50X3VzZXJfaWRlbnRpdGllcyIsImd0eSI6InBhc3N3b3JkIiwiYXpwIjoiQjRHV0dRTHk4ZjNUanFXYmx0NXVRUmpzUmVjWmxtbTMifQ.hGUoVqI2qhhjYxGdp5Y3pTgUvY1idSIkF9JHTEei0kDOAQ-TTJAp7MfbNSr-Tcf4436TTcv-HxjyD0l9eGWOd7G3xrY4Albw3TKZfQ3jAHwc-286J8Huh1tAE_U0OjHRn402zM0ASISS8PS1UDNre6-gvXXS70u8j-xEnf9HBc74BcYFzt4f3cAeSWct639xdREb7xVMcjg4sVLSY90CJM_YV8FdmAk_PDTErqTrRun6ln90Bu5q4EgPdjB0lT0ytHrKn7getxD-B5Ep-IALotx5j9H6eD4UnHGmnDeGala6YBFr5-1bwSUyZccX9EkYSHLaIgndn1-LyR1Q0Kdeyg',
  }) async {
    final baseUrl = CRMLocationsGroup.getBaseUrl(
      partitionKey: partitionKey,
      authToken: authToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'AddressPeople',
        apiUrl: '${baseUrl}/address',
        callType: ApiCallType.GET,
        headers: {
          'Authorization': 'Bearer ${authToken}',
        },
        params: {
          'filter': "{\"owner_id\":\"${ownerId}\", \"active\": true}",
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    addressPeopleInterceptor(),
  ];
}

class AddressUpdateCall {
  Future<ApiCallResponse> call({
    String? addressId = '',
    String? ownerId = '',
    String? countryId = '',
    String? countryName = '',
    String? stateId = '',
    String? stateName = '',
    String? cityId = '',
    String? cityName = '',
    String? addressLine1 = '',
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik16UXpSa0U1TVRFelEwTTVRakU1TWpoRVJUTTBSRU00UmtGQ1JqZEVRVUpDTWpjM09FWTFPQSJ9.eyJodHRwOi8vd3d3LmdyYWluY2hhaW4uaW8vcm9sZXMiOlsiRHJpdmVyIiwicGFydGljaXBhbnQiXSwiaXNzIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NWY0MDExZWM3M2VkYzEwMDNkNmNlODNhIiwiYXVkIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vYXBpL3YyLyIsImlhdCI6MTcxNjgyMjI2MSwiZXhwIjoxNzE5NDE0MjYxLCJzY29wZSI6InJlYWQ6Y3VycmVudF91c2VyIHVwZGF0ZTpjdXJyZW50X3VzZXJfbWV0YWRhdGEgZGVsZXRlOmN1cnJlbnRfdXNlcl9tZXRhZGF0YSBjcmVhdGU6Y3VycmVudF91c2VyX21ldGFkYXRhIGNyZWF0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIGRlbGV0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIHVwZGF0ZTpjdXJyZW50X3VzZXJfaWRlbnRpdGllcyIsImd0eSI6InBhc3N3b3JkIiwiYXpwIjoiQjRHV0dRTHk4ZjNUanFXYmx0NXVRUmpzUmVjWmxtbTMifQ.hGUoVqI2qhhjYxGdp5Y3pTgUvY1idSIkF9JHTEei0kDOAQ-TTJAp7MfbNSr-Tcf4436TTcv-HxjyD0l9eGWOd7G3xrY4Albw3TKZfQ3jAHwc-286J8Huh1tAE_U0OjHRn402zM0ASISS8PS1UDNre6-gvXXS70u8j-xEnf9HBc74BcYFzt4f3cAeSWct639xdREb7xVMcjg4sVLSY90CJM_YV8FdmAk_PDTErqTrRun6ln90Bu5q4EgPdjB0lT0ytHrKn7getxD-B5Ep-IALotx5j9H6eD4UnHGmnDeGala6YBFr5-1bwSUyZccX9EkYSHLaIgndn1-LyR1Q0Kdeyg',
  }) async {
    final baseUrl = CRMLocationsGroup.getBaseUrl(
      partitionKey: partitionKey,
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "owner_id": "${ownerId}",
  "address_line_1": "${addressLine1}",
  "address_line_2": "",
  "country_id": "${countryId}",
  "country": "${countryName}",
  "state_id": "${stateId}",
  "state": "${stateName}",
  "city_id": "${cityId}",
  "city": "${cityName}",
  "neighborhood": "",
  "zip_code": "",
  "latitude": "",
  "longitude": "",
  "elevation": "",
  "active": true,
  "type": [
    "personal"
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddressUpdate',
      apiUrl: '${baseUrl}/address/${addressId}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End CRM Locations Group Code

/// Start Contracts Group Code

class ContractsGroup {
  static String getBaseUrl({
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik16UXpSa0U1TVRFelEwTTVRakU1TWpoRVJUTTBSRU00UmtGQ1JqZEVRVUpDTWpjM09FWTFPQSJ9.eyJodHRwOi8vd3d3LmdyYWluY2hhaW4uaW8vcm9sZXMiOlsicGFydGljaXBhbnQiXSwiaXNzIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NjYxOTZkOTRkNDBhMTgzM2ZiNTcwMzYwIiwiYXVkIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vYXBpL3YyLyIsImlhdCI6MTcxODkwMzkwMywiZXhwIjoxNzIxNDk1OTAzLCJzY29wZSI6InJlYWQ6Y3VycmVudF91c2VyIHVwZGF0ZTpjdXJyZW50X3VzZXJfbWV0YWRhdGEgZGVsZXRlOmN1cnJlbnRfdXNlcl9tZXRhZGF0YSBjcmVhdGU6Y3VycmVudF91c2VyX21ldGFkYXRhIGNyZWF0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIGRlbGV0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIHVwZGF0ZTpjdXJyZW50X3VzZXJfaWRlbnRpdGllcyIsImd0eSI6InBhc3N3b3JkIiwiYXpwIjoiQjRHV0dRTHk4ZjNUanFXYmx0NXVRUmpzUmVjWmxtbTMifQ.vJQneoBLJXJIKyQ5lFIGXNo5LQZAkqWaqR3jzv_33gV2shh5M0kCIyDMcgd_XK9UoVrJeKrgodFoDVc1wwdgjE714L2_QwpOyjgs-wxPxpiKkMfTS8FKwMQP3zQ0fMfG7ZJHgt3Gu6UoFknpt3BgL3W_DzbGbas-Tvu3a3lWDFisGyJg65TFxdKh5U7yq4gpEMsDAWbtcZ0hPG6V6CiCSsthfmj8OsUJDj_XPXd_fmaK_YwGMCZjEq5rE5JsPn0-4Tr51IvjVVu-_7ZfINukIHJyJQtZ08vz21Q1UItaHYkS-2Qx0w8BHqaJAOXCKKh3TQjXy0ply0HHndMkzNTnCw',
  }) =>
      'https://trm-prod.grainchain.io/api/v1/contract-cvc/';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [auth_token]',
    '_partitionKey': '[partitionKey]',
  };
  static IdempotenceContractCall idempotenceContractCall =
      IdempotenceContractCall();
  static CreateContractCall createContractCall = CreateContractCall();
  static ContractsCall contractsCall = ContractsCall();
  static ContractsCommoditiesUsedCall contractsCommoditiesUsedCall =
      ContractsCommoditiesUsedCall();
  static ContractDetailCall contractDetailCall = ContractDetailCall();
  static OneContractViewCall oneContractViewCall = OneContractViewCall();
  static SubContractsCall subContractsCall = SubContractsCall();
  static IdempotenceSubContractCall idempotenceSubContractCall =
      IdempotenceSubContractCall();
  static CreateSubContractCall createSubContractCall = CreateSubContractCall();
  static SettledSubContractCall settledSubContractCall =
      SettledSubContractCall();
  static RemarksCall remarksCall = RemarksCall();
}

class IdempotenceContractCall {
  Future<ApiCallResponse> call({
    String? organizationId = '65242e39c5c836f89ecb3356',
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik16UXpSa0U1TVRFelEwTTVRakU1TWpoRVJUTTBSRU00UmtGQ1JqZEVRVUpDTWpjM09FWTFPQSJ9.eyJodHRwOi8vd3d3LmdyYWluY2hhaW4uaW8vcm9sZXMiOlsicGFydGljaXBhbnQiXSwiaXNzIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NjYxOTZkOTRkNDBhMTgzM2ZiNTcwMzYwIiwiYXVkIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vYXBpL3YyLyIsImlhdCI6MTcxODkwMzkwMywiZXhwIjoxNzIxNDk1OTAzLCJzY29wZSI6InJlYWQ6Y3VycmVudF91c2VyIHVwZGF0ZTpjdXJyZW50X3VzZXJfbWV0YWRhdGEgZGVsZXRlOmN1cnJlbnRfdXNlcl9tZXRhZGF0YSBjcmVhdGU6Y3VycmVudF91c2VyX21ldGFkYXRhIGNyZWF0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIGRlbGV0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIHVwZGF0ZTpjdXJyZW50X3VzZXJfaWRlbnRpdGllcyIsImd0eSI6InBhc3N3b3JkIiwiYXpwIjoiQjRHV0dRTHk4ZjNUanFXYmx0NXVRUmpzUmVjWmxtbTMifQ.vJQneoBLJXJIKyQ5lFIGXNo5LQZAkqWaqR3jzv_33gV2shh5M0kCIyDMcgd_XK9UoVrJeKrgodFoDVc1wwdgjE714L2_QwpOyjgs-wxPxpiKkMfTS8FKwMQP3zQ0fMfG7ZJHgt3Gu6UoFknpt3BgL3W_DzbGbas-Tvu3a3lWDFisGyJg65TFxdKh5U7yq4gpEMsDAWbtcZ0hPG6V6CiCSsthfmj8OsUJDj_XPXd_fmaK_YwGMCZjEq5rE5JsPn0-4Tr51IvjVVu-_7ZfINukIHJyJQtZ08vz21Q1UItaHYkS-2Qx0w8BHqaJAOXCKKh3TQjXy0ply0HHndMkzNTnCw',
  }) async {
    final baseUrl = ContractsGroup.getBaseUrl(
      partitionKey: partitionKey,
      authToken: authToken,
    );

    final ffApiRequestBody = '''
''';
    return ApiManager.instance.makeApiCall(
      callName: 'IdempotenceContract',
      apiUrl: '${baseUrl}sp-contracts',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        '_partitionKey': '${partitionKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? idPotence(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.key''',
      ));
}

class CreateContractCall {
  Future<ApiCallResponse> call({
    String? idempotence = '6643b8dc8de56726c7eb704f',
    dynamic? dataBodyJson,
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik16UXpSa0U1TVRFelEwTTVRakU1TWpoRVJUTTBSRU00UmtGQ1JqZEVRVUpDTWpjM09FWTFPQSJ9.eyJodHRwOi8vd3d3LmdyYWluY2hhaW4uaW8vcm9sZXMiOlsicGFydGljaXBhbnQiXSwiaXNzIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NjYxOTZkOTRkNDBhMTgzM2ZiNTcwMzYwIiwiYXVkIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vYXBpL3YyLyIsImlhdCI6MTcxODkwMzkwMywiZXhwIjoxNzIxNDk1OTAzLCJzY29wZSI6InJlYWQ6Y3VycmVudF91c2VyIHVwZGF0ZTpjdXJyZW50X3VzZXJfbWV0YWRhdGEgZGVsZXRlOmN1cnJlbnRfdXNlcl9tZXRhZGF0YSBjcmVhdGU6Y3VycmVudF91c2VyX21ldGFkYXRhIGNyZWF0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIGRlbGV0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIHVwZGF0ZTpjdXJyZW50X3VzZXJfaWRlbnRpdGllcyIsImd0eSI6InBhc3N3b3JkIiwiYXpwIjoiQjRHV0dRTHk4ZjNUanFXYmx0NXVRUmpzUmVjWmxtbTMifQ.vJQneoBLJXJIKyQ5lFIGXNo5LQZAkqWaqR3jzv_33gV2shh5M0kCIyDMcgd_XK9UoVrJeKrgodFoDVc1wwdgjE714L2_QwpOyjgs-wxPxpiKkMfTS8FKwMQP3zQ0fMfG7ZJHgt3Gu6UoFknpt3BgL3W_DzbGbas-Tvu3a3lWDFisGyJg65TFxdKh5U7yq4gpEMsDAWbtcZ0hPG6V6CiCSsthfmj8OsUJDj_XPXd_fmaK_YwGMCZjEq5rE5JsPn0-4Tr51IvjVVu-_7ZfINukIHJyJQtZ08vz21Q1UItaHYkS-2Qx0w8BHqaJAOXCKKh3TQjXy0ply0HHndMkzNTnCw',
  }) async {
    final baseUrl = ContractsGroup.getBaseUrl(
      partitionKey: partitionKey,
      authToken: authToken,
    );

    final dataBody = _serializeJson(dataBodyJson);
    final ffApiRequestBody = '''
${dataBody}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateContract',
      apiUrl: '${baseUrl}sp-contracts/${idempotence}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        '_partitionKey': '${partitionKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? folio(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.folio''',
      ));
}

class ContractsCall {
  Future<ApiCallResponse> call({
    String? all = 'false',
    String? filter = '',
    int? page = 1,
    int? limit = 10,
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik16UXpSa0U1TVRFelEwTTVRakU1TWpoRVJUTTBSRU00UmtGQ1JqZEVRVUpDTWpjM09FWTFPQSJ9.eyJodHRwOi8vd3d3LmdyYWluY2hhaW4uaW8vcm9sZXMiOlsicGFydGljaXBhbnQiXSwiaXNzIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NjYxOTZkOTRkNDBhMTgzM2ZiNTcwMzYwIiwiYXVkIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vYXBpL3YyLyIsImlhdCI6MTcxODkwMzkwMywiZXhwIjoxNzIxNDk1OTAzLCJzY29wZSI6InJlYWQ6Y3VycmVudF91c2VyIHVwZGF0ZTpjdXJyZW50X3VzZXJfbWV0YWRhdGEgZGVsZXRlOmN1cnJlbnRfdXNlcl9tZXRhZGF0YSBjcmVhdGU6Y3VycmVudF91c2VyX21ldGFkYXRhIGNyZWF0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIGRlbGV0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIHVwZGF0ZTpjdXJyZW50X3VzZXJfaWRlbnRpdGllcyIsImd0eSI6InBhc3N3b3JkIiwiYXpwIjoiQjRHV0dRTHk4ZjNUanFXYmx0NXVRUmpzUmVjWmxtbTMifQ.vJQneoBLJXJIKyQ5lFIGXNo5LQZAkqWaqR3jzv_33gV2shh5M0kCIyDMcgd_XK9UoVrJeKrgodFoDVc1wwdgjE714L2_QwpOyjgs-wxPxpiKkMfTS8FKwMQP3zQ0fMfG7ZJHgt3Gu6UoFknpt3BgL3W_DzbGbas-Tvu3a3lWDFisGyJg65TFxdKh5U7yq4gpEMsDAWbtcZ0hPG6V6CiCSsthfmj8OsUJDj_XPXd_fmaK_YwGMCZjEq5rE5JsPn0-4Tr51IvjVVu-_7ZfINukIHJyJQtZ08vz21Q1UItaHYkS-2Qx0w8BHqaJAOXCKKh3TQjXy0ply0HHndMkzNTnCw',
  }) async {
    final baseUrl = ContractsGroup.getBaseUrl(
      partitionKey: partitionKey,
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Contracts',
      apiUrl: '${baseUrl}/sp-contracts',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        '_partitionKey': '${partitionKey}',
      },
      params: {
        'all': all,
        'filter': filter,
        'page': page,
        'limit': limit,
        'sort': "{\"created_at\":-1}",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalPages(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$._meta.total_pages''',
      ));
  int? totalElements(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$._meta.total_elements''',
      ));
  int? pageNumber(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$._meta.page_number''',
      ));
  int? pageSize(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$._meta.page_size''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class ContractsCommoditiesUsedCall {
  Future<ApiCallResponse> call({
    dynamic? bodyValueJson,
    String? typeValue = 'sale',
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik16UXpSa0U1TVRFelEwTTVRakU1TWpoRVJUTTBSRU00UmtGQ1JqZEVRVUpDTWpjM09FWTFPQSJ9.eyJodHRwOi8vd3d3LmdyYWluY2hhaW4uaW8vcm9sZXMiOlsicGFydGljaXBhbnQiXSwiaXNzIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NjYxOTZkOTRkNDBhMTgzM2ZiNTcwMzYwIiwiYXVkIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vYXBpL3YyLyIsImlhdCI6MTcxODkwMzkwMywiZXhwIjoxNzIxNDk1OTAzLCJzY29wZSI6InJlYWQ6Y3VycmVudF91c2VyIHVwZGF0ZTpjdXJyZW50X3VzZXJfbWV0YWRhdGEgZGVsZXRlOmN1cnJlbnRfdXNlcl9tZXRhZGF0YSBjcmVhdGU6Y3VycmVudF91c2VyX21ldGFkYXRhIGNyZWF0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIGRlbGV0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIHVwZGF0ZTpjdXJyZW50X3VzZXJfaWRlbnRpdGllcyIsImd0eSI6InBhc3N3b3JkIiwiYXpwIjoiQjRHV0dRTHk4ZjNUanFXYmx0NXVRUmpzUmVjWmxtbTMifQ.vJQneoBLJXJIKyQ5lFIGXNo5LQZAkqWaqR3jzv_33gV2shh5M0kCIyDMcgd_XK9UoVrJeKrgodFoDVc1wwdgjE714L2_QwpOyjgs-wxPxpiKkMfTS8FKwMQP3zQ0fMfG7ZJHgt3Gu6UoFknpt3BgL3W_DzbGbas-Tvu3a3lWDFisGyJg65TFxdKh5U7yq4gpEMsDAWbtcZ0hPG6V6CiCSsthfmj8OsUJDj_XPXd_fmaK_YwGMCZjEq5rE5JsPn0-4Tr51IvjVVu-_7ZfINukIHJyJQtZ08vz21Q1UItaHYkS-2Qx0w8BHqaJAOXCKKh3TQjXy0ply0HHndMkzNTnCw',
  }) async {
    final baseUrl = ContractsGroup.getBaseUrl(
      partitionKey: partitionKey,
      authToken: authToken,
    );

    final bodyValue = _serializeJson(bodyValueJson, true);
    final ffApiRequestBody = '''
{
  "commodities_enables": ${bodyValue}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Contracts commodities used',
      apiUrl: '${baseUrl}/sp-contracts/commodities?type=${typeValue}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        '_partitionKey': '${partitionKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? totalPages(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$._meta.total_pages''',
      ));
  int? totalElements(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$._meta.total_elements''',
      ));
  int? pageNumber(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$._meta.page_number''',
      ));
  int? pageSize(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$._meta.page_size''',
      ));
  List<CommoditiesStruct>? data(dynamic response) => (getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => CommoditiesStruct.maybeFromMap(x))
          .withoutNulls
          .toList();
}

class ContractDetailCall {
  Future<ApiCallResponse> call({
    String? contractId = '',
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik16UXpSa0U1TVRFelEwTTVRakU1TWpoRVJUTTBSRU00UmtGQ1JqZEVRVUpDTWpjM09FWTFPQSJ9.eyJodHRwOi8vd3d3LmdyYWluY2hhaW4uaW8vcm9sZXMiOlsicGFydGljaXBhbnQiXSwiaXNzIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NjYxOTZkOTRkNDBhMTgzM2ZiNTcwMzYwIiwiYXVkIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vYXBpL3YyLyIsImlhdCI6MTcxODkwMzkwMywiZXhwIjoxNzIxNDk1OTAzLCJzY29wZSI6InJlYWQ6Y3VycmVudF91c2VyIHVwZGF0ZTpjdXJyZW50X3VzZXJfbWV0YWRhdGEgZGVsZXRlOmN1cnJlbnRfdXNlcl9tZXRhZGF0YSBjcmVhdGU6Y3VycmVudF91c2VyX21ldGFkYXRhIGNyZWF0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIGRlbGV0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIHVwZGF0ZTpjdXJyZW50X3VzZXJfaWRlbnRpdGllcyIsImd0eSI6InBhc3N3b3JkIiwiYXpwIjoiQjRHV0dRTHk4ZjNUanFXYmx0NXVRUmpzUmVjWmxtbTMifQ.vJQneoBLJXJIKyQ5lFIGXNo5LQZAkqWaqR3jzv_33gV2shh5M0kCIyDMcgd_XK9UoVrJeKrgodFoDVc1wwdgjE714L2_QwpOyjgs-wxPxpiKkMfTS8FKwMQP3zQ0fMfG7ZJHgt3Gu6UoFknpt3BgL3W_DzbGbas-Tvu3a3lWDFisGyJg65TFxdKh5U7yq4gpEMsDAWbtcZ0hPG6V6CiCSsthfmj8OsUJDj_XPXd_fmaK_YwGMCZjEq5rE5JsPn0-4Tr51IvjVVu-_7ZfINukIHJyJQtZ08vz21Q1UItaHYkS-2Qx0w8BHqaJAOXCKKh3TQjXy0ply0HHndMkzNTnCw',
  }) async {
    final baseUrl = ContractsGroup.getBaseUrl(
      partitionKey: partitionKey,
      authToken: authToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'Contract Detail',
        apiUrl: '${baseUrl}/sp-contracts/${contractId}',
        callType: ApiCallType.GET,
        headers: {
          'Authorization': 'Bearer ${authToken}',
          '_partitionKey': '${partitionKey}',
        },
        params: {},
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    ContractDetailInterceptor(),
  ];
}

class OneContractViewCall {
  Future<ApiCallResponse> call({
    String? contractId = '664640e617b0191018295f19',
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik16UXpSa0U1TVRFelEwTTVRakU1TWpoRVJUTTBSRU00UmtGQ1JqZEVRVUpDTWpjM09FWTFPQSJ9.eyJodHRwOi8vd3d3LmdyYWluY2hhaW4uaW8vcm9sZXMiOlsicGFydGljaXBhbnQiXSwiaXNzIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NjYxOTZkOTRkNDBhMTgzM2ZiNTcwMzYwIiwiYXVkIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vYXBpL3YyLyIsImlhdCI6MTcxODkwMzkwMywiZXhwIjoxNzIxNDk1OTAzLCJzY29wZSI6InJlYWQ6Y3VycmVudF91c2VyIHVwZGF0ZTpjdXJyZW50X3VzZXJfbWV0YWRhdGEgZGVsZXRlOmN1cnJlbnRfdXNlcl9tZXRhZGF0YSBjcmVhdGU6Y3VycmVudF91c2VyX21ldGFkYXRhIGNyZWF0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIGRlbGV0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIHVwZGF0ZTpjdXJyZW50X3VzZXJfaWRlbnRpdGllcyIsImd0eSI6InBhc3N3b3JkIiwiYXpwIjoiQjRHV0dRTHk4ZjNUanFXYmx0NXVRUmpzUmVjWmxtbTMifQ.vJQneoBLJXJIKyQ5lFIGXNo5LQZAkqWaqR3jzv_33gV2shh5M0kCIyDMcgd_XK9UoVrJeKrgodFoDVc1wwdgjE714L2_QwpOyjgs-wxPxpiKkMfTS8FKwMQP3zQ0fMfG7ZJHgt3Gu6UoFknpt3BgL3W_DzbGbas-Tvu3a3lWDFisGyJg65TFxdKh5U7yq4gpEMsDAWbtcZ0hPG6V6CiCSsthfmj8OsUJDj_XPXd_fmaK_YwGMCZjEq5rE5JsPn0-4Tr51IvjVVu-_7ZfINukIHJyJQtZ08vz21Q1UItaHYkS-2Qx0w8BHqaJAOXCKKh3TQjXy0ply0HHndMkzNTnCw',
  }) async {
    final baseUrl = ContractsGroup.getBaseUrl(
      partitionKey: partitionKey,
      authToken: authToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'OneContractView',
        apiUrl: '${baseUrl}sp-contracts/${contractId}',
        callType: ApiCallType.GET,
        headers: {
          'Authorization': 'Bearer ${authToken}',
          '_partitionKey': '${partitionKey}',
        },
        params: {},
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    ContractDetailInterceptor(),
  ];
}

class SubContractsCall {
  Future<ApiCallResponse> call({
    String? contractId = '',
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik16UXpSa0U1TVRFelEwTTVRakU1TWpoRVJUTTBSRU00UmtGQ1JqZEVRVUpDTWpjM09FWTFPQSJ9.eyJodHRwOi8vd3d3LmdyYWluY2hhaW4uaW8vcm9sZXMiOlsicGFydGljaXBhbnQiXSwiaXNzIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NjYxOTZkOTRkNDBhMTgzM2ZiNTcwMzYwIiwiYXVkIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vYXBpL3YyLyIsImlhdCI6MTcxODkwMzkwMywiZXhwIjoxNzIxNDk1OTAzLCJzY29wZSI6InJlYWQ6Y3VycmVudF91c2VyIHVwZGF0ZTpjdXJyZW50X3VzZXJfbWV0YWRhdGEgZGVsZXRlOmN1cnJlbnRfdXNlcl9tZXRhZGF0YSBjcmVhdGU6Y3VycmVudF91c2VyX21ldGFkYXRhIGNyZWF0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIGRlbGV0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIHVwZGF0ZTpjdXJyZW50X3VzZXJfaWRlbnRpdGllcyIsImd0eSI6InBhc3N3b3JkIiwiYXpwIjoiQjRHV0dRTHk4ZjNUanFXYmx0NXVRUmpzUmVjWmxtbTMifQ.vJQneoBLJXJIKyQ5lFIGXNo5LQZAkqWaqR3jzv_33gV2shh5M0kCIyDMcgd_XK9UoVrJeKrgodFoDVc1wwdgjE714L2_QwpOyjgs-wxPxpiKkMfTS8FKwMQP3zQ0fMfG7ZJHgt3Gu6UoFknpt3BgL3W_DzbGbas-Tvu3a3lWDFisGyJg65TFxdKh5U7yq4gpEMsDAWbtcZ0hPG6V6CiCSsthfmj8OsUJDj_XPXd_fmaK_YwGMCZjEq5rE5JsPn0-4Tr51IvjVVu-_7ZfINukIHJyJQtZ08vz21Q1UItaHYkS-2Qx0w8BHqaJAOXCKKh3TQjXy0ply0HHndMkzNTnCw',
  }) async {
    final baseUrl = ContractsGroup.getBaseUrl(
      partitionKey: partitionKey,
      authToken: authToken,
    );

    return FFApiInterceptor.makeApiCall(
      ApiCallOptions(
        callName: 'SubContracts',
        apiUrl: '${baseUrl}/sp-sub-contracts',
        callType: ApiCallType.GET,
        headers: {
          'Authorization': 'Bearer ${authToken}',
          '_partitionKey': '${partitionKey}',
        },
        params: {
          'filter': "{\"contract_id\":\"${contractId}\"}",
        },
        returnBody: true,
        encodeBodyUtf8: false,
        decodeUtf8: false,
        cache: false,
        isStreamingApi: false,
        alwaysAllowBody: false,
      ),
      interceptors,
    );
  }

  static final interceptors = [
    subContractsInterceptor(),
  ];
}

class IdempotenceSubContractCall {
  Future<ApiCallResponse> call({
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik16UXpSa0U1TVRFelEwTTVRakU1TWpoRVJUTTBSRU00UmtGQ1JqZEVRVUpDTWpjM09FWTFPQSJ9.eyJodHRwOi8vd3d3LmdyYWluY2hhaW4uaW8vcm9sZXMiOlsicGFydGljaXBhbnQiXSwiaXNzIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NjYxOTZkOTRkNDBhMTgzM2ZiNTcwMzYwIiwiYXVkIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vYXBpL3YyLyIsImlhdCI6MTcxODkwMzkwMywiZXhwIjoxNzIxNDk1OTAzLCJzY29wZSI6InJlYWQ6Y3VycmVudF91c2VyIHVwZGF0ZTpjdXJyZW50X3VzZXJfbWV0YWRhdGEgZGVsZXRlOmN1cnJlbnRfdXNlcl9tZXRhZGF0YSBjcmVhdGU6Y3VycmVudF91c2VyX21ldGFkYXRhIGNyZWF0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIGRlbGV0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIHVwZGF0ZTpjdXJyZW50X3VzZXJfaWRlbnRpdGllcyIsImd0eSI6InBhc3N3b3JkIiwiYXpwIjoiQjRHV0dRTHk4ZjNUanFXYmx0NXVRUmpzUmVjWmxtbTMifQ.vJQneoBLJXJIKyQ5lFIGXNo5LQZAkqWaqR3jzv_33gV2shh5M0kCIyDMcgd_XK9UoVrJeKrgodFoDVc1wwdgjE714L2_QwpOyjgs-wxPxpiKkMfTS8FKwMQP3zQ0fMfG7ZJHgt3Gu6UoFknpt3BgL3W_DzbGbas-Tvu3a3lWDFisGyJg65TFxdKh5U7yq4gpEMsDAWbtcZ0hPG6V6CiCSsthfmj8OsUJDj_XPXd_fmaK_YwGMCZjEq5rE5JsPn0-4Tr51IvjVVu-_7ZfINukIHJyJQtZ08vz21Q1UItaHYkS-2Qx0w8BHqaJAOXCKKh3TQjXy0ply0HHndMkzNTnCw',
  }) async {
    final baseUrl = ContractsGroup.getBaseUrl(
      partitionKey: partitionKey,
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'IdempotenceSubContract',
      apiUrl: '${baseUrl}sp-sub-contracts',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        '_partitionKey': '${partitionKey}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateSubContractCall {
  Future<ApiCallResponse> call({
    dynamic? dataBodyJson,
    String? subContractId = '',
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik16UXpSa0U1TVRFelEwTTVRakU1TWpoRVJUTTBSRU00UmtGQ1JqZEVRVUpDTWpjM09FWTFPQSJ9.eyJodHRwOi8vd3d3LmdyYWluY2hhaW4uaW8vcm9sZXMiOlsicGFydGljaXBhbnQiXSwiaXNzIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NjYxOTZkOTRkNDBhMTgzM2ZiNTcwMzYwIiwiYXVkIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vYXBpL3YyLyIsImlhdCI6MTcxODkwMzkwMywiZXhwIjoxNzIxNDk1OTAzLCJzY29wZSI6InJlYWQ6Y3VycmVudF91c2VyIHVwZGF0ZTpjdXJyZW50X3VzZXJfbWV0YWRhdGEgZGVsZXRlOmN1cnJlbnRfdXNlcl9tZXRhZGF0YSBjcmVhdGU6Y3VycmVudF91c2VyX21ldGFkYXRhIGNyZWF0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIGRlbGV0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIHVwZGF0ZTpjdXJyZW50X3VzZXJfaWRlbnRpdGllcyIsImd0eSI6InBhc3N3b3JkIiwiYXpwIjoiQjRHV0dRTHk4ZjNUanFXYmx0NXVRUmpzUmVjWmxtbTMifQ.vJQneoBLJXJIKyQ5lFIGXNo5LQZAkqWaqR3jzv_33gV2shh5M0kCIyDMcgd_XK9UoVrJeKrgodFoDVc1wwdgjE714L2_QwpOyjgs-wxPxpiKkMfTS8FKwMQP3zQ0fMfG7ZJHgt3Gu6UoFknpt3BgL3W_DzbGbas-Tvu3a3lWDFisGyJg65TFxdKh5U7yq4gpEMsDAWbtcZ0hPG6V6CiCSsthfmj8OsUJDj_XPXd_fmaK_YwGMCZjEq5rE5JsPn0-4Tr51IvjVVu-_7ZfINukIHJyJQtZ08vz21Q1UItaHYkS-2Qx0w8BHqaJAOXCKKh3TQjXy0ply0HHndMkzNTnCw',
  }) async {
    final baseUrl = ContractsGroup.getBaseUrl(
      partitionKey: partitionKey,
      authToken: authToken,
    );

    final dataBody = _serializeJson(dataBodyJson);
    final ffApiRequestBody = '''
${dataBody}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CreateSubContract',
      apiUrl: '${baseUrl}sp-sub-contracts/${subContractId}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        '_partitionKey': '${partitionKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SettledSubContractCall {
  Future<ApiCallResponse> call({
    dynamic? dataBodyJson,
    String? subContractId = '',
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik16UXpSa0U1TVRFelEwTTVRakU1TWpoRVJUTTBSRU00UmtGQ1JqZEVRVUpDTWpjM09FWTFPQSJ9.eyJodHRwOi8vd3d3LmdyYWluY2hhaW4uaW8vcm9sZXMiOlsicGFydGljaXBhbnQiXSwiaXNzIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NjYxOTZkOTRkNDBhMTgzM2ZiNTcwMzYwIiwiYXVkIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vYXBpL3YyLyIsImlhdCI6MTcxODkwMzkwMywiZXhwIjoxNzIxNDk1OTAzLCJzY29wZSI6InJlYWQ6Y3VycmVudF91c2VyIHVwZGF0ZTpjdXJyZW50X3VzZXJfbWV0YWRhdGEgZGVsZXRlOmN1cnJlbnRfdXNlcl9tZXRhZGF0YSBjcmVhdGU6Y3VycmVudF91c2VyX21ldGFkYXRhIGNyZWF0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIGRlbGV0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIHVwZGF0ZTpjdXJyZW50X3VzZXJfaWRlbnRpdGllcyIsImd0eSI6InBhc3N3b3JkIiwiYXpwIjoiQjRHV0dRTHk4ZjNUanFXYmx0NXVRUmpzUmVjWmxtbTMifQ.vJQneoBLJXJIKyQ5lFIGXNo5LQZAkqWaqR3jzv_33gV2shh5M0kCIyDMcgd_XK9UoVrJeKrgodFoDVc1wwdgjE714L2_QwpOyjgs-wxPxpiKkMfTS8FKwMQP3zQ0fMfG7ZJHgt3Gu6UoFknpt3BgL3W_DzbGbas-Tvu3a3lWDFisGyJg65TFxdKh5U7yq4gpEMsDAWbtcZ0hPG6V6CiCSsthfmj8OsUJDj_XPXd_fmaK_YwGMCZjEq5rE5JsPn0-4Tr51IvjVVu-_7ZfINukIHJyJQtZ08vz21Q1UItaHYkS-2Qx0w8BHqaJAOXCKKh3TQjXy0ply0HHndMkzNTnCw',
  }) async {
    final baseUrl = ContractsGroup.getBaseUrl(
      partitionKey: partitionKey,
      authToken: authToken,
    );

    final dataBody = _serializeJson(dataBodyJson);
    final ffApiRequestBody = '''
${dataBody}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SettledSubContract',
      apiUrl: '${baseUrl}sp-sub-contracts/settled/${subContractId}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        '_partitionKey': '${partitionKey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RemarksCall {
  Future<ApiCallResponse> call({
    String? title = '',
    String? filterValue = '',
    bool? all,
    int? page = 1,
    int? limit = 10,
    String? partitionKey = '65242e39c5c836f89ecb3356',
    String? authToken =
        'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik16UXpSa0U1TVRFelEwTTVRakU1TWpoRVJUTTBSRU00UmtGQ1JqZEVRVUpDTWpjM09FWTFPQSJ9.eyJodHRwOi8vd3d3LmdyYWluY2hhaW4uaW8vcm9sZXMiOlsicGFydGljaXBhbnQiXSwiaXNzIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vIiwic3ViIjoiYXV0aDB8NjYxOTZkOTRkNDBhMTgzM2ZiNTcwMzYwIiwiYXVkIjoiaHR0cHM6Ly9ncmFpbmNoYWlucHJvZC5hdXRoMC5jb20vYXBpL3YyLyIsImlhdCI6MTcxODkwMzkwMywiZXhwIjoxNzIxNDk1OTAzLCJzY29wZSI6InJlYWQ6Y3VycmVudF91c2VyIHVwZGF0ZTpjdXJyZW50X3VzZXJfbWV0YWRhdGEgZGVsZXRlOmN1cnJlbnRfdXNlcl9tZXRhZGF0YSBjcmVhdGU6Y3VycmVudF91c2VyX21ldGFkYXRhIGNyZWF0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIGRlbGV0ZTpjdXJyZW50X3VzZXJfZGV2aWNlX2NyZWRlbnRpYWxzIHVwZGF0ZTpjdXJyZW50X3VzZXJfaWRlbnRpdGllcyIsImd0eSI6InBhc3N3b3JkIiwiYXpwIjoiQjRHV0dRTHk4ZjNUanFXYmx0NXVRUmpzUmVjWmxtbTMifQ.vJQneoBLJXJIKyQ5lFIGXNo5LQZAkqWaqR3jzv_33gV2shh5M0kCIyDMcgd_XK9UoVrJeKrgodFoDVc1wwdgjE714L2_QwpOyjgs-wxPxpiKkMfTS8FKwMQP3zQ0fMfG7ZJHgt3Gu6UoFknpt3BgL3W_DzbGbas-Tvu3a3lWDFisGyJg65TFxdKh5U7yq4gpEMsDAWbtcZ0hPG6V6CiCSsthfmj8OsUJDj_XPXd_fmaK_YwGMCZjEq5rE5JsPn0-4Tr51IvjVVu-_7ZfINukIHJyJQtZ08vz21Q1UItaHYkS-2Qx0w8BHqaJAOXCKKh3TQjXy0ply0HHndMkzNTnCw',
  }) async {
    final baseUrl = ContractsGroup.getBaseUrl(
      partitionKey: partitionKey,
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Remarks',
      apiUrl: '${baseUrl}sp-remarks',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        '_partitionKey': '${partitionKey}',
      },
      params: {
        'title': title,
        'filter': "${filterValue}",
        'all': all,
        'page': page,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].title''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? remarks(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].value''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? pageNumber(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$._meta.page_number''',
      ));
  int? pageSize(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$._meta.page_size''',
      ));
  int? totalPages(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$._meta.total_pages''',
      ));
}

/// End Contracts Group Code

class AuthZeroLoginCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Auth Zero Login',
      apiUrl: 'https://grainchainprod.auth0.com/oauth/token',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'username': username,
        'password': password,
        'grant_type': "http://auth0.com/oauth/grant-type/password-realm",
        'realm': "Username-Password-Authentication",
        'client_id': "B4GWGQLy8f3TjqWblt5uQRjsRecZlmm3",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? jwt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
}

class InvoicePdfCall {
  static Future<ApiCallResponse> call({
    dynamic? dataReportJson,
    String? contractFolio = '',
  }) async {
    final dataReport = _serializeJson(dataReportJson);
    final ffApiRequestBody = '''
{
  "data": ${dataReport},
  "load_data_from": null,
  "template_id": "8c677b230c041a4e",
  "export_type": "json",
  "expiration": 60,
  "output_file": "${contractFolio}",
  "is_cmyk": false,
  "image_resample_res": 600,
  "direct_download": 1,
  "cloud_storage": 1,
  "pdf_standard": "string",
  "password_protected": false,
  "password": "string",
  "postaction_s3_filekey": "string",
  "postaction_s3_bucket": "string"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'InvoicePdf',
      apiUrl: 'https://api.craftmypdf.com/v1/create',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'X-API-KEY': '3364MTI3MTk6MTI3NzI6TDMwNjZMaG9odGhNMFg1bA=',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
