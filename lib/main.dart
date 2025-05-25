// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:nacho_chat/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nacho_chat/pages/login.dart';
import 'package:nacho_chat/service/app.dart';
import 'package:nacho_chat/service/settings.dart';

import 'pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppService.instance.init();

  runApp(const NachoChat());
}

class NachoChat extends StatelessWidget {
  const NachoChat({super.key});

  @override
  Widget build(BuildContext context) {
    final initialRoute =
        AppService.instance.accessToken == null
            ? const LoginPage()
            : const HomePage();

    return ValueListenableBuilder<bool>(
      valueListenable: SettingsService.instance.darkMode,
      builder: (context, darkMode, child) {
        return MaterialApp(
          title: 'Nacho Chat',
          theme: ThemeData(
            colorSchemeSeed: const Color.fromARGB(100, 11, 11, 200),
            brightness: darkMode ? Brightness.dark : Brightness.light,
            useMaterial3: true,
          ),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en', ''), Locale('de', '')],
          home: initialRoute,
        );
      },
    );
  }
}
