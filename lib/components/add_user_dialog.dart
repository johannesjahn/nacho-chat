import 'package:flutter/material.dart';
import 'package:nacho_chat/components/user_list.dart';

class AddUserDialog extends StatelessWidget {
  const AddUserDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text("Add User"),
      content: UserList(),
    );
  }
}
