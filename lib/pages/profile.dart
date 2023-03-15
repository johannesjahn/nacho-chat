import 'package:flutter/material.dart';

import '../service/app.dart';
import '../service/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              // ignore: prefer_interpolation_to_compose_strings
              Text(
                  "Hello, " + (AppService.instance.hive.get("username") ?? "")),
          actions: [],
        ),
        body: Container());
  }
}
