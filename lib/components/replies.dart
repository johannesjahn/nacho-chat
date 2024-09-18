import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nacho_chat/components/reply_display.dart';
import 'package:openapi/openapi.dart';

import '../service/post.dart';

class Replies extends StatefulWidget {
  final CommentResponseDTO comment;

  const Replies({super.key, required this.comment});

  @override
  State<Replies> createState() => _RepliesState();
}

class _RepliesState extends State<Replies> {
  var showReplyEntry = false;
  var isSubmitting = false;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        widget.comment.replies.isNotEmpty
            ? SizedBox(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(l10n.replies, style: theme.textTheme.headlineSmall),
                  ],
                ))
            : const SizedBox(),
        ...widget.comment.replies.map((reply) => ReplyDisplay(
              reply: reply,
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
                        duration: const Duration(milliseconds: 300),
                        child: const Icon(Icons.arrow_drop_down),
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
                    maxLines: 2,
                    minLines: 1,
                    maxLength: 100,
                    decoration: InputDecoration(label: Text(l10n.type_a_reply)),
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
                                await PostService.instance.createReply(
                                    commentId: widget.comment.id,
                                    content: textController.text);
                                textController.clear();
                                final commentsFetch =
                                    PostService.instance.getComments();
                                final postFetch =
                                    PostService.instance.getPosts();
                                final selectedPostRefresh =
                                    PostService.instance.refreshSelectedPost();

                                await Future.wait([
                                  commentsFetch,
                                  postFetch,
                                  selectedPostRefresh
                                ]);
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
    );
  }
}
