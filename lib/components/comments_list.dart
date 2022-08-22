import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

import '../service/utils.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({
    Key? key,
    required this.width,
    required this.comments,
  }) : super(key: key);

  final double width;
  final List<CommentResponseDTO> comments;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 300, maxWidth: 500),
      child: SizedBox(
        width: width * 0.5,
        child: Column(children: [
          ...comments.map((comment) => Padding(
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
                            Text(
                                "${comment.author?.username ?? ""}, ${formatPostedDate(comment.createdAt)}",
                                style: Theme.of(context).textTheme.labelSmall),
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
  }
}
