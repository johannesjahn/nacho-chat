# openapi.api.AppApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://chat.johannes-jahn.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**appControllerGetDebug**](AppApi.md#appcontrollergetdebug) | **GET** /app/debug | 
[**appControllerGetVersion**](AppApi.md#appcontrollergetversion) | **GET** /app/version | 


# **appControllerGetDebug**
> DebugResponseDTO appControllerGetDebug()



This is the debug endpoint. It just returns text.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAppApi();

try {
    final response = api.appControllerGetDebug();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AppApi->appControllerGetDebug: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**DebugResponseDTO**](DebugResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **appControllerGetVersion**
> VersionDTO appControllerGetVersion()



Get version of the current backend

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAppApi();

try {
    final response = api.appControllerGetVersion();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AppApi->appControllerGetVersion: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**VersionDTO**](VersionDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

