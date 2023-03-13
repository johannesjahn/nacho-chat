# openapi.api.UserApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**usersControllerGetAvatar**](UserApi.md#userscontrollergetavatar) | **GET** /app/user/avatar/{userId} | 
[**usersControllerGetUsers**](UserApi.md#userscontrollergetusers) | **GET** /app/user | 
[**usersControllerUploadAvatar**](UserApi.md#userscontrolleruploadavatar) | **POST** /app/user/upload-avatar | 


# **usersControllerGetAvatar**
> usersControllerGetAvatar(userId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getUserApi();
final num userId = 8.14; // num | 

try {
    api.usersControllerGetAvatar(userId);
} catch on DioError (e) {
    print('Exception when calling UserApi->usersControllerGetAvatar: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **num**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

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

# **usersControllerUploadAvatar**
> usersControllerUploadAvatar(file)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearer
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').password = 'YOUR_PASSWORD';

final api = Openapi().getUserApi();
final MultipartFile file = BINARY_DATA_HERE; // MultipartFile | 

try {
    api.usersControllerUploadAvatar(file);
} catch on DioError (e) {
    print('Exception when calling UserApi->usersControllerUploadAvatar: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **MultipartFile**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

