# openapi.model.PostResponseDTO

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **num** | The unique id of a post | 
**createdAt** | [**DateTime**](DateTime.md) | The creation date of a post | 
**updatedAt** | [**DateTime**](DateTime.md) | The last update date of a post | 
**content** | **String** | The content of a post | 
**contentType** | **String** | The content type of a post | 
**author** | [**UserResponseDTO**](UserResponseDTO.md) | The author of a post | 
**comments** | [**BuiltList&lt;CommentResponseDTO&gt;**](CommentResponseDTO.md) | The comments of a post | 
**likes** | **num** | Number of likes | 
**liked** | **bool** | Liked by current user | 
**numberOfComments** | [**JsonObject**](.md) | Number of comments and replies in a post | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


