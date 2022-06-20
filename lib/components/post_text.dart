import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nacho_chat/service/utils.dart';
import 'package:openapi/openapi.dart';

class PostText extends StatelessWidget {
  final PostResponseDTO post;

  const PostText({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Text(post.content),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                  "${post.author?.username ?? ""}, ${formatPostedDate(post.createdAt)}",
                  style: Theme.of(context).textTheme.labelSmall),
            ],
          ),
        )
      ],
    );
  }
}
