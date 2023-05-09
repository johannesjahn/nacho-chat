import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:openapi/openapi.dart';

import 'comment_display.dart';

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
    final width = MediaQuery.of(context).size.width;
    final l10n = AppLocalizations.of(context)!;

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 300, maxWidth: 500),
      child: SizedBox(
        width: width * 0.5,
        child: Column(children: [
          ...widget.comments.map((comment) => CommentDisplay(
                comment: comment,
              ))
        ]),
      ),
    );
  }
}
