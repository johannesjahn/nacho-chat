import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

import 'app.dart';

class PostService {
  PostService._();

  static final instance = PostService._();

  final appService = AppService.instance;

  final posts = ValueNotifier<List<PostResponseDTO>>([]);

  Future<List<PostResponseDTO>> getPosts() async {
    final response = await appService.api.getPostApi().postControllerGetPosts();

    posts.value = response.data?.toList() ?? [];

    return response.data?.toList() ?? [];
  }

  Future<PostResponseDTO?> createPost() async {
    final dto = CreatePostDTOBuilder()..content = 'test';

    final response = await appService.api
        .getPostApi()
        .postControllerCreatePost(createPostDTO: dto.build());

    return response.data;
  }

  Future<CommentResponseDTO?> createComment() async {
    final dto = CreateCommentDTOBuilder()
      ..content = 'test'
      ..postId = 25;

    final response = await appService.api
        .getPostApi()
        .postControllerCreateComment(createCommentDTO: dto.build());

    return response.data;
  }

  Future<ReplyResponseDTO?> createReply() async {
    final dto = CreateReplyDTOBuilder()
      ..content = 'test'
      ..commentId = 9;

    final response = await appService.api
        .getPostApi()
        .postControllerCreateReply(createReplyDTO: dto.build());

    return response.data;
  }
}
