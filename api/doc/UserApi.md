# openapi.api.UserApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**usersControllerGetUsers**](UserApi.md#userscontrollergetusers) | **GET** /app/user | 


# **usersControllerGetUsers**
> BuiltList<UserResponseDTO> usersControllerGetUsers()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearer
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').password = 'YOUR_PASSWORD';

final api = Openapi().getUserApi();

try {
    final response = api.usersControllerGetUsers();
    print(response);
} catch on DioError (e) {
    print('Exception when calling UserApi->usersControllerGetUsers: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;UserResponseDTO&gt;**](UserResponseDTO.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

