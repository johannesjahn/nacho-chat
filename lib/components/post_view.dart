import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nacho_chat/components/avatar.dart';
import 'package:nacho_chat/service/post.dart';
import 'package:nacho_chat/service/utils.dart';
import 'package:openapi/openapi.dart';

class PostView extends StatelessWidget {
  final PostResponseDTO post;
  final bool isInList;
  final bool isPreview;

  const PostView(
      {super.key,
      required this.post,
      this.isInList = true,
      this.isPreview = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    Icon(
                      Icons.comment,
                      color: theme.secondaryHeaderColor,
                    ),
                    Text(post.numberOfComments.toString(),
                        style: const TextStyle(fontSize: 10)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (isPreview) {
                    return;
                  }
                  final index = PostService.instance.posts.value.indexOf(post);
                  final postBuilder = post.toBuilder()
                    ..liked = !post.liked
                    ..likes = !post.liked ? post.likes + 1 : post.likes - 1;
                  PostService.instance.posts.value[index] = postBuilder.build();
                  PostService.instance.posts.value = [
                    ...PostService.instance.posts.value
                  ];
                  if (!isInList) {
                    PostService.instance.selectedPost.value =
                        postBuilder.build();
                  }
                  PostService.instance.likePost(postId: post.id).then((a) {
                    logger.i("Post ${post.id} liked");
                  }).catchError((e) {
                    logger.e("Error liking post ${post.id}");
                    logger.e(e);
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.favorite,
                      color:
                          post.liked ? Colors.red : theme.secondaryHeaderColor,
                    ),
                    Text(post.likes.toString(),
                        style: const TextStyle(fontSize: 10)),
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: post.contentType == PostResponseDTOContentTypeEnum.TEXT
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
              Text(
                  "${post.author?.username ?? ""}, ${formatPostedDate(post.createdAt, context)}",
                  style: Theme.of(context).textTheme.labelSmall),
              NachoAvatar(user: post.author, radius: 20),
            ],
          ),
        )
      ],
    );
  }
}
