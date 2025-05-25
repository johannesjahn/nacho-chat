import 'package:flutter/material.dart';
import 'package:nacho_chat/components/avatar.dart';
import 'package:nacho_chat/service/chat.dart';
import 'package:openapi/openapi.dart';
import 'package:nacho_chat/l10n/app_localizations.dart';

import '../service/user.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final selectedUserIds = <num>[];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final l10n = AppLocalizations.of(context)!;

    return SizedBox(
      height: size.height * 3 / 4,
      width: size.width / 3,
      child: ValueListenableBuilder<List<UserResponseDTO>>(
        valueListenable: UserService.instance.filteredUserList,
        builder:
            (context, value, widget) => SingleChildScrollView(
              child: Column(
                children: [
                  ...value.map(
                    (user) => Card(
                      child: InkWell(
                        onTap: () {
                          if (selectedUserIds.contains(user.id)) {
                            selectedUserIds.remove(user.id);
                          } else {
                            selectedUserIds.add(user.id);
                          }
                          setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    child: NachoAvatar(user: user, radius: 20),
                                  ),
                                  Text(user.username),
                                ],
                              ),
                              Checkbox(
                                value: selectedUserIds.contains(user.id),
                                onChanged: (value) {
                                  if (value == true) {
                                    selectedUserIds.add(user.id);
                                  } else {
                                    selectedUserIds.remove(user.id);
                                  }
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width / 3,
                    margin: const EdgeInsets.only(top: 16),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (selectedUserIds.isEmpty) {
                          return;
                        }
                        await ChatService.instance.createConversation(
                          partnerIds: selectedUserIds,
                        );
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      },
                      child: Text(l10n.create_conversation),
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
