# openapi.api.ChatApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**chatControllerCreateConversation**](ChatApi.md#chatcontrollercreateconversation) | **POST** /app/chat/create-conversation | 
[**chatControllerGetConversations**](ChatApi.md#chatcontrollergetconversations) | **GET** /app/chat/get-conversations | 
[**chatControllerGetMessages**](ChatApi.md#chatcontrollergetmessages) | **POST** /app/chat/get-messages | 
[**chatControllerSendMessage**](ChatApi.md#chatcontrollersendmessage) | **POST** /app/chat/send-message | 


# **chatControllerCreateConversation**
> ConversationResponseDTO chatControllerCreateConversation(createConversationRequestDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearer
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').password = 'YOUR_PASSWORD';

final api = Openapi().getChatApi();
final CreateConversationRequestDTO createConversationRequestDTO = ; // CreateConversationRequestDTO | 

try {
    final response = api.chatControllerCreateConversation(createConversationRequestDTO);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ChatApi->chatControllerCreateConversation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createConversationRequestDTO** | [**CreateConversationRequestDTO**](CreateConversationRequestDTO.md)|  | 

### Return type

[**ConversationResponseDTO**](ConversationResponseDTO.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **chatControllerGetConversations**
> BuiltList<ConversationResponseDTO> chatControllerGetConversations()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearer
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').password = 'YOUR_PASSWORD';

final api = Openapi().getChatApi();

try {
    final response = api.chatControllerGetConversations();
    print(response);
} catch on DioError (e) {
    print('Exception when calling ChatApi->chatControllerGetConversations: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;ConversationResponseDTO&gt;**](ConversationResponseDTO.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **chatControllerGetMessages**
> ConversationResponseDTO chatControllerGetMessages(getMessagesDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearer
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').password = 'YOUR_PASSWORD';

final api = Openapi().getChatApi();
final GetMessagesDTO getMessagesDTO = ; // GetMessagesDTO | 

try {
    final response = api.chatControllerGetMessages(getMessagesDTO);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ChatApi->chatControllerGetMessages: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **getMessagesDTO** | [**GetMessagesDTO**](GetMessagesDTO.md)|  | 

### Return type

[**ConversationResponseDTO**](ConversationResponseDTO.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **chatControllerSendMessage**
> MessageResponseDTO chatControllerSendMessage(createMessageDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearer
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').password = 'YOUR_PASSWORD';

final api = Openapi().getChatApi();
final CreateMessageDTO createMessageDTO = ; // CreateMessageDTO | 

try {
    final response = api.chatControllerSendMessage(createMessageDTO);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ChatApi->chatControllerSendMessage: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createMessageDTO** | [**CreateMessageDTO**](CreateMessageDTO.md)|  | 

### Return type

[**MessageResponseDTO**](MessageResponseDTO.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

