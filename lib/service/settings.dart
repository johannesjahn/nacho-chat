import 'package:flutter/material.dart';
import 'package:nacho_chat/service/app.dart';

class SettingsService {
  final darkMode = ValueNotifier<bool>(true);

  static final instance = SettingsService._();

  SettingsService._() {
    darkMode.value =
        AppService.instance.hive.get("dark_mode", defaultValue: "true") ==
            "true";
    darkMode.addListener(() {
      AppService.instance.hive.put("dark_mode", darkMode.value.toString());
    });
  }
}
