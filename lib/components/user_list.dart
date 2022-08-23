import 'package:flutter/material.dart';
import 'package:nacho_chat/service/chat.dart';

import '../model/user.dart';
import '../service/user.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height / 2,
      width: size.width / 3,
      child: ValueListenableBuilder<List<User>>(
          valueListenable: UserService.instance.filteredUserList,
          builder: (context, value, widget) => ListView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) => Card(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(value[index].username),
                            IconButton(
                              onPressed: () {
                                ChatService.instance.createConversation(
                                    partnerId: value[index].id);
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.add),
                            )
                          ]),
                    ),
                  ))),
    );
  }
}
