# openapi.api.AuthApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://chat.johannes-jahn.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authControllerGetUsers**](AuthApi.md#authcontrollergetusers) | **POST** /app/auth/change-password | 
[**authControllerLogin**](AuthApi.md#authcontrollerlogin) | **POST** /app/auth/login | 
[**authControllerRegister**](AuthApi.md#authcontrollerregister) | **POST** /app/auth/register | 


# **authControllerGetUsers**
> BuiltList<UserResponseDTO> authControllerGetUsers(changePasswordDTO)



Change password

### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearer
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').password = 'YOUR_PASSWORD';

final api = Openapi().getAuthApi();
final ChangePasswordDTO changePasswordDTO = ; // ChangePasswordDTO | 

try {
    final response = api.authControllerGetUsers(changePasswordDTO);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AuthApi->authControllerGetUsers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **changePasswordDTO** | [**ChangePasswordDTO**](ChangePasswordDTO.md)|  | 

### Return type

[**BuiltList&lt;UserResponseDTO&gt;**](UserResponseDTO.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authControllerLogin**
> LoginResponseDTO authControllerLogin(loginDTO)



Login with username and password

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final LoginDTO loginDTO = ; // LoginDTO | 

try {
    final response = api.authControllerLogin(loginDTO);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AuthApi->authControllerLogin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginDTO** | [**LoginDTO**](LoginDTO.md)|  | 

### Return type

[**LoginResponseDTO**](LoginResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authControllerRegister**
> UserResponseDTO authControllerRegister(registerDTO)



Register a new user

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final RegisterDTO registerDTO = ; // RegisterDTO | 

try {
    final response = api.authControllerRegister(registerDTO);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AuthApi->authControllerRegister: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **registerDTO** | [**RegisterDTO**](RegisterDTO.md)|  | 

### Return type

[**UserResponseDTO**](UserResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

