import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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

  var showAvatarEdit = false;

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
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(
          title: Text(l10n.profile),
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
                    Stack(
                      children: [
                        NachoAvatar(
                          user: value,
                          radius: width / 6,
                        ),
                        if (AppService.instance.hive.get("username") ==
                            value.username)
                          MouseRegion(
                            onEnter: (event) {
                              setState(() {
                                showAvatarEdit = true;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                showAvatarEdit = false;
                              });
                            },
                            child: GestureDetector(
                              onTap: () async {
                                try {
                                  await UserService.instance.uploadAvatar();
                                  NachoAvatar.profileHash = DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString();
                                  setState(() {});
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              l10n.error_uploading_avatar)));
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.all(width / (6 * 5)),
                                child: AnimatedOpacity(
                                  opacity: showAvatarEdit ? 1 : 0.3,
                                  duration: const Duration(milliseconds: 200),
                                  child: SizedBox(
                                      height: width / 3,
                                      width: width / 3,
                                      child: const CircleAvatar(
                                        backgroundColor: Colors.black38,
                                        child: Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        ),
                                      )),
                                ),
                              ),
                            ),
                          )
                      ],
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
