import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nacho_chat/components/avatar.dart';
import 'package:openapi/openapi.dart';

import '../service/app.dart';
import '../service/user.dart';

class ProfilePage extends StatefulWidget {
  final UserResponseDTO? user;

  const ProfilePage({Key? key, this.user}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ValueNotifier<UserResponseDTO?> user = ValueNotifier(null);

  @override
  void initState() {
    if (widget.user != null) {
      user = ValueNotifier(widget.user);
    } else {
      user = UserService.instance.me;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              // ignore: prefer_interpolation_to_compose_strings
              const Text("Profile"),
        ),
        body: ValueListenableBuilder(
          valueListenable: user,
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
                    NachoAvatar(
                      user: value,
                      radius: width / 6,
                      onClick: () {
                        if (AppService.instance.hive.get("username") ==
                            value.username) {
                          UserService.instance.uploadAvatar();
                        }
                      },
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
