import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nacho_chat/components/post_view.dart';
import 'package:nacho_chat/service/post.dart';
import 'package:openapi/openapi.dart';

import '../service/utils.dart';

class PostDetail extends StatefulWidget {
  PostDetail({Key? key}) : super(key: key);

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
                    ConstrainedBox(
                      constraints:
                          const BoxConstraints(minWidth: 300, maxWidth: 500),
                      child: Container(
                        width: width * 0.5,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                              child: PostView(
                                post: post,
                                isInList: false,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Comments",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    ValueListenableBuilder<List<CommentResponseDTO>>(
                        valueListenable: postService.comments,
                        builder: (context, comments, child) {
                          return ConstrainedBox(
                            constraints: const BoxConstraints(
                                minWidth: 300, maxWidth: 500),
                            child: Container(
                              width: width * 0.5,
                              child: Column(children: [
                                ...comments.map((comment) => Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(comment.content),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                      "${comment.author?.username ?? ""}, ${formatPostedDate(comment.createdAt)}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelSmall),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))
                              ]),
                            ),
                          );
                        }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "New Comment",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    ConstrainedBox(
                      constraints:
                          const BoxConstraints(minWidth: 300, maxWidth: 500),
                      child: Container(
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
                                        label: Text("Type a comment…")),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: isSubmitting
                                        ? const CircularProgressIndicator()
                                        : ElevatedButton(
                                            child: Text("Submit"),
                                            onPressed: () async {
                                              if (textController
                                                  .value.text.isEmpty) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content: Text(
                                                      "Cannot send an empty comment"),
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
                                                await postService.getComments();
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
