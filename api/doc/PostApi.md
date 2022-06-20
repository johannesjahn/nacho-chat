# openapi.api.PostApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**postControllerCreateComment**](PostApi.md#postcontrollercreatecomment) | **POST** /app/post/comment | 
[**postControllerCreatePost**](PostApi.md#postcontrollercreatepost) | **POST** /app/post | 
[**postControllerCreateReply**](PostApi.md#postcontrollercreatereply) | **POST** /app/post/reply | 
[**postControllerDeleteComment**](PostApi.md#postcontrollerdeletecomment) | **DELETE** /app/post/comment | 
[**postControllerDeletePost**](PostApi.md#postcontrollerdeletepost) | **DELETE** /app/post | 
[**postControllerDeleteReply**](PostApi.md#postcontrollerdeletereply) | **DELETE** /app/post/reply | 
[**postControllerGetComments**](PostApi.md#postcontrollergetcomments) | **GET** /app/post/comment | 
[**postControllerGetPosts**](PostApi.md#postcontrollergetposts) | **GET** /app/post | 
[**postControllerGetReplies**](PostApi.md#postcontrollergetreplies) | **GET** /app/post/reply | 
[**postControllerUpdateComment**](PostApi.md#postcontrollerupdatecomment) | **PUT** /app/post/comment | 
[**postControllerUpdatePost**](PostApi.md#postcontrollerupdatepost) | **PUT** /app/post | 
[**postControllerUpdateReply**](PostApi.md#postcontrollerupdatereply) | **PUT** /app/post/reply | 


# **postControllerCreateComment**
> CommentResponseDTO postControllerCreateComment(createCommentDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearer
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').password = 'YOUR_PASSWORD';

final api = Openapi().getPostApi();
final CreateCommentDTO createCommentDTO = ; // CreateCommentDTO | 

try {
    final response = api.postControllerCreateComment(createCommentDTO);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PostApi->postControllerCreateComment: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createCommentDTO** | [**CreateCommentDTO**](CreateCommentDTO.md)|  | 

### Return type

[**CommentResponseDTO**](CommentResponseDTO.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postControllerCreatePost**
> PostResponseDTO postControllerCreatePost(createPostDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearer
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').password = 'YOUR_PASSWORD';

final api = Openapi().getPostApi();
final CreatePostDTO createPostDTO = ; // CreatePostDTO | 

try {
    final response = api.postControllerCreatePost(createPostDTO);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PostApi->postControllerCreatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createPostDTO** | [**CreatePostDTO**](CreatePostDTO.md)|  | 

### Return type

[**PostResponseDTO**](PostResponseDTO.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postControllerCreateReply**
> ReplyResponseDTO postControllerCreateReply(createReplyDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearer
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').password = 'YOUR_PASSWORD';

final api = Openapi().getPostApi();
final CreateReplyDTO createReplyDTO = ; // CreateReplyDTO | 

try {
    final response = api.postControllerCreateReply(createReplyDTO);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PostApi->postControllerCreateReply: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createReplyDTO** | [**CreateReplyDTO**](CreateReplyDTO.md)|  | 

### Return type

[**ReplyResponseDTO**](ReplyResponseDTO.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postControllerDeleteComment**
> postControllerDeleteComment(deleteCommentDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearer
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').password = 'YOUR_PASSWORD';

final api = Openapi().getPostApi();
final DeleteCommentDTO deleteCommentDTO = ; // DeleteCommentDTO | 

try {
    api.postControllerDeleteComment(deleteCommentDTO);
} catch on DioError (e) {
    print('Exception when calling PostApi->postControllerDeleteComment: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deleteCommentDTO** | [**DeleteCommentDTO**](DeleteCommentDTO.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postControllerDeletePost**
> postControllerDeletePost(deletePostDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearer
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').password = 'YOUR_PASSWORD';

final api = Openapi().getPostApi();
final DeletePostDTO deletePostDTO = ; // DeletePostDTO | 

try {
    api.postControllerDeletePost(deletePostDTO);
} catch on DioError (e) {
    print('Exception when calling PostApi->postControllerDeletePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deletePostDTO** | [**DeletePostDTO**](DeletePostDTO.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postControllerDeleteReply**
> postControllerDeleteReply(deleteReplyDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearer
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').password = 'YOUR_PASSWORD';

final api = Openapi().getPostApi();
final DeleteReplyDTO deleteReplyDTO = ; // DeleteReplyDTO | 

try {
    api.postControllerDeleteReply(deleteReplyDTO);
} catch on DioError (e) {
    print('Exception when calling PostApi->postControllerDeleteReply: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deleteReplyDTO** | [**DeleteReplyDTO**](DeleteReplyDTO.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postControllerGetComments**
> BuiltList<CommentResponseDTO> postControllerGetComments(getCommentsDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPostApi();
final GetCommentsDTO getCommentsDTO = ; // GetCommentsDTO | 

try {
    final response = api.postControllerGetComments(getCommentsDTO);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PostApi->postControllerGetComments: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **getCommentsDTO** | [**GetCommentsDTO**](GetCommentsDTO.md)|  | 

### Return type

[**BuiltList&lt;CommentResponseDTO&gt;**](CommentResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postControllerGetPosts**
> BuiltList<PostResponseDTO> postControllerGetPosts()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPostApi();

try {
    final response = api.postControllerGetPosts();
    print(response);
} catch on DioError (e) {
    print('Exception when calling PostApi->postControllerGetPosts: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;PostResponseDTO&gt;**](PostResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postControllerGetReplies**
> BuiltList<ReplyResponseDTO> postControllerGetReplies(getRepliesDTO)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getPostApi();
final GetRepliesDTO getRepliesDTO = ; // GetRepliesDTO | 

try {
    final response = api.postControllerGetReplies(getRepliesDTO);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PostApi->postControllerGetReplies: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **getRepliesDTO** | [**GetRepliesDTO**](GetRepliesDTO.md)|  | 

### Return type

[**BuiltList&lt;ReplyResponseDTO&gt;**](ReplyResponseDTO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postControllerUpdateComment**
> CommentResponseDTO postControllerUpdateComment(updateCommentDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearer
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').password = 'YOUR_PASSWORD';

final api = Openapi().getPostApi();
final UpdateCommentDTO updateCommentDTO = ; // UpdateCommentDTO | 

try {
    final response = api.postControllerUpdateComment(updateCommentDTO);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PostApi->postControllerUpdateComment: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateCommentDTO** | [**UpdateCommentDTO**](UpdateCommentDTO.md)|  | 

### Return type

[**CommentResponseDTO**](CommentResponseDTO.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postControllerUpdatePost**
> PostResponseDTO postControllerUpdatePost(updatePostDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearer
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').password = 'YOUR_PASSWORD';

final api = Openapi().getPostApi();
final UpdatePostDTO updatePostDTO = ; // UpdatePostDTO | 

try {
    final response = api.postControllerUpdatePost(updatePostDTO);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PostApi->postControllerUpdatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updatePostDTO** | [**UpdatePostDTO**](UpdatePostDTO.md)|  | 

### Return type

[**PostResponseDTO**](PostResponseDTO.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postControllerUpdateReply**
> ReplyResponseDTO postControllerUpdateReply(updateReplyDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP basic authorization: bearer
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').password = 'YOUR_PASSWORD';

final api = Openapi().getPostApi();
final UpdateReplyDTO updateReplyDTO = ; // UpdateReplyDTO | 

try {
    final response = api.postControllerUpdateReply(updateReplyDTO);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PostApi->postControllerUpdateReply: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateReplyDTO** | [**UpdateReplyDTO**](UpdateReplyDTO.md)|  | 

### Return type

[**ReplyResponseDTO**](ReplyResponseDTO.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

