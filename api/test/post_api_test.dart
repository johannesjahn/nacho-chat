import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for PostApi
void main() {
  final instance = Openapi().getPostApi();

  group(PostApi, () {
    // 
    //
    // Create comment with the authenticated user
    //
    //Future<CommentResponseDTO> postControllerCreateComment(CreateCommentDTO createCommentDTO) async
    test('test postControllerCreateComment', () async {
      // TODO
    });

    // 
    //
    // Create post with the authenticated user
    //
    //Future<PostResponseDTO> postControllerCreatePost(CreatePostDTO createPostDTO) async
    test('test postControllerCreatePost', () async {
      // TODO
    });

    // 
    //
    // Create reply with the authenticated user
    //
    //Future<ReplyResponseDTO> postControllerCreateReply(CreateReplyDTO createReplyDTO) async
    test('test postControllerCreateReply', () async {
      // TODO
    });

    // 
    //
    // Delete a comment that belongs to the currently authenticated user
    //
    //Future postControllerDeleteComment(DeleteCommentDTO deleteCommentDTO) async
    test('test postControllerDeleteComment', () async {
      // TODO
    });

    // 
    //
    // Delete a post that belongs to the currently authenticated user
    //
    //Future postControllerDeletePost(DeletePostDTO deletePostDTO) async
    test('test postControllerDeletePost', () async {
      // TODO
    });

    // 
    //
    // Delete reply with the authenticated user
    //
    //Future postControllerDeleteReply(DeleteReplyDTO deleteReplyDTO) async
    test('test postControllerDeleteReply', () async {
      // TODO
    });

    // 
    //
    // Get comments of a post
    //
    //Future<BuiltList<CommentResponseDTO>> postControllerGetComments(num postId) async
    test('test postControllerGetComments', () async {
      // TODO
    });

    // 
    //
    // Get all posts
    //
    //Future<BuiltList<PostResponseDTO>> postControllerGetPosts() async
    test('test postControllerGetPosts', () async {
      // TODO
    });

    // 
    //
    // Get replies of a comment
    //
    //Future<BuiltList<ReplyResponseDTO>> postControllerGetReplies(num commentId) async
    test('test postControllerGetReplies', () async {
      // TODO
    });

    // 
    //
    // Update a comment that belongs to the currently authenticated user
    //
    //Future<CommentResponseDTO> postControllerUpdateComment(UpdateCommentDTO updateCommentDTO) async
    test('test postControllerUpdateComment', () async {
      // TODO
    });

    // 
    //
    // Update a post that belongs to the currently authenticated user
    //
    //Future<PostResponseDTO> postControllerUpdatePost(UpdatePostDTO updatePostDTO) async
    test('test postControllerUpdatePost', () async {
      // TODO
    });

    // 
    //
    // Update reply with the authenticated user
    //
    //Future<ReplyResponseDTO> postControllerUpdateReply(UpdateReplyDTO updateReplyDTO) async
    test('test postControllerUpdateReply', () async {
      // TODO
    });

  });
}
