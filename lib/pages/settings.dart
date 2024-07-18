import 'package:flutter/material.dart';
import 'package:nacho_chat/components/version_display.dart';
import 'package:nacho_chat/pages/change_password.dart';
import 'package:nacho_chat/service/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../service/app.dart';
import 'login.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  AppService appService = AppService.instance;

  var versionTapCount = 0;
  var lastVersionTap = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: SingleChildScrollView(
        child: Column(children: [
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: Text(l10n.dark_mode),
            onTap: () {
              SettingsService.instance.darkMode.value =
                  !SettingsService.instance.darkMode.value;
            },
            trailing: ValueListenableBuilder<bool>(
                valueListenable: SettingsService.instance.darkMode,
                builder: (context, value, child) {
                  return Switch(
                    value: value,
                    onChanged: (value) {
                      SettingsService.instance.darkMode.value = value;
                    },
                  );
                }),
          ),
          ListTile(
            leading: const Icon(Icons.numbers),
            title: Text(l10n.version),
            trailing: const VersionDisplay(),
            onTap: () {
              final now = DateTime.now();
              if (now.difference(lastVersionTap).inMilliseconds > 200) {
                versionTapCount = 0;
              }
              versionTapCount++;
              lastVersionTap = now;
              if (versionTapCount == 10) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Feeling like a hacker?"),
                      duration: Duration(seconds: 2)),
                );
              } else if (versionTapCount == 30) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("You gotta be kidding me…"),
                      duration: Duration(seconds: 2)),
                );
              } else if (versionTapCount == 50) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Alright, you're persistent…"),
                      duration: Duration(seconds: 2)),
                );
              } else if (versionTapCount == 70) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("You're not gonna give up, are you?"),
                      duration: Duration(seconds: 2)),
                );
              } else if (versionTapCount == 90) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Here is your egg: 🥚"),
                    duration: Duration(seconds: 5)));
                versionTapCount = 0;
              }
            },
          ),
          ListTile(
            title: Text(l10n.change_password),
            leading: const Icon(Icons.lock),
            onTap: () {
              Navigator.push(context, DefaultRoute(const ChangePasswordPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(l10n.logout),
            onTap: () async {
              await AppService.instance.logout();
              if (context.mounted) {
                Navigator.pushReplacement(
                    context, DefaultRoute(const LoginPage()));
              }
            },
          ),
        ]),
      ),
    );
  }
}
