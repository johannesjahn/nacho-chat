import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

import 'app.dart';

class PostService {
  PostService._();

  static final instance = PostService._();

  final appService = AppService.instance;

  final posts = ValueNotifier<List<PostResponseDTO>>([]);
  final comments = ValueNotifier<List<CommentResponseDTO>>([]);
  final selectedPost = ValueNotifier<PostResponseDTO?>(null);

  Future<List<PostResponseDTO>> getPosts() async {
    final response = await appService.api.getPostApi().postControllerGetPosts();

    posts.value = response.data?.toList() ?? [];

    return response.data?.toList() ?? [];
  }

  Future<PostResponseDTO?> createPost(
      {required String content,
      CreatePostDTOContentTypeEnum contentType =
          CreatePostDTOContentTypeEnum.TEXT}) async {
    final dto = CreatePostDTOBuilder()
      ..content = content
      ..contentType = contentType;

    final response = await appService.api
        .getPostApi()
        .postControllerCreatePost(createPostDTO: dto.build());

    return response.data;
  }

  Future<void> getComments() async {
    final response = await appService.api
        .getPostApi()
        .postControllerGetComments(postId: selectedPost.value!.id);

    comments.value = response.data?.toList() ?? [];
  }

  Future<CommentResponseDTO?> createComment(
      {required num postId, required String content}) async {
    final dto = CreateCommentDTOBuilder()
      ..content = content
      ..postId = postId;

    final response = await appService.api
        .getPostApi()
        .postControllerCreateComment(createCommentDTO: dto.build());

    return response.data;
  }

  Future<ReplyResponseDTO?> createReply(
      {required num commentId, required String content}) async {
    final dto = CreateReplyDTOBuilder()
      ..content = content
      ..commentId = commentId;

    final response = await appService.api
        .getPostApi()
        .postControllerCreateReply(createReplyDTO: dto.build());

    return response.data;
  }
}
