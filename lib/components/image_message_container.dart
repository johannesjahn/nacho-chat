import 'dart:io' show Platform;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nacho_chat/components/avatar.dart';
import 'package:nacho_chat/components/text_message_container.dart';
import 'package:nacho_chat/service/chat.dart';
import 'package:openapi/openapi.dart';

import '../service/app.dart';

class ImageMessageContainer extends StatelessWidget {
  const ImageMessageContainer({
    super.key,
    required this.message,
  });

  final MessageResponseDTO message;

  @override
  Widget build(BuildContext context) {
    final isAuthor =
        message.author.username == AppService.instance.hive.get("username");
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isAuthor)
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: Text(message.author.username,
                    style: TextStyle(color: theme.hintColor, fontSize: 9)),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints.loose(
                      Size(width / 2.5, (height / 3) - 66)),
                  child: Builder(builder: (context) {
                    try {
                      if (Platform.isAndroid || Platform.isIOS) {
                        return CachedNetworkImage(imageUrl: message.content);
                      } else {
                        return Image.network(message.content);
                      }
                    } catch (e) {
                      return Image.network(message.content);
                    }
                  }),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Spacer(),
                  Text(formatPostedDate(message.createdAt, context),
                      style: TextStyle(color: theme.hintColor, fontSize: 9))
                ],
              ),
            )
          ],
        ));
  }
}
