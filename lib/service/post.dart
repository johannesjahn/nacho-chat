import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
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

  static const _cacheKey = 'cached_posts';

  void _loadCachedPosts() {
    try {
      final cached = appService.hive.get(_cacheKey);
      if (cached != null && posts.value.isEmpty) {
        final decoded = jsonDecode(cached);
        final builtList = standardSerializers.deserialize(
          decoded,
          specifiedType: const FullType(BuiltList, [FullType(PostResponseDTO)]),
        ) as BuiltList<PostResponseDTO>;
        posts.value = builtList.toList();
      }
    } catch (_) {}
  }

  void _savePosts(List<PostResponseDTO> postList) {
    try {
      final builtList = BuiltList<PostResponseDTO>(postList);
      final serialized = standardSerializers.serialize(
        builtList,
        specifiedType: const FullType(BuiltList, [FullType(PostResponseDTO)]),
      );
      appService.hive.put(_cacheKey, jsonEncode(serialized));
    } catch (_) {}
  }

  Future<List<PostResponseDTO>> getPosts() async {
    _loadCachedPosts();

    final response = await appService.api.getPostApi().postControllerGetPosts();

    final fetchedPosts = response.data?.toList() ?? [];
    posts.value = fetchedPosts;
    _savePosts(fetchedPosts);

    return fetchedPosts;
  }

  Future<void> refreshSelectedPost() async {
    if (selectedPost.value != null) {
      final response = await appService.api
          .getPostApi()
          .postControllerGetPost(postId: selectedPost.value!.id);

      selectedPost.value = response.data;
    }
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

  Future<void> likePost({required num postId}) async {
    await appService.api.getPostApi().postControllerLikePost(postId: postId);
  }
}
