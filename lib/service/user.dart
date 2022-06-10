import 'package:flutter/material.dart';
import 'package:nacho_chat/model/user.dart';

import 'app.dart';

class UserService {
  UserService._();
  static final instance = UserService._();
  final appService = AppService.instance;

  var userList = <User>[];
  final filteredUserList = ValueNotifier<List<User>>([]);

  Future<void> getUserList() async {
    final response =
        await appService.api.getUserApi().usersControllerGetUsers();

    userList = response.data
            ?.map((userDTO) => User(
                id: int.parse(userDTO.id.toString()),
                username: userDTO.username))
            .toList() ??
        [];

    filteredUserList.value = userList;
  }
}
