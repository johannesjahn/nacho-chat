import 'package:flutter/material.dart';
import 'package:nacho_chat/model/user.dart';

import 'app.dart';
import 'constants.dart';

class UserService {
  UserService._();
  static final instance = UserService._();
  final appService = AppService.instance;

  var userList = <User>[];
  final filteredUserList = ValueNotifier<List<User>>([]);

  Future<void> getUserList() async {
    final response = UserListResponse.fromJson(
        (await appService.client.get(Urls.userList)).data);

    userList = User.fromResponseList(response.users);
    filteredUserList.value = userList;
  }
}
