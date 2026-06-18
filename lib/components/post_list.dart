import 'package:flutter/material.dart';
import 'package:nacho_chat/components/post_view.dart';
import 'package:nacho_chat/pages/post.dart';
import 'package:nacho_chat/service/post.dart';
import 'package:nacho_chat/service/utils.dart';
import 'package:openapi/openapi.dart';

class PostList extends StatelessWidget {
  final List<PostResponseDTO> posts;

  const PostList({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return _AnimatedPostCard(
          index: index,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: posts[index].id,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 300, maxWidth: 500),
                  child: SizedBox(
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
                                .push(DefaultRoute(const PostDetail()));
                          },
                          child: Card(
                            child: PostView(
                              post: posts[index],
                              isInList: true,
                              isPreview: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AnimatedPostCard extends StatefulWidget {
  final Widget child;
  final int index;

  const _AnimatedPostCard({required this.child, required this.index});

  @override
  State<_AnimatedPostCard> createState() => _AnimatedPostCardState();
}

class _AnimatedPostCardState extends State<_AnimatedPostCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.25),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    // Stagger per item, capped at 5 items to avoid long delays when scrolling
    final delayMs = widget.index.clamp(0, 5) * 70;
    if (delayMs == 0) {
      _controller.forward();
    } else {
      Future.delayed(Duration(milliseconds: delayMs), () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(position: _slide, child: widget.child),
    );
  }
}
