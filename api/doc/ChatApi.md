# openapi.api.ChatApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *https://chat.johannes-jahn.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**chatControllerCreateConversation**](ChatApi.md#chatcontrollercreateconversation) | **POST** /app/chat/create-conversation | 
[**chatControllerGetConversations**](ChatApi.md#chatcontrollergetconversations) | **GET** /app/chat/get-conversations | 
[**chatControllerGetMessages**](ChatApi.md#chatcontrollergetmessages) | **POST** /app/chat/get-messages | 
[**chatControllerGetMessagesCount**](ChatApi.md#chatcontrollergetmessagescount) | **GET** /app/chat/get-messages-count | 
[**chatControllerGetNumberOfUnreadMessages**](ChatApi.md#chatcontrollergetnumberofunreadmessages) | **GET** /app/chat/get-number-of-unread-messages | 
[**chatControllerHasUnreadMessages**](ChatApi.md#chatcontrollerhasunreadmessages) | **GET** /app/chat/has-unread-messages | 
[**chatControllerMarkConversationAsRead**](ChatApi.md#chatcontrollermarkconversationasread) | **PUT** /app/chat/mark-conversation-as-read | 
[**chatControllerMarkMessageAsRead**](ChatApi.md#chatcontrollermarkmessageasread) | **PUT** /app/chat/mark-message-as-read | 
[**chatControllerSendMessage**](ChatApi.md#chatcontrollersendmessage) | **POST** /app/chat/send-message | 
[**chatControllerSetConversationTitle**](ChatApi.md#chatcontrollersetconversationtitle) | **PUT** /app/chat/set-conversation-title | 


# **chatControllerCreateConversation**
> ConversationResponseDTO chatControllerCreateConversation(createConversationRequestDTO)



Endpoint to create a new conversation with two or more participants (authenticated user is automatically added to the conversation)

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getChatApi();
final CreateConversationRequestDTO createConversationRequestDTO = ; // CreateConversationRequestDTO | 

try {
    final response = api.chatControllerCreateConversation(createConversationRequestDTO);
    print(response);
} on DioException catch (e) {
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



Endpoint to get all conversations for the authenticated user

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getChatApi();

try {
    final response = api.chatControllerGetConversations();
    print(response);
} on DioException catch (e) {
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



Endpoint to get messages relevant for the authenticated user

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getChatApi();
final GetMessagesDTO getMessagesDTO = ; // GetMessagesDTO | 

try {
    final response = api.chatControllerGetMessages(getMessagesDTO);
    print(response);
} on DioException catch (e) {
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

# **chatControllerGetMessagesCount**
> MessagesCountResponseDTO chatControllerGetMessagesCount()



Endpoint to get the number of messages sent by the authenticated user

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getChatApi();

try {
    final response = api.chatControllerGetMessagesCount();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ChatApi->chatControllerGetMessagesCount: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**MessagesCountResponseDTO**](MessagesCountResponseDTO.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **chatControllerGetNumberOfUnreadMessages**
> NumberOfUnreadMessagesResponseDTO chatControllerGetNumberOfUnreadMessages()



Endpoint to get the number of unread messages for the authenticated user

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getChatApi();

try {
    final response = api.chatControllerGetNumberOfUnreadMessages();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ChatApi->chatControllerGetNumberOfUnreadMessages: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**NumberOfUnreadMessagesResponseDTO**](NumberOfUnreadMessagesResponseDTO.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **chatControllerHasUnreadMessages**
> HasUnreadMessagesResponseDTO chatControllerHasUnreadMessages()



Endpoint to get the number of unread messages for the authenticated user

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getChatApi();

try {
    final response = api.chatControllerHasUnreadMessages();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ChatApi->chatControllerHasUnreadMessages: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**HasUnreadMessagesResponseDTO**](HasUnreadMessagesResponseDTO.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **chatControllerMarkConversationAsRead**
> chatControllerMarkConversationAsRead(markConversationAsReadDTO)



Endpoint to mark a conversation as read for the authenticated user

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getChatApi();
final MarkConversationAsReadDTO markConversationAsReadDTO = ; // MarkConversationAsReadDTO | 

try {
    api.chatControllerMarkConversationAsRead(markConversationAsReadDTO);
} on DioException catch (e) {
    print('Exception when calling ChatApi->chatControllerMarkConversationAsRead: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **markConversationAsReadDTO** | [**MarkConversationAsReadDTO**](MarkConversationAsReadDTO.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **chatControllerMarkMessageAsRead**
> chatControllerMarkMessageAsRead(markMessageAsReadDTO)



Endpoint to mark a message as read for the authenticated user

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getChatApi();
final MarkMessageAsReadDTO markMessageAsReadDTO = ; // MarkMessageAsReadDTO | 

try {
    api.chatControllerMarkMessageAsRead(markMessageAsReadDTO);
} on DioException catch (e) {
    print('Exception when calling ChatApi->chatControllerMarkMessageAsRead: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **markMessageAsReadDTO** | [**MarkMessageAsReadDTO**](MarkMessageAsReadDTO.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **chatControllerSendMessage**
> MessageResponseDTO chatControllerSendMessage(createMessageDTO)



Send a message to a conversation

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getChatApi();
final CreateMessageDTO createMessageDTO = ; // CreateMessageDTO | 

try {
    final response = api.chatControllerSendMessage(createMessageDTO);
    print(response);
} on DioException catch (e) {
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

# **chatControllerSetConversationTitle**
> ConversationResponseDTO chatControllerSetConversationTitle(setConversationTitleRequestDTO)



Endpoint to set the title of a conversation

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getChatApi();
final SetConversationTitleRequestDTO setConversationTitleRequestDTO = ; // SetConversationTitleRequestDTO | 

try {
    final response = api.chatControllerSetConversationTitle(setConversationTitleRequestDTO);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ChatApi->chatControllerSetConversationTitle: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **setConversationTitleRequestDTO** | [**SetConversationTitleRequestDTO**](SetConversationTitleRequestDTO.md)|  | 

### Return type

[**ConversationResponseDTO**](ConversationResponseDTO.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

