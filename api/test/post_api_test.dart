import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for PostApi
void main() {
  final instance = Openapi().getPostApi();

  group(PostApi, () {
    //Future<CommentResponseDTO> postControllerCreateComment(CreateCommentDTO createCommentDTO) async
    test('test postControllerCreateComment', () async {
      // TODO
    });

    //Future<PostResponseDTO> postControllerCreatePost(CreatePostDTO createPostDTO) async
    test('test postControllerCreatePost', () async {
      // TODO
    });

    //Future<ReplyResponseDTO> postControllerCreateReply(CreateReplyDTO createReplyDTO) async
    test('test postControllerCreateReply', () async {
      // TODO
    });

    //Future postControllerDeleteComment(DeleteCommentDTO deleteCommentDTO) async
    test('test postControllerDeleteComment', () async {
      // TODO
    });

    //Future postControllerDeletePost(DeletePostDTO deletePostDTO) async
    test('test postControllerDeletePost', () async {
      // TODO
    });

    //Future postControllerDeleteReply(DeleteReplyDTO deleteReplyDTO) async
    test('test postControllerDeleteReply', () async {
      // TODO
    });

    //Future<BuiltList<CommentResponseDTO>> postControllerGetComments(GetCommentsDTO getCommentsDTO) async
    test('test postControllerGetComments', () async {
      // TODO
    });

    //Future<BuiltList<PostResponseDTO>> postControllerGetPosts() async
    test('test postControllerGetPosts', () async {
      // TODO
    });

    //Future<BuiltList<ReplyResponseDTO>> postControllerGetReplies(GetRepliesDTO getRepliesDTO) async
    test('test postControllerGetReplies', () async {
      // TODO
    });

    //Future<CommentResponseDTO> postControllerUpdateComment(UpdateCommentDTO updateCommentDTO) async
    test('test postControllerUpdateComment', () async {
      // TODO
    });

    //Future<PostResponseDTO> postControllerUpdatePost(UpdatePostDTO updatePostDTO) async
    test('test postControllerUpdatePost', () async {
      // TODO
    });

    //Future<ReplyResponseDTO> postControllerUpdateReply(UpdateReplyDTO updateReplyDTO) async
    test('test postControllerUpdateReply', () async {
      // TODO
    });

  });
}
