import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nacho_chat/components/post_view.dart';
import 'package:nacho_chat/pages/post.dart';
import 'package:nacho_chat/service/post.dart';
import 'package:nacho_chat/service/utils.dart';
import 'package:openapi/openapi.dart';

class PostList extends StatelessWidget {
  final List<PostResponseDTO> posts;

  const PostList({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 300, maxWidth: 500),
                child: Container(
                  width: width * 0.5,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: GestureDetector(
                        onTap: () {
                          PostService.instance.selectedPost.value =
                              posts[index];
                          PostService.instance.getComments();
                          Navigator.of(context)
                              .push(DefaultRoute(PostDetail()));
                        },
                        child: Card(
                          child: PostView(post: posts[index]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
