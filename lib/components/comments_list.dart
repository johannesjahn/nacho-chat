import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nacho_chat/service/post.dart';
import 'package:openapi/openapi.dart';

import '../service/utils.dart';
import 'avatar.dart';

class CommentsList extends StatefulWidget {
  const CommentsList({
    Key? key,
    required this.width,
    required this.comments,
  }) : super(key: key);

  final double width;
  final List<CommentResponseDTO> comments;

  @override
  State<CommentsList> createState() => _CommentsListState();
}

class _CommentsListState extends State<CommentsList> {
  var showReplyEntry = false;
  var isSubmitting = false;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final l10n = AppLocalizations.of(context)!;

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 300, maxWidth: 500),
      child: SizedBox(
        width: width * 0.5,
        child: Column(children: [
          ...widget.comments.map((comment) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(comment.content),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            NachoAvatar(user: comment.author!, radius: 20),
                            Text(
                                "${comment.author?.username ?? ""}, ${formatPostedDate(comment.createdAt)}",
                                style: Theme.of(context).textTheme.labelSmall),
                          ],
                        ),
                        comment.replies.isNotEmpty
                            ? SizedBox(
                                width: width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(l10n.replies,
                                        style: theme.textTheme.headlineSmall),
                                  ],
                                ))
                            : const SizedBox(),
                        ...comment.replies.map((reply) => Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Card(
                                color: theme.colorScheme.secondaryContainer,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(reply.content),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          NachoAvatar(
                                              user: reply.author!, radius: 20),
                                          Text(
                                              "${reply.author?.username ?? ""}, ${formatPostedDate(reply.createdAt)}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(
                          width: width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      showReplyEntry = !showReplyEntry;
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(l10n.new_reply),
                                      AnimatedRotation(
                                        turns: showReplyEntry ? 0.5 : 0,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        child:
                                            const Icon(Icons.arrow_drop_down),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          child: SizedBox(
                            width: width,
                            height: showReplyEntry ? null : 0,
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
                                        label: Text(l10n.type_a_reply)),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: isSubmitting
                                        ? const CircularProgressIndicator()
                                        : ElevatedButton(
                                            child: Text(l10n.submit),
                                            onPressed: () async {
                                              try {
                                                setState(() {
                                                  isSubmitting = true;
                                                });
                                                await PostService.instance
                                                    .createReply(
                                                        commentId: comment.id,
                                                        content: textController
                                                            .text);
                                                textController.clear();
                                                await PostService.instance
                                                    .getComments();
                                              } finally {
                                                setState(() {
                                                  isSubmitting = false;
                                                  showReplyEntry = false;
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
                      ],
                    ),
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
