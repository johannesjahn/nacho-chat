# openapi.api.DefaultApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://chat.johannes-jahn.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**appControllerGetDebug**](DefaultApi.md#appcontrollergetdebug) | **GET** /app/debug | 
[**appControllerGetVersion**](DefaultApi.md#appcontrollergetversion) | **GET** /app/version | 
[**statusMonitorControllerGetData**](DefaultApi.md#statusmonitorcontrollergetdata) | **GET** /app/status/data | 
[**statusMonitorControllerRoot**](DefaultApi.md#statusmonitorcontrollerroot) | **GET** /app/status | 


# **appControllerGetDebug**
> appControllerGetDebug()



This is the debug endpoint. It just returns text.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDefaultApi();

try {
    api.appControllerGetDebug();
} catch on DioException (e) {
    print('Exception when calling DefaultApi->appControllerGetDebug: $e\n');
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

# **appControllerGetVersion**
> VersionDTO appControllerGetVersion()



Get version of the current backend

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDefaultApi();

try {
    final response = api.appControllerGetVersion();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->appControllerGetVersion: $e\n');
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

# **statusMonitorControllerGetData**
> statusMonitorControllerGetData()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDefaultApi();

try {
    api.statusMonitorControllerGetData();
} catch on DioException (e) {
    print('Exception when calling DefaultApi->statusMonitorControllerGetData: $e\n');
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

# **statusMonitorControllerRoot**
> statusMonitorControllerRoot()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDefaultApi();

try {
    api.statusMonitorControllerRoot();
} catch on DioException (e) {
    print('Exception when calling DefaultApi->statusMonitorControllerRoot: $e\n');
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

