# openapi.model.MessageResponseDTO

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **num** | The id of the message | 
**createdAt** | [**DateTime**](DateTime.md) | The creation date of a message | 
**updatedAt** | [**DateTime**](DateTime.md) | The date of the last update of a message | 
**content** | **String** | The content of the message | 
**contentType** | **String** | The type of content | 
**author** | [**UserResponseDTO**](UserResponseDTO.md) |  | 
**readBy** | [**BuiltList&lt;UserResponseDTO&gt;**](UserResponseDTO.md) | The users that have read the message | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


