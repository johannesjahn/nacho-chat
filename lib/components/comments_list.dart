import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nacho_chat/components/replies.dart';
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
                        Replies(comment: comment),
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
