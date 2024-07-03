# openapi.model.ConversationResponseDTO

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **num** | The id of the conversation | 
**createdAt** | [**DateTime**](DateTime.md) | The creation date of the conversation | 
**updatedAt** | [**DateTime**](DateTime.md) | The date of the last update of the conversation | 
**participants** | [**BuiltList&lt;UserResponseDTO&gt;**](UserResponseDTO.md) | The participants of the conversation | 
**messages** | [**BuiltList&lt;MessageResponseDTO&gt;**](MessageResponseDTO.md) | The messages belonging to the conversation | 
**lastMessage** | [**MessageResponseDTO**](MessageResponseDTO.md) | The last message that was sent within a conversation | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


