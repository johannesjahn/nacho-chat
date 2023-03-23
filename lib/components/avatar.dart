import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

import '../pages/profile.dart';
import '../service/constants.dart';
import '../service/utils.dart';

class NachoAvatar extends StatelessWidget {
  final UserResponseDTO? user;
  final double radius;
  final Function? onClick;

  const NachoAvatar(
      {required this.user, this.radius = 10, this.onClick, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = "";
    if (radius < 50) {
      size = "?size=200";
    } else if (radius < 100) {
      size = "?size=400";
    } else {
      size = "?size=800";
    }

    return Padding(
      padding: EdgeInsets.all(radius / 5),
      child: GestureDetector(
        onTap: () {
          if (onClick != null) {
            onClick!();
            return;
          }
          if (user != null) {
            Navigator.of(context).push(DefaultRoute(ProfilePage(
              user: user,
            )));
            return;
          }
        },
        child: SizedBox(
          height: radius * 2,
          width: radius * 2,
          child: CircleAvatar(
              radius: radius,
              backgroundImage: NetworkImage(
                  Urls.avatar + (user?.id.toString() ?? "-1") + size)),
        ),
      ),
    );
  }
}
