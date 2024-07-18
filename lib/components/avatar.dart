import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:openapi/openapi.dart';

import '../pages/profile.dart';
import '../service/constants.dart';
import '../service/utils.dart';

class NachoAvatar extends StatefulWidget {
  final UserResponseDTO? user;
  final List<UserResponseDTO> users;
  final double radius;
  final Function? onClick;
  static var profileHash = DateTime.now().millisecondsSinceEpoch.toString();

  const NachoAvatar(
      {required this.user,
      this.radius = 10,
      this.onClick,
      this.users = const [],
      super.key});

  @override
  State<NachoAvatar> createState() => _NachoAvatarState();
}

class _NachoAvatarState extends State<NachoAvatar> {
  late final Timer timer;
  var currentIndex = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (widget.users.length > 1) {
        currentIndex = (currentIndex + 1) % widget.users.length;
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = "?profileHash=";
    if (widget.radius < 50) {
      size = "?size=200&profileHash=";
    } else if (widget.radius < 100) {
      size = "?size=400&profileHash=";
    } else {
      size = "?size=800&profileHash=";
    }

    final backgroundColor = Theme.of(context).colorScheme.background;

    return Padding(
      padding: EdgeInsets.all(widget.radius / 5),
      child: GestureDetector(
        onTap: () {
          if (widget.onClick != null) {
            widget.onClick!();
            return;
          }
          if (widget.user != null) {
            Navigator.of(context).push(DefaultRoute(ProfilePage(
              user: widget.user,
            )));
            return;
          }
        },
        child: SizedBox(
          height: widget.radius * 2,
          width: widget.radius * 2,
          child: Builder(builder: (context) {
            if (widget.users.length > 1) {
              return AnimatedSwitcher(
                key: Key(widget.users[currentIndex].id.toString()),
                duration: const Duration(seconds: 1),
                child: CircleAvatar(
                    radius: widget.radius,
                    backgroundColor: backgroundColor,
                    backgroundImage: NetworkImage(Urls.avatar +
                        (widget.users[currentIndex].id.toString()) +
                        size +
                        NachoAvatar.profileHash)),
              );
            }

            return ClipOval(
              child: SizedBox(
                width: widget.radius,
                height: widget.radius,
                child: CachedNetworkImage(
                  imageUrl: Urls.avatar +
                      (widget.user?.id.toString() ?? "-1") +
                      size +
                      NachoAvatar.profileHash,
                  placeholder: (context, url) => BlurHash(
                    hash: widget.user?.avatarHash ?? "KTGRB{\$~07~6xYEOE5WD-S",
                    imageFit: BoxFit.cover,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
