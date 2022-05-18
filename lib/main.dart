import 'package:flutter/material.dart';
import 'package:nacho_chat/pages/chat.dart';
import 'package:nacho_chat/pages/login.dart';
import 'package:nacho_chat/service/app.dart';
import 'package:nacho_chat/service/auth.dart';
import 'package:provider/provider.dart';

import 'pages/home.dart';

void main() async {
  await AppService.instance.init();

  runApp(const NachoChat());
}

class NachoChat extends StatelessWidget {
  const NachoChat({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final initialRoute =
        AppService.instance.hive.get("access_token") == null ? "/login" : "/";

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorSchemeSeed: const Color.fromARGB(100, 11, 11, 200),
          brightness: Brightness.dark,
          useMaterial3: true),
      initialRoute: initialRoute,
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case '/':
            page = const MyHomePage(
              title: "asdf",
            );
            break;
          case '/login':
            page = LoginPage();
            break;
          case '/chat':
            page = ChatPage();
            break;
          default:
            page = const MyHomePage(title: 'Flutter Demo Home Page');
            break;
        }

        return MaterialPageRoute(
            builder: (context) => page, settings: settings);
      },
    );
  }
}
