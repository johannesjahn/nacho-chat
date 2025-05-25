import 'package:flutter/material.dart';
import 'package:nacho_chat/l10n/app_localizations.dart';
import 'package:nacho_chat/components/replies.dart';
import 'package:openapi/openapi.dart';

import '../service/utils.dart';
import 'avatar.dart';

// ignore: must_be_immutable
class CommentDisplay extends StatefulWidget {
  final CommentResponseDTO comment;
  var hasOverflow = false;

  CommentDisplay({super.key, required this.comment}) {
    hasOverflow = '\n'.allMatches(comment.content).length > 3;
  }

  @override
  State<CommentDisplay> createState() => _CommentDisplayState();
}

class _CommentDisplayState extends State<CommentDisplay> {
  var extended = false;
  int? maxLines = 3;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                child: Text(
                  widget.comment.content,
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (widget.hasOverflow)
                SizedBox(
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            extended = !extended;
                            if (extended) {
                              maxLines = null;
                            } else {
                              maxLines = 3;
                            }
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(extended ? l10n.show_less : l10n.show_more),
                            AnimatedRotation(
                              turns: extended ? 0.5 : 0,
                              duration: const Duration(milliseconds: 300),
                              child: const Icon(Icons.arrow_drop_down),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  NachoAvatar(user: widget.comment.author!, radius: 20),
                  Text(
                    "${widget.comment.author?.username ?? ""}, ${formatPostedDate(widget.comment.createdAt, context)}",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              Replies(comment: widget.comment),
            ],
          ),
        ),
      ),
    );
  }
}
