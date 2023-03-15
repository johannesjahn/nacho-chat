import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:nacho_chat/model/user.dart';
import 'package:dio/dio.dart';

import 'app.dart';

class UserService {
  UserService._();
  static final instance = UserService._();
  final appService = AppService.instance;

  final me = ValueNotifier<User?>(null);
  var userList = <User>[];
  final filteredUserList = ValueNotifier<List<User>>([]);

  Future<void> getMe() async {
    final response = await appService.api.getUserApi().usersControllerGetMe();

    me.value = User(
        id: int.parse(response.data!.id.toString()),
        username: response.data!.username);
  }

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

  Future<void> uploadAvatar() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      final response = await appService.api
          .getUserApi()
          .usersControllerUploadAvatar(
              file: MultipartFile.fromBytes(result.files[0].bytes!,
                  filename: result.files[0].name));
    } else {
      // User canceled the picker
    }
  }
}
