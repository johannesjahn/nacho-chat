import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

import '../service/utils.dart';
import 'avatar.dart';

class ReplyDisplay extends StatefulWidget {
  final ReplyResponseDTO reply;

  const ReplyDisplay({
    super.key,
    required this.reply,
  });

  @override
  State<ReplyDisplay> createState() => _ReplyDisplayState();
}

class _ReplyDisplayState extends State<ReplyDisplay> {
  var extended = false;
  int? maxLines = 3;
  var hasOverflow = false;

  @override
  void initState() {
    setState(() {
      hasOverflow = '\n'.allMatches(widget.reply.content).length > 3;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        color: theme.colorScheme.secondaryContainer,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    widget.reply.content,
                    maxLines: maxLines,
                  )),
              if (hasOverflow)
                SizedBox(
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            extended = !extended;
                            if (extended) {
                              maxLines = null;
                            } else {
                              maxLines = 3;
                            }
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(extended ? "Show less" : "Show more"),
                            AnimatedRotation(
                              turns: extended ? 0.5 : 0,
                              duration: const Duration(milliseconds: 300),
                              child: const Icon(Icons.arrow_drop_down),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  NachoAvatar(user: widget.reply.author!, radius: 20),
                  Text(
                      "${widget.reply.author?.username ?? ""}, ${formatPostedDate(widget.reply.createdAt)}",
                      style: Theme.of(context).textTheme.labelSmall),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
