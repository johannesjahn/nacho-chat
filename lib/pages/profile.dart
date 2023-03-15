import 'package:flutter/material.dart';
import 'package:nacho_chat/components/avatar.dart';

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
        body: ValueListenableBuilder(
          valueListenable: UserService.instance.me,
          builder: (context, value, child) {
            if (value == null) {
              return const Center(child: CircularProgressIndicator());
            }
            final width = MediaQuery.of(context).size.width;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await UserService.instance.uploadAvatar();
                      },
                      child: NachoAvatar(
                        userId: value.id,
                        radius: width / 6,
                      ),
                    ),
                    Text(value.username,
                        style: Theme.of(context).textTheme.headlineLarge),
                  ],
                ),
              ],
            );
          },
        ));
  }
}
