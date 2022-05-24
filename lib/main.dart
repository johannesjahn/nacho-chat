import 'package:flutter/material.dart';
import 'package:nacho_chat/pages/chat.dart';
import 'package:nacho_chat/pages/login.dart';
import 'package:nacho_chat/service/app.dart';
import 'package:nacho_chat/service/auth.dart';
import 'package:provider/provider.dart';

import 'pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppService.instance.init();

  runApp(const NachoChat());
}

class NachoChat extends StatelessWidget {
  const NachoChat({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final initialRoute = AppService.instance.hive.get("access_token") == null
        ? LoginPage()
        : HomePage();

    return MaterialApp(
      title: 'Nacho Chat',
      theme: ThemeData(
          colorSchemeSeed: const Color.fromARGB(100, 11, 11, 200),
          brightness: Brightness.dark,
          useMaterial3: true),
      home: initialRoute,
    );
  }
}
