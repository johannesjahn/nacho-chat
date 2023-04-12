import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nacho_chat/components/avatar.dart';
import 'package:nacho_chat/components/text_message_container.dart';
import 'package:nacho_chat/service/chat.dart';
import 'package:openapi/openapi.dart';
import 'dart:io' show Platform;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../service/app.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final inputController = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final l10n = AppLocalizations.of(context)!;

    return ValueListenableBuilder<ConversationResponseDTO?>(
      valueListenable: ChatService.instance.currentChat,
      builder: (context, value, widget) {
        if (value == null) {
          return Center(child: Text(l10n.select_a_conversation));
        }
        return Column(
          children: [
            Expanded(
              child: ValueListenableBuilder<List<MessageResponseDTO>>(
                  valueListenable: ChatService.instance.messagesNotifier,
                  builder: (context, value, widget) {
                    return ListView.builder(
                        itemCount: value.length,
                        reverse: true,
                        itemBuilder: (context, index) {
                          final message = value[index];
                          final isAuthor = message.author.username ==
                              AppService.instance.hive.get("username");
                          return Row(
                            mainAxisAlignment: isAuthor
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              !isAuthor
                                  ? NachoAvatar(user: message.author)
                                  : const SizedBox(),
                              GestureDetector(
                                onTap: () {
                                  if (message.contentType == 'IMAGE_URL') {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            child: Container(
                                              width: width,
                                              height: height,
                                              child: CachedNetworkImage(
                                                  imageUrl: message.content),
                                            ),
                                          );
                                        });
                                  }
                                },
                                child: Card(child: Builder(builder: (context) {
                                  if (message.contentType == 'IMAGE_URL') {
                                    return ConstrainedBox(
                                      constraints: BoxConstraints.loose(
                                          Size(width / 2.5, height / 3)),
                                      child: Container(
                                          padding: const EdgeInsets.all(16),
                                          child: Builder(builder: (context) {
                                            try {
                                              if (Platform.isAndroid ||
                                                  Platform.isIOS) {
                                                return CachedNetworkImage(
                                                    imageUrl: message.content);
                                              } else {
                                                return Image.network(
                                                    message.content);
                                              }
                                            } catch (e) {
                                              return Image.network(
                                                  message.content);
                                            }
                                          })),
                                    );
                                  } else if (message.contentType == 'TEXT') {
                                    return ConstrainedBox(
                                      constraints: BoxConstraints.loose(
                                          Size(width / 2.5, double.infinity)),
                                      child: TextMessageContainer(
                                          message: message),
                                    );
                                  } else {
                                    return Container(
                                        padding: const EdgeInsets.all(16),
                                        child:
                                            const Text('Unknown content type'));
                                  }
                                })),
                              ),
                              isAuthor
                                  ? NachoAvatar(
                                      user: message.author,
                                      radius: 20,
                                    )
                                  : const SizedBox()
                            ],
                          );
                        });
                  }),
            ),
            Card(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Row(children: [
                  Expanded(
                    child: TextFormField(
                      controller: inputController,
                      focusNode: focusNode,
                      onFieldSubmitted: (text) async {
                        if (text.isEmpty) {
                          showEmptySnackbar();
                          return;
                        }
                        inputController.clear();
                        await ChatService.instance.sendMessage(
                          conversationId: value.id.toInt(),
                          message: text,
                        );
                        focusNode.requestFocus();
                      },
                      decoration: const InputDecoration(
                        labelText: 'Message',
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        if (inputController.text.isEmpty) {
                          showEmptySnackbar();
                          return;
                        }
                        var isValidUrl =
                            Uri.tryParse(inputController.value.text)
                                    ?.hasAbsolutePath ??
                                false;
                        if (!isValidUrl) {
                          showInvalidUrlSnackbar();
                          return;
                        }
                        await ChatService.instance.sendMessage(
                            conversationId: value.id.toInt(),
                            message: inputController.text,
                            contentType: 'IMAGE_URL');
                        inputController.clear();
                      },
                      icon: const Icon(Icons.image)),
                  IconButton(
                      onPressed: () async {
                        if (inputController.text.isEmpty) {
                          showEmptySnackbar();
                          return;
                        }
                        await ChatService.instance.sendMessage(
                          conversationId: value.id.toInt(),
                          message: inputController.text,
                          contentType: 'TEXT',
                        );
                        inputController.clear();
                      },
                      icon: const Icon(Icons.send))
                ]),
              ),
            ),
          ],
        );
      },
    );
  }

  void showEmptySnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cannot send empty message')));
  }

  void showInvalidUrlSnackbar() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Invalid URL')));
  }
}
