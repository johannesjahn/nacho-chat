import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nacho_chat/service/app.dart';
import 'package:openapi/openapi.dart';

class TextMessageContainer extends StatefulWidget {
  const TextMessageContainer({
    super.key,
    required this.message,
  });

  final MessageResponseDTO message;

  @override
  State<TextMessageContainer> createState() => _TextMessageContainerState();
}

class _TextMessageContainerState extends State<TextMessageContainer> {
  var isExpanded = false;
  var hasOverflow = false;
  int? maxLines = 3;

  @override
  void initState() {
    setState(() {
      hasOverflow = widget.message.content.length > 500;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isAuthor = widget.message.author.id == AppService.instance.userId;
    final theme = Theme.of(context);
    return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isAuthor)
                  Text(widget.message.author.username,
                      style: TextStyle(color: theme.hintColor, fontSize: 9)),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    widget.message.content,
                    maxLines: maxLines,
                  ),
                ),
                Text(formatPostedDate(widget.message.createdAt, context),
                    style: TextStyle(color: theme.hintColor, fontSize: 9))
              ],
            ),
            if (hasOverflow)
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        isExpanded = !isExpanded;
                        maxLines = isExpanded ? null : 3;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(isExpanded ? l10n.show_less : l10n.show_more),
                        AnimatedRotation(
                          turns: isExpanded ? 0.5 : 0,
                          duration: const Duration(milliseconds: 300),
                          child: const Icon(Icons.arrow_drop_down),
                        )
                      ],
                    )),
              )
          ],
        ));
  }
}
