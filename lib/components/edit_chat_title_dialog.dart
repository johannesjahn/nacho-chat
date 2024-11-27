import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nacho_chat/service/chat.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditChatTitleDialog extends StatefulWidget {
  const EditChatTitleDialog({super.key, required this.initialTitle});

  final String initialTitle;

  @override
  State<EditChatTitleDialog> createState() => _EditChatTitleDialogState();
}

class _EditChatTitleDialogState extends State<EditChatTitleDialog> {
  final inputController = TextEditingController();

  @override
  void initState() {
    inputController.text = widget.initialTitle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      title: const Text('Edit chat title'),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
          },
          child: Text(l10n.cancel),
        ),
        TextButton(
          onPressed: () async {
            if (inputController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(l10n.title_can_not_be_empty),
                ),
              );
              return;
            }
            await ChatService.instance
                .updateChatTitleOfCurrentChat(newTitle: inputController.text);
            Navigator.of(context).pop();
          },
          child: Text(l10n.submit),
        ),
      ],
      content: TextField(
        controller: inputController,
        decoration: const InputDecoration(hintText: 'Enter new chat title'),
      ),
    );
  }
}
