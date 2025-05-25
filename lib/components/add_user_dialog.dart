import 'package:flutter/material.dart';
import 'package:nacho_chat/l10n/app_localizations.dart';
import 'package:nacho_chat/components/user_list.dart';

class AddUserDialog extends StatelessWidget {
  const AddUserDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AlertDialog(title: Text(l10n.add_user), content: const UserList());
  }
}
