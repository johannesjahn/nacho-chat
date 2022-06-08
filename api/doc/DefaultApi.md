# openapi.api.DefaultApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**appControllerGetAnyUser**](DefaultApi.md#appcontrollergetanyuser) | **GET** /app/test | 
[**appControllerGetHello**](DefaultApi.md#appcontrollergethello) | **GET** /app | 


# **appControllerGetAnyUser**
> UserResponseDTO appControllerGetAnyUser()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearer
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').password = 'YOUR_PASSWORD';

final api = Openapi().getDefaultApi();

try {
    final response = api.appControllerGetAnyUser();
    print(response);
} catch on DioError (e) {
    print('Exception when calling DefaultApi->appControllerGetAnyUser: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UserResponseDTO**](UserResponseDTO.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **appControllerGetHello**
> appControllerGetHello()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDefaultApi();

try {
    api.appControllerGetHello();
} catch on DioError (e) {
    print('Exception when calling DefaultApi->appControllerGetHello: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

