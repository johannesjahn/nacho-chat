import 'package:flutter/material.dart';
import 'package:nacho_chat/service/post.dart';

class CreatePostWidget extends StatefulWidget {
  const CreatePostWidget({Key? key}) : super(key: key);

  @override
  State<CreatePostWidget> createState() => _CreatePostWidgetState();
}

class _CreatePostWidgetState extends State<CreatePostWidget> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints.tight(Size(500, 200)),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        "Create Post",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      TextFormField(
                        controller: textController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        maxLength: 500,
                        decoration:
                            const InputDecoration(label: Text("Content")),
                      ),
                      ElevatedButton(
                        child: const Text("Create"),
                        onPressed: () async {
                          if (textController.value.text.isEmpty) return;
                          await PostService.instance
                              .createPost(content: textController.value.text);
                          Navigator.pop(context);
                          PostService.instance.getPosts();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
