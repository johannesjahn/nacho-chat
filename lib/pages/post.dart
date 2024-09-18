import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nacho_chat/components/post_view.dart';
import 'package:nacho_chat/service/post.dart';
import 'package:openapi/openapi.dart';

import '../components/comments_list.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({super.key});

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  final postService = PostService.instance;
  final textController = TextEditingController();
  var isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder<PostResponseDTO?>(
          valueListenable: postService.selectedPost,
          builder: (context, post, child) {
            if (post == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return SingleChildScrollView(
              child: SizedBox(
                width: width,
                child: Column(
                  children: [
                    Hero(
                      tag: post.id,
                      child: ConstrainedBox(
                        constraints:
                            const BoxConstraints(minWidth: 300, maxWidth: 500),
                        child: SizedBox(
                          width: width * 0.5,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Card(
                                child: PostView(
                                  post: post,
                                  isInList: false,
                                  isPreview: false,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        l10n.comments,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    ValueListenableBuilder<List<CommentResponseDTO>>(
                        valueListenable: postService.comments,
                        builder: (context, comments, child) {
                          return CommentsList(
                            width: width,
                            comments: comments,
                          );
                        }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        l10n.new_comment,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    ConstrainedBox(
                      constraints:
                          const BoxConstraints(minWidth: 300, maxWidth: 500),
                      child: SizedBox(
                        width: width * 0.5,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  TextField(
                                    controller: textController,
                                    maxLines: 3,
                                    minLines: 1,
                                    maxLength: 100,
                                    decoration: InputDecoration(
                                        label: Text(l10n.type_a_comment)),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: isSubmitting
                                        ? const CircularProgressIndicator()
                                        : ElevatedButton(
                                            child: Text(l10n.submit),
                                            onPressed: () async {
                                              if (textController
                                                  .value.text.isEmpty) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text(l10n
                                                      .cannot_send_empty_comment),
                                                ));
                                                return;
                                              }

                                              try {
                                                setState(() {
                                                  isSubmitting = true;
                                                });
                                                await postService.createComment(
                                                    postId: postService
                                                        .selectedPost.value!.id,
                                                    content: textController
                                                        .value.text);
                                                textController.clear();

                                                final commentsFetch =
                                                    postService.getComments();
                                                final postFetch =
                                                    postService.getPosts();
                                                final selectedPostRefresh =
                                                    postService
                                                        .refreshSelectedPost();

                                                await Future.wait([
                                                  commentsFetch,
                                                  postFetch,
                                                  selectedPostRefresh
                                                ]);
                                              } finally {
                                                setState(() {
                                                  isSubmitting = false;
                                                });
                                              }
                                            },
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
