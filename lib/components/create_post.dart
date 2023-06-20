import 'package:flutter/material.dart';
import 'package:nacho_chat/components/post_view.dart';
import 'package:nacho_chat/service/post.dart';
import 'package:openapi/openapi.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../service/app.dart';

class CreatePostWidget extends StatefulWidget {
  const CreatePostWidget({Key? key}) : super(key: key);

  @override
  State<CreatePostWidget> createState() => _CreatePostWidgetState();
}

class _CreatePostWidgetState extends State<CreatePostWidget> {
  final textController = TextEditingController();
  var isImage = false;
  PostResponseDTO? preview;

  PostResponseDTOBuilder mockPostBuilder() {
    final authorBuilder = PostResponseDTOAuthorBuilder()
      ..id = AppService.instance.userId
      ..username = AppService.instance.username;

    return PostResponseDTOBuilder()
      ..id = 1337
      ..author = authorBuilder
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
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
                          const Text("Image?"),
                          Switch(
                              value: isImage,
                              onChanged: (v) {
                                setState(() {
                                  textController.clear();
                                  isImage = v;
                                  preview = null;
                                });
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      width: 300,
                      child: isImage
                          ? TextFormField(
                              controller: textController,
                              keyboardType: TextInputType.url,
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  setState(() {
                                    preview = null;
                                  });
                                  return;
                                }
                                var isValidUrl =
                                    Uri.tryParse(textController.value.text)
                                            ?.hasAbsolutePath ??
                                        false;
                                if (!isValidUrl) {
                                  setState(() {
                                    preview = null;
                                  });
                                  return;
                                }
                                final builder = mockPostBuilder()
                                  ..contentType =
                                      PostResponseDTOContentTypeEnum.IMAGE_URL
                                  ..content = value;
                                setState(() {
                                  preview = builder.build();
                                });
                              },
                              maxLines: 1,
                              decoration:
                                  InputDecoration(label: Text(l10n.image_url)),
                            )
                          : TextFormField(
                              controller: textController,
                              keyboardType: TextInputType.multiline,
                              onChanged: ((value) {
                                if (value.isEmpty) {
                                  setState(() {
                                    preview = null;
                                  });
                                  return;
                                }
                                final builder = mockPostBuilder()
                                  ..contentType =
                                      PostResponseDTOContentTypeEnum.TEXT
                                  ..content = value;
                                setState(() {
                                  preview = builder.build();
                                });
                              }),
                              maxLines: null,
                              maxLength: 500,
                              decoration:
                                  InputDecoration(label: Text(l10n.content)),
                            ),
                    ),
                    preview != null
                        ? ConstrainedBox(
                            constraints: const BoxConstraints(
                                minWidth: 300, maxWidth: 500),
                            child: SizedBox(
                              width: width * 0.5,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Card(
                                    child: PostView(
                                      post: preview!,
                                      isInList: false,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                    ElevatedButton(
                      child: Text(l10n.create),
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
                                contentType:
                                    CreatePostDTOContentTypeEnum.IMAGE_URL);
                          }
                        } else {
                          await PostService.instance.createPost(
                              content: textController.value.text,
                              contentType: CreatePostDTOContentTypeEnum.TEXT);
                        }
                        PostService.instance.getPosts();
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
