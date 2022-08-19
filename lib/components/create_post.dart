import 'package:flutter/material.dart';
import 'package:nacho_chat/service/post.dart';

class CreatePostWidget extends StatefulWidget {
  const CreatePostWidget({Key? key}) : super(key: key);

  @override
  State<CreatePostWidget> createState() => _CreatePostWidgetState();
}

class _CreatePostWidgetState extends State<CreatePostWidget> {
  final textController = TextEditingController();
  var isImage = false;

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
                constraints: BoxConstraints.tight(Size(500, 300)),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        "Create Post",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Image?"),
                            Switch(
                                value: isImage,
                                onChanged: (v) {
                                  setState(() {
                                    textController.clear();
                                    isImage = v;
                                  });
                                }),
                          ],
                        ),
                      ),
                      Container(
                        height: 150,
                        child: isImage
                            ? TextFormField(
                                controller: textController,
                                keyboardType: TextInputType.url,
                                maxLines: 1,
                                decoration: const InputDecoration(
                                    label: Text("Image URL")),
                              )
                            : TextFormField(
                                controller: textController,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                maxLength: 500,
                                decoration: const InputDecoration(
                                    label: Text("Content")),
                              ),
                      ),
                      ElevatedButton(
                        child: const Text("Create"),
                        onPressed: () async {
                          if (textController.value.text.isEmpty) return;
                          if (isImage) {
                            var isValidUrl =
                                Uri.tryParse(textController.value.text)
                                        ?.hasAbsolutePath ??
                                    false;
                            if (!isValidUrl) {
                              return;
                            } else {
                              await PostService.instance.createPost(
                                  content: textController.value.text,
                                  contentType: "IMAGE_URL");
                            }
                          } else {
                            await PostService.instance.createPost(
                                content: textController.value.text,
                                contentType: "TEXT");
                          }
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
