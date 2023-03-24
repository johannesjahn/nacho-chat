import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

import 'app.dart';

class UserService {
  UserService._();
  static final instance = UserService._();
  final appService = AppService.instance;

  final me = ValueNotifier<UserResponseDTO?>(null);
  var userList = <UserResponseDTO>[];
  final filteredUserList = ValueNotifier<List<UserResponseDTO>>([]);

  Future<void> getMe() async {
    final response = await appService.api.getUserApi().usersControllerGetMe();

    me.value = response.data!;
  }

  Future<void> getUserList() async {
    final response =
        await appService.api.getUserApi().usersControllerGetUsers();

    userList = response.data?.toList() ?? [];

    filteredUserList.value = userList;
  }

  Future<void> uploadAvatar() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      var bytes = result.files.first.bytes;
      if (result.files.first.path != null) {
        bytes ??= await File(result.files.first.path!).readAsBytes();
      }
      if (bytes == null) {
        throw Exception("No bytes found");
      }
      await appService.api.getUserApi().usersControllerUploadAvatar(
          file: MultipartFile.fromBytes(bytes, filename: result.files[0].name));
    } else {
      // User canceled the picker
    }
  }
}
