# openapi.model.CommentResponseDTO

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **num** | The unique id of a comment | 
**createdAt** | [**DateTime**](DateTime.md) | The creation date of a comment | 
**updatedAt** | [**DateTime**](DateTime.md) | The last update date of a comment | 
**content** | **String** | The content of a comment | 
**author** | [**CommentResponseDTOAuthor**](CommentResponseDTOAuthor.md) |  | 
**replies** | [**BuiltList&lt;ReplyResponseDTO&gt;**](ReplyResponseDTO.md) | The replies of a comment | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


