import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: Text(
                widget.message.content,
                maxLines: maxLines,
              ),
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
                    child: Text(isExpanded ? l10n.show_less : l10n.show_more)),
              )
          ],
        ));
  }
}
