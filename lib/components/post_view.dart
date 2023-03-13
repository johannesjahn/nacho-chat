import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nacho_chat/components/avatar.dart';
import 'package:nacho_chat/service/utils.dart';
import 'package:openapi/openapi.dart';

class PostView extends StatelessWidget {
  final PostResponseDTO post;
  final bool isInList;

  const PostView({Key? key, required this.post, this.isInList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

    return Column(
      children: [
        Expanded(
          child: Center(
            child: post.contentType == "TEXT"
                ? Text(
                    post.content,
                    textAlign: TextAlign.center,
                  )
                : ConstrainedBox(
                    constraints:
                        BoxConstraints.loose(Size(width / 2.5, height / 3)),
                    child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Builder(builder: (context) {
                          try {
                            if (Platform.isAndroid || Platform.isIOS) {
                              return CachedNetworkImage(imageUrl: post.content);
                            } else {
                              return Image.network(post.content);
                            }
                          } catch (e) {
                            return Image.network(post.content);
                          }
                        })),
                  ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              NachoAvatar(userId: post.author?.id, radius: 10),
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
