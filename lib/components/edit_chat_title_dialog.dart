import 'package:flutter/material.dart';
import 'package:nacho_chat/service/chat.dart';

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
    return AlertDialog(
      title: const Text('Edit chat title'),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            if (inputController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Title cannot be empty'),
                ),
              );
              return;
            }
            await ChatService.instance
                .updateChatTitleOfCurrentChat(newTitle: inputController.text);
            Navigator.of(context).pop();
          },
          child: const Text('Save'),
        ),
      ],
      content: TextField(
        controller: inputController,
        decoration: const InputDecoration(hintText: 'Enter new chat title'),
      ),
    );
  }
}
